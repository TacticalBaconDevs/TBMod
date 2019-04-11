package de.tacticalbacon.TBMod_Builder;

import java.awt.GraphicsEnvironment;
import java.io.BufferedReader;
import java.io.Console;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Scanner;

public class Main {

	private static final String cfgfile = "builder.cfg";
	private static final String version = "1.0.0";
	private static Properties properties = new Properties();
	private static Map<String, String> overrides = new HashMap<>();
	private static boolean buildFailure = false;

	public static void main(String[] args) throws Exception {
		// per Doppelklick gestartet, neu mit Console aufrufen
		Console console = System.console();
		boolean inIDE = System.getProperty("java.class.path").toLowerCase().contains("eclipse");
        if (!inIDE && console == null && !GraphicsEnvironment.isHeadless()){
            String filename = new File(Main.class.getProtectionDomain().getCodeSource().getLocation().toURI()).getPath();
            Runtime.getRuntime().exec(String.format("cmd /c start cmd /c java -jar \"%s\"", filename));
            return;
        }
        
		System.out.println("TBMod Builder v"+ version +" gestartet...");
		
		// Argument-Support
		if (args.length != 0) {
			System.out.println("Parameter erkannt: "+ Arrays.toString(args));
			
			List<String> argumente = Arrays.asList(args);
			argumente.stream().map((item) -> item.startsWith("-") ? item.substring(1).trim() : item.trim()).forEach((item) -> {
				// PropertiesOverride
				if (item.contains(":")) {
					String[] split = item.split(":");
					overrides.put(split[0].trim(), split[1].replace("\"", "").trim());
				}
			});
		}
		
		try {
			initConfig();
			
			String outputDir = getProperty("OutputDir");
			
			File[] addons = new File("addons").listFiles(file -> file.getName().startsWith("TBMod_"));
			for (File addonfolder : addons)
				processAddon(addonfolder, outputDir);
			
			System.out.println("Ende");
			if (getProperty("WaitOnNormalEnd?").equals("true") || buildFailure)
				requestClose();
		} catch (Exception e) {
			System.out.println("Es kam zu einem Fehler: ");
			e.printStackTrace();
			requestClose();
		}
	}
	
