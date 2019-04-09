package TBMod.builder;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;
import java.util.Scanner;

public class App {

	private static final String cfgfile = "builder.cfg";

	public static void main(String[] args) throws IOException {
		try {

			doWork();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Press Enter to return.");
		System.in.read();

	}

	private static void doWork() throws IOException, FileNotFoundException {
		String outputDir = checkConfig();

		File[] addons = new File("addons").listFiles(file -> file.getName().startsWith("TBMod_"));
		for (File addonfolder : addons) {
			processAddon(addonfolder, outputDir);
		}
	}

	private static void processAddon(File addonfolder, String outputDir) throws IOException {
		System.out.println("Building " + addonfolder.getName() + " ...");
		Process p = new ProcessBuilder("MakePbo.exe", "-A", "-B", "-D", "-P",
				"-X=*.txt,*.dep,*.cpp,*.bak,*.png,*.log,*.pew,*.ini,*.rar", addonfolder.toString(), outputDir).start();
		String line;
		boolean error = true;
		BufferedReader inputerror = new BufferedReader(new InputStreamReader(p.getErrorStream()));
		BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
		StringBuilder incaserror = new StringBuilder();
		while ((line = input.readLine()) != null) {
			incaserror.append(line + "\n");
		}
		while ((line = inputerror.readLine()) != null) {
			incaserror.append(line + "\n");
			if (line.contains("No Error(s)")) {
				System.out.println(addonfolder.getName() + " build successful");
				error = false;
			}
		}
		if (error) {
			System.out.println(addonfolder.getName() + " build not successful. Dumping Process STDOUT & STDERR");
			System.out.println(incaserror);
		}

		input.close();

	}

	private static String checkConfig() throws IOException, FileNotFoundException {
		String outputDir = null;
		if (new File(cfgfile).exists()) {
			Properties properties = new Properties();
			properties.load(new FileInputStream(cfgfile));
			outputDir = properties.getProperty("OutputDir");
		} else {
			System.out.println("No Configuration file found.");
			System.out.println("Please enter output folder.");
			System.out.print("Path: ");
			Scanner scan = new Scanner(System.in);
			outputDir = scan.nextLine();
			scan.close();
			Properties properties = new Properties();
			properties.setProperty("OutputDir", outputDir);
			properties.store(new FileOutputStream(cfgfile), "TB Builder");
		}
		return outputDir;
	}
}
