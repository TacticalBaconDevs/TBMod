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
        public static Dictionary<int, MySqlConnection> Connections = new Dictionary<int, MySqlConnection>();
        public static String ConnString;
        public static String DBName;
        public static MySqlConnection InitDatabase()
        {
            DBName = "`curmission`";

            ConnString = Environment.GetEnvironmentVariable("TBModExt_StatstrackerConnstring");
            MySqlConnection dbConnection = new MySqlConnection(ConnString);
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

            MySqlCommand command6 = new MySqlCommand("CREATE TABLE IF NOT EXISTS CPS (time DateTime, unitname TEXT, cps INT)", dbConnection);
            command6.ExecuteNonQuery();
            command6.Dispose();

            MySqlCommand command7 = new MySqlCommand("CREATE TABLE IF NOT EXISTS FPS (time DateTime, unitname TEXT, fps INT)", dbConnection);
            command7.ExecuteNonQuery();
            command7.Dispose();

            MySqlCommand command8 = new MySqlCommand("CREATE TABLE IF NOT EXISTS kills (time DateTime, unitnamekiller TEXT, uuidkiller TEXT, unitnametarget TEXT, uuidtarget TEXT, killergroup TEXT, killerrole TEXT)", dbConnection);
            command8.ExecuteNonQuery();
            command8.Dispose();

            MySqlCommand command9 = new MySqlCommand("CREATE TABLE IF NOT EXISTS DownTime (time DateTime, unitname TEXT, uuid TEXT, downTime INT)", dbConnection);
            command9.ExecuteNonQuery();
            command9.Dispose();

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



        public static void InsertValuePlayer(string[] values)
        {
            GetDBConnection();

            using (MySqlCommand command = new MySqlCommand("INSERT INTO shots_players (time, unitname, uuid, weapon, mode, pgroup, prole) VALUES (CURRENT_TIMESTAMP(), @unitname, @uuid, @weapon, @mode, @pgroup, @prole)", GetDBConnection()))
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

        private static MySqlConnection GetDBConnection()
        {
            if (!Connections.ContainsKey(Thread.CurrentThread.ManagedThreadId))
            {
                MySqlConnection createconn = new MySqlConnection(ConnString);
                createconn.Open();
                SetupDB(createconn);
                Connections.Add(Thread.CurrentThread.ManagedThreadId, createconn);
            }
            MySqlConnection dbConnection;
            Connections.TryGetValue(Thread.CurrentThread.ManagedThreadId, out dbConnection);
            if (!dbConnection.Ping())
            {
                dbConnection = new MySqlConnection(ConnString);
                dbConnection.Open();
                SetupDB(dbConnection);
                Connections.Add(Thread.CurrentThread.ManagedThreadId, dbConnection);
            }
            return dbConnection;
        }

        public static void InsertValueVehicle(string[] values)
        {
            using (MySqlCommand command = new MySqlCommand("INSERT INTO shots_vehicle (`time`, vehicle , unitname, `uuid`, weapon, mode, pgroup, prole) VALUES (CURRENT_TIMESTAMP(), @vehicle, @unitname, @uuid, @weapon, @mode, @pgroup, @prole)", GetDBConnection()))
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

        public static void InsertValueMedical(string[] values)
        {
            using (MySqlCommand command = new MySqlCommand("INSERT INTO medical (`time`, unitnamecaller, uuidcaller, unitnametarget, uuidtarget, selection, treatment, groupcaller, rolecaller, grouptarget, roletarget) VALUES (CURRENT_TIMESTAMP(), @unitnamecaller, @uuidcaller, @unitnametarget, @uuidtarget, @selection, @treatment, @groupcaller, @rolecaller, @grouptarget, @roletarget )", GetDBConnection()))
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
        public static void InsertValueKill(string[] values)
        {
            using (MySqlCommand command = new MySqlCommand("INSERT INTO kills (`time`, unitnamekiller, uuidkiller, unitnametarget, uuidtarget, killergroup, killerrole) " +
                "VALUES (CURRENT_TIMESTAMP(), @unitnamekiller, @uuidkiller, @unitnametarget, @uuidtarget, @killergroup, @killerrole)", GetDBConnection()))
            {
                command.Prepare();

                command.Parameters.AddWithValue("@unitnamekiller", values[0]);
                command.Parameters.AddWithValue("@uuidkiller", values[1]);
                command.Parameters.AddWithValue("@unitnametarget", values[2]);
                command.Parameters.AddWithValue("@uuidtarget", values[3]);
                command.Parameters.AddWithValue("@killergroup", values[4]);
                command.Parameters.AddWithValue("@killerrole", values[5]);

                command.ExecuteNonQuery();
            }
        }

        public static void InsertValueFps(string[] values)
        {
            using (MySqlCommand command = new MySqlCommand("INSERT INTO `FPS` (`time`, unitname, `fps`) VALUES (NOW(), @unitname, @fps)", GetDBConnection()))
            {
                command.Prepare();

                command.Parameters.AddWithValue("@unitname", values[0]);
                command.Parameters.AddWithValue("@fps", Convert.ToDouble(values[1]));

                command.ExecuteNonQuery();
            }
        }

        public static void InsertValueCps(string[] values)
        {
            using (MySqlCommand command = new MySqlCommand("INSERT INTO `CPS` (`time`, unitname, `cps`) VALUES (NOW(), @unitname, @cps)", GetDBConnection()))
            {
                command.Prepare();

                command.Parameters.AddWithValue("@unitname", values[0]);
                command.Parameters.AddWithValue("@cps", Convert.ToDouble(values[1]));

                command.ExecuteNonQuery();
            }
        }

        public static void InsertValueDownTime(string[] values)
        {
            using (MySqlCommand command = new MySqlCommand("INSERT INTO `DownTime` (`time`, unitname, `uuid`, downTime) VALUES (NOW(), @unitname, @uuid, @downTime)", GetDBConnection()))
            {
                command.Prepare();

                command.Parameters.AddWithValue("@unitname", values[0]);
                command.Parameters.AddWithValue("@uuid", values[1]);
                command.Parameters.AddWithValue("@downTime", Convert.ToInt32(values[2]));

                command.ExecuteNonQuery();
            }
        }
    }
}