	private static void requestClose() {
		try {
			System.out.println("Drücke Enter zum beenden.");
			System.in.read();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private static void initConfig() throws Exception {
		if (new File(cfgfile).exists()) {
			properties.load(new FileInputStream(cfgfile));
		} else {
			System.out.println("Keine Konfiguration gefunden, starte Erstellung!");
			
			// ### Ausgabeort
			System.out.println("Gib den Pfad zum Ausgabeort für die PBOs an (...\\@TBMod_dev\\addons) an:");
			System.out.print("Eingabe: ");
			
			Scanner scanner = new Scanner(System.in);
			for (int i = 0; i < 3; i++) {
				String path = scanner.nextLine().trim().replace("\"", "");
				
				if (Files.notExists(Paths.get(path))) {
					System.out.println("Der angegebene Pfad existiert nicht, bitte überprüfe ihn nochmal!");
					continue;
				}
				
				properties.setProperty("OutputDir", path);
				break;
			}
			
			if (!properties.containsKey("OutputDir")) {
				scanner.close();
				throw new Exception("Benutzer war nicht gut genug bei DREI Versuchen einen gültigen Pfad einzugeben!");
			}
			
			// ### WaitOnNormalEnd
			System.out.println("Gib an, ob bei einem erfolgreichem Build das Fenster offen bleiben soll (true/false):");
			System.out.print("Eingabe (true): ");
			
			for (int i = 0; i < 3; i++) {
				String staiyOpen = scanner.nextLine().trim().replace("\"", "");
				
				if (staiyOpen == null || staiyOpen.isEmpty())
					staiyOpen = "true";
				
				if (!staiyOpen.equals("true") && !staiyOpen.equals("false")) {
					System.out.println("Die Antwort muss ein Boolean (true/false) sein.");
					continue;
				}
				
				properties.setProperty("WaitOnNormalEnd?", staiyOpen);
				break;
			}
			
			if (!properties.containsKey("WaitOnNormalEnd?")) {
				scanner.close();
				throw new Exception("Benutzer war nicht gut genug bei DREI Versuchen einen gültigen Boolean einzugeben!");
			}
			
			scanner.close();
			properties.store(new FileOutputStream(cfgfile), "TBMod Builder");
		}
	}

	private static void processAddon(File addonfolder, String outputDir) throws Exception {
		BufferedReader inputerror = null;
		BufferedReader input = null;
		
		try {
			System.out.println("Baue " + addonfolder.getName() + " ...");
			
			File pbo = new File(String.format("%s\\%s.pbo", outputDir, addonfolder.getName()));
			if (pbo.exists() && getLastModified(addonfolder).before(getLastModified(pbo))) {
				System.out.println("\t>>> Überspringe, da bereits aktuell!");
				return;
			}
			
			Process p = new ProcessBuilder("MakePbo.exe", "-A", "-B", "-D", "-P",
					"-X=*.txt,*.dep,*.cpp,*.bak,*.png,*.log,*.pew,*.ini,*.rar", addonfolder.toString(), outputDir).start();
			String line;
			boolean error = true;
			inputerror = new BufferedReader(new InputStreamReader(p.getErrorStream()));
			input = new BufferedReader(new InputStreamReader(p.getInputStream()));
			StringBuilder incaserror = new StringBuilder();
			while ((line = input.readLine()) != null) {
				incaserror.append(line + "\n");
			}
			while ((line = inputerror.readLine()) != null) {
				incaserror.append(line + "\n");
				if (line.contains("No Error(s)")) {
					System.out.println("\t> "+ addonfolder.getName() + " erfolgreich gebaut!");
					error = false;
				}
			}
			if (error) {
				buildFailure = true;
				System.out.println("\t!!! "+ addonfolder.getName() + " wurde nicht erfolgreich gebaut. Fehler folgt...");
				System.out.println(incaserror);
			}
		} finally {
			if (inputerror != null)
				inputerror.close();
			if (input != null)
				input.close();
		}
	}
	
	private static String getProperty(String key) throws Exception {
		String result = overrides.containsKey(key) ? overrides.get(key) : properties.getProperty(key);
		
		if (result == null || result.isEmpty())
			throw new Exception(String.format("PropertyKey '%s' ist leer, bearbeite den Wert in der '%s' richtig.", key, cfgfile));
		
		if ((result.contains(":") || key.toLowerCase().endsWith("dir")) && Files.notExists(Paths.get(result)))
			throw new Exception(String.format("PropertyKey '%s' ist kein gültiger Pfad, bearbeite den Wert in der '%s' richtig.", key, cfgfile));
		
		if (key.endsWith("?") && !result.equals("true") && !result.equals("false"))
			throw new Exception(String.format("PropertyKey '%s' ist kein gültiger Boolean (true/false), bearbeite den Wert in der '%s' richtig.", key, cfgfile));
		
		return result;
	}
	
	
	//Sub files need to be also tested
	public static Date getLastModified(File input) {
		if (input.isFile())
			return new Date(input.lastModified());
		
		File[] directories = input.listFiles(file -> file.isDirectory());
	    File[] files = input.listFiles(file -> file.isFile());
	    
	    if (files.length == 0 && directories.length == 0)
	    	return new Date(input.lastModified());
	    
	    Long[] moddates = new Long[directories.length+files.length];
	    for (int i = 0; i < directories.length; i++) {
			moddates[i] = getLastModified(directories[i]).getTime();
		}
	    for (int i = 0; i < files.length; i++) {
	    	moddates[directories.length+i] = files[i].lastModified();
		}
	    
	    
	    Arrays.sort(moddates, (o1,o2) -> o2.compareTo(o1));
	    return new Date(moddates[0]);
	}
	
}
