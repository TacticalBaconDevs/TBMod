using System;
using System.Collections;
using System.Data.SQLite;
using System.IO;
using System.Text;

namespace TBModExt_Statistics
{
    class Database
    {
        public static SQLiteConnection connection = null;
        public static String missionname;

        public static SQLiteConnection initDatabase()
        {
            SQLiteConnection dbConnection = new SQLiteConnection("Data Source="+ Environment.GetEnvironmentVariable("TBModExt_Statstracker") + "/statistics.sqlite;Version=3;");
            dbConnection.Open();

            SQLiteCommand command = new SQLiteCommand("CREATE TABLE IF NOT EXISTS shots_players (id INTEGER PRIMARY KEY AUTOINCREMENT,time DateTime, missionname TEXT, unitname TEXT, uuid TEXT, weapon TEXT, mode TEXT, pgroup TEXT, prole TEXT)", dbConnection);
            command.ExecuteNonQueryAsync();
            command.Dispose();

            SQLiteCommand command2 = new SQLiteCommand("CREATE TABLE IF NOT EXISTS shots_vehicle (id INTEGER PRIMARY KEY AUTOINCREMENT,time DateTime, missionname TEXT, vehicle TEXT,unitname TEXT, uuid TEXT, weapon TEXT, mode TEXT, pgroup TEXT, prole TEXT)", dbConnection);
            command2.ExecuteNonQueryAsync();
            command2.Dispose();
            
            SQLiteCommand command3 = new SQLiteCommand("CREATE TABLE IF NOT EXISTS medical (id INTEGER PRIMARY KEY AUTOINCREMENT,time DateTime, missionname TEXT, unitnamecaller TEXT, uuidcaller TEXT, unitnametarget TEXT, uuidtarget TEXT, selection TEXT, treatment TEXT, groupcaller TEXT, rolecaller TEXT, grouptarget TEXT, roletarget TEXT)", dbConnection);
            command3.ExecuteNonQueryAsync();
            command3.Dispose();

            connection = dbConnection;
            return dbConnection;
        }

 
 
 
        public static void insertValuePlayer(string[] values)
        {
            using (SQLiteCommand command = new SQLiteCommand(connection))
            {
                command.CommandText = "INSERT INTO shots_players (time, missionname, unitname, uuid, weapon, mode, pgroup, prole) VALUES (Datetime('now'), @missionname, @unitname, @uuid, @weapon, @mode, @pgroup, @prole)";
                command.Prepare();

                command.Parameters.AddWithValue("@missionname", missionname);
                command.Parameters.AddWithValue("@unitname", values[0]);
                command.Parameters.AddWithValue("@uuid", values[1]);
                command.Parameters.AddWithValue("@weapon", values[2]);
                command.Parameters.AddWithValue("@mode", values[3]);
                command.Parameters.AddWithValue("@pgroup", values[4]);
                command.Parameters.AddWithValue("@prole", values[5]);
                command.ExecuteNonQuery();
            }
        }

        public static void insertValueVehicle(string[] values)
        {
            using (SQLiteCommand command = new SQLiteCommand(connection))
            {
                command.CommandText = "INSERT INTO shots_vehicle (time, missionname, vehicle , unitname, uuid, weapon, mode, pgroup, prole) VALUES (Datetime('now'), @missionname, @vehicle, @unitname, @uuid, @weapon, @mode, @pgroup, @prole)";
                command.Prepare();

                command.Parameters.AddWithValue("@missionname", missionname);
                command.Parameters.AddWithValue("@vehicle", values[0]);
                command.Parameters.AddWithValue("@unitname", values[1]);
                command.Parameters.AddWithValue("@uuid", values[2]);
                command.Parameters.AddWithValue("@weapon", values[3]); 
                command.Parameters.AddWithValue("@mode", values[4]);
                command.Parameters.AddWithValue("@pgroup", values[5]);
                command.Parameters.AddWithValue("@prole", values[6]);
                command.ExecuteNonQuery();
            }
        }

        public static void insertValueMedical(string[] values)
        {
            using (SQLiteCommand command = new SQLiteCommand(connection))
            {
                command.CommandText = "INSERT INTO medical (time, missionname, unitnamecaller, uuidcaller, unitnametarget, uuidtarget, selection, treatment, groupcaller, rolecaller, grouptarget, roletarget) VALUES (Datetime('now'), @missionname, @unitnamecaller, @uuidcaller, @unitnametarget, @uuidtarget, @selection, @treatment, @groupcaller, @rolecaller, @grouptarget, @roletarget )";
                command.Prepare();

                command.Parameters.AddWithValue("@missionname", missionname);
                command.Parameters.AddWithValue("@unitnamecaller", values[0]);
                command.Parameters.AddWithValue("@uuidcaller", values[1]);
                command.Parameters.AddWithValue("@unitnametarget", values[2]);
                command.Parameters.AddWithValue("@uuidtarget", values[3]); 
                command.Parameters.AddWithValue("@selection", values[4]);
                command.Parameters.AddWithValue("@treatment", values[5]);
                command.Parameters.AddWithValue("@groupcaller", values[6]);
                command.Parameters.AddWithValue("@rolecaller", values[7]);
                command.Parameters.AddWithValue("@grouptarget", values[8]);
                command.Parameters.AddWithValue("@roletarget", values[9]);
                command.ExecuteNonQuery();
            }
        }
    }
}
