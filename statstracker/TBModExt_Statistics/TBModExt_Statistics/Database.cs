using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Threading;

namespace TBModExt_Statistics
{
    class Database
    {
        public static Dictionary<int, MySqlConnection> connections = new Dictionary<int, MySqlConnection>();
        public static String connString;
        public static String DBName;
        public static MySqlConnection initDatabase()
        {
            DBName = "`curmission`";

            //MySqlConnection dbConnection = new MySqlConnection("Data Source="+ Environment.GetEnvironmentVariable("TBModExt_Statstracker") + "/" + missionname + ".sqlite;Version=3;");
            connString = Environment.GetEnvironmentVariable("TBModExt_StatstrackerConnstring");
            MySqlConnection dbConnection = new MySqlConnection(connString);
            dbConnection.Open();
            SetupDB(dbConnection);

            MySqlCommand command = new MySqlCommand("CREATE TABLE IF NOT EXISTS shots_players (time DateTime, unitname TEXT, uuid TEXT, weapon TEXT, mode TEXT, pgroup TEXT, prole TEXT)", dbConnection);
            command.ExecuteNonQuery();
            command.Dispose();

            MySqlCommand command2 = new MySqlCommand("CREATE TABLE IF NOT EXISTS shots_vehicle (time DateTime, vehicle TEXT,unitname TEXT, uuid TEXT, weapon TEXT, mode TEXT, pgroup TEXT, prole TEXT)", dbConnection);
            command2.ExecuteNonQuery();
            command2.Dispose();

            MySqlCommand command3 = new MySqlCommand("CREATE TABLE IF NOT EXISTS medical (time DateTime, unitnamecaller TEXT, uuidcaller TEXT, unitnametarget TEXT, uuidtarget TEXT, selection TEXT, treatment TEXT, groupcaller TEXT, rolecaller TEXT, grouptarget TEXT, roletarget TEXT)", dbConnection);
            command3.ExecuteNonQuery();
            command3.Dispose();

            MySqlCommand command4 = new MySqlCommand("CREATE TABLE IF NOT EXISTS position (time DateTime, unitname TEXT, uuid TEXT, xpos INT, ypos INT, pgroup TEXT, prole TEXT)", dbConnection);
            command4.ExecuteNonQuery();
            command4.Dispose();

            MySqlCommand command5 = new MySqlCommand("CREATE TABLE IF NOT EXISTS kiposition (time DateTime, unitname TEXT, xpos INT, ypos INT, pgroup TEXT)", dbConnection);
            command5.ExecuteNonQuery();
            command5.Dispose();

            MySqlCommand command6 = new MySqlCommand("CREATE TABLE IF NOT EXISTS CPS (time DateTime, unitname TEXT, cps INT)", dbConnection);
            command6.ExecuteNonQuery();
            command6.Dispose();

            MySqlCommand command7 = new MySqlCommand("CREATE TABLE IF NOT EXISTS FPS (time DateTime, unitname TEXT, fps INT)", dbConnection);
            command7.ExecuteNonQuery();
            command7.Dispose();

            return dbConnection;
        }

        private static void SetupDB(MySqlConnection dbConnection)
        {
            MySqlCommand createdb = new MySqlCommand("CREATE DATABASE IF NOT EXISTS " + DBName, dbConnection);
            createdb.ExecuteNonQuery();
            createdb.Dispose();

            MySqlCommand usedb = new MySqlCommand("USE " + DBName, dbConnection);
            usedb.ExecuteNonQuery();
            usedb.Dispose();
        }



        public static void insertValuePlayer(string[] values)
        {
            getDBConnection();

            using (MySqlCommand command = new MySqlCommand("INSERT INTO shots_players (time, unitname, uuid, weapon, mode, pgroup, prole) VALUES (CURRENT_TIMESTAMP(), @unitname, @uuid, @weapon, @mode, @pgroup, @prole)", getDBConnection()))
            {
                command.Prepare();

                command.Parameters.AddWithValue("@unitname", values[0]);
                command.Parameters.AddWithValue("@uuid", values[1]);
                command.Parameters.AddWithValue("@weapon", values[2]);
                command.Parameters.AddWithValue("@mode", values[3]);
                command.Parameters.AddWithValue("@pgroup", values[4]);
                command.Parameters.AddWithValue("@prole", values[5]);

                command.ExecuteNonQuery();

            }
        }

        private static MySqlConnection getDBConnection()
        {
            if (!connections.ContainsKey(Thread.CurrentThread.ManagedThreadId))
            {
                MySqlConnection createconn = new MySqlConnection(connString);
                createconn.Open();
                SetupDB(createconn);
                connections.Add(Thread.CurrentThread.ManagedThreadId, createconn);
            }
            MySqlConnection dbConnection;
            connections.TryGetValue(Thread.CurrentThread.ManagedThreadId, out dbConnection);
            if (!dbConnection.Ping())
            {
                dbConnection = new MySqlConnection(connString);
                dbConnection.Open();
                SetupDB(dbConnection);
                connections.Add(Thread.CurrentThread.ManagedThreadId, dbConnection);
            }
            return dbConnection;
        }

        public static void insertValueVehicle(string[] values)
        {
            using (MySqlCommand command = new MySqlCommand("INSERT INTO shots_vehicle (`time`, vehicle , unitname, `uuid`, weapon, mode, pgroup, prole) VALUES (CURRENT_TIMESTAMP(), @vehicle, @unitname, @uuid, @weapon, @mode, @pgroup, @prole)", getDBConnection()))
            {
                command.Prepare();
                
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
            using (MySqlCommand command = new MySqlCommand("INSERT INTO medical (`time`, unitnamecaller, uuidcaller, unitnametarget, uuidtarget, selection, treatment, groupcaller, rolecaller, grouptarget, roletarget) VALUES (CURRENT_TIMESTAMP(), @unitnamecaller, @uuidcaller, @unitnametarget, @uuidtarget, @selection, @treatment, @groupcaller, @rolecaller, @grouptarget, @roletarget )", getDBConnection()))
            {
                command.Prepare();

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

        public static void insertValuePosition(string[] values)
        {
            using (MySqlCommand command = new MySqlCommand("INSERT INTO `POSITION` (`time`, unitname, `uuid`, xpos, ypos, pgroup, prole) VALUES (NOW(), @unitname, @uuid, @xpos, @ypos, @pgroup, @prole)", getDBConnection()))
            {
                command.Prepare();
                
                command.Parameters.AddWithValue("@unitname", values[0]);
                command.Parameters.AddWithValue("@uuid", values[1]);
                command.Parameters.AddWithValue("@xpos", Convert.ToDouble(values[2]));
                command.Parameters.AddWithValue("@ypos", Convert.ToDouble(values[3]));
                command.Parameters.AddWithValue("@pgroup", values[4]);
                command.Parameters.AddWithValue("@prole", values[5]);

                command.ExecuteNonQuery();
            }
        }

        public static void insertValueKIPosition(string[] values)
        {
            using (MySqlCommand command = new MySqlCommand("INSERT INTO kiposition (`time`, unitname, xpos, ypos, pgroup) VALUES (CURRENT_TIMESTAMP(), @unitname, @xpos, @ypos, @pgroup)", getDBConnection()))
            {
                command.Prepare();
                command.Parameters.Add(new MySqlParameter("@unitname", MySqlDbType.Text));
                command.Parameters.Add(new MySqlParameter("@xpos", MySqlDbType.Int32));
                command.Parameters.Add(new MySqlParameter("@ypos", MySqlDbType.Int32));
                command.Parameters.Add(new MySqlParameter("@pgroup", MySqlDbType.Text));
                command.Transaction = getDBConnection().BeginTransaction();
                for(int i = 0; i < values.Length; i=i+4)
                {
                    command.Parameters["@unitname"].Value = values[i];
                    command.Parameters["@xpos"].Value = Convert.ToInt32(values[i+1]);
                    command.Parameters["@ypos"].Value = Convert.ToInt32(values[i+2]);
                    command.Parameters["@pgroup"].Value = values[i+3];
                    command.ExecuteNonQuery();
                }
                command.Transaction.Commit();
                
            }
        }

        public static void insertValueFPS(string[] values)
        {
            using (MySqlCommand command = new MySqlCommand("INSERT INTO `FPS` (`time`, unitname, `fps`) VALUES (NOW(), @unitname, @fps)", getDBConnection()))
            {
                command.Prepare();

                command.Parameters.AddWithValue("@unitname", values[0]);
                command.Parameters.AddWithValue("@fps", Convert.ToDouble(values[1]));

                command.ExecuteNonQuery();
            }
        }

        public static void insertValueCPS(string[] values)
        {
            using (MySqlCommand command = new MySqlCommand("INSERT INTO `CPS` (`time`, unitname, `cps`) VALUES (NOW(), @unitname, @cps)", getDBConnection()))
            {
                command.Prepare();

                command.Parameters.AddWithValue("@unitname", values[0]);
                command.Parameters.AddWithValue("@cps", Convert.ToDouble(values[1]));

                command.ExecuteNonQuery();
            }
        }
    }
}
