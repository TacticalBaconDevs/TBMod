using RGiesecke.DllExport;
using System;
using System.Collections.Generic;
using System.Data.SQLite;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;

namespace TBModExt_Statistics
{
    class DLLAPI
    {
        private static bool error = false;

#if WIN64
        [DllExport("RVExtensionVersion", CallingConvention = CallingConvention.Winapi)]
#else
        [DllExport("_RVExtensionVersion@8", CallingConvention = CallingConvention.Winapi)]
#endif
        public static void RvExtensionVersion(StringBuilder output, int outputSize)
        {
            output.Append("Test-Extension v1.0");
        }

#if WIN64
        [DllExport("RVExtension", CallingConvention = CallingConvention.Winapi)]
#else
        [DllExport("_RVExtension@12", CallingConvention = CallingConvention.Winapi)]
#endif
        public static void RvExtension(StringBuilder output, int outputSize,[MarshalAs(UnmanagedType.LPStr)] string function)
        {
            try
            {
                output.Append(function);
                Database.initDatabase();
                Database.missionname = function + "_" + DateTime.Now.ToString("dd-MM-yyyy_HH:mm:ss");
                error = false;
            }
            catch (Exception e)
            {
                try { File.AppendAllText("TBModExt_Statistics_ERRORs.log", "[" + DateTime.Now.ToString("dd.MM.yyyy HH.mm.ss") + "] ERROR3 - " + e.ToString() + "\n"); } catch (Exception) { };
                error = true;
            }
        }

#if WIN64
        [DllExport("RVExtensionArgs", CallingConvention = CallingConvention.Winapi)]
#else
        [DllExport("_RVExtensionArgs@20", CallingConvention = CallingConvention.Winapi)]
#endif
        public static int RvExtensionArgs(StringBuilder output, int outputSize,
            [MarshalAs(UnmanagedType.LPStr)] string function,
            [MarshalAs(UnmanagedType.LPArray, ArraySubType = UnmanagedType.LPStr, SizeParamIndex = 4)] string[] args, int argCount)
        {
            try
            {
                if (error)
                    return 1;

                if (Database.connection == null)
                    return 2;

                if (Database.missionname == null)
                    return 3;

                if (function != "sendQueue")
                    return 4;

                List<string> tes = (args as string[]).OfType<string>().ToList();
                output.Append(tes[0]);
                if (args.Length > 0)
                    ThreadPool.QueueUserWorkItem(new WaitCallback(ProcessInput), args);
            }
            catch (Exception e)
            {
                try { File.AppendAllText("TBModExt_Statistics_ERRORs.log", "[" + DateTime.Now.ToString("dd.MM.yyyy HH.mm.ss") + "] ERROR2 - " + e.ToString() + "\n"); } catch (Exception) { };
                error = true;
                return -1;
            }

            return 100;
        }

        public static void ProcessInput(object input)
        {
            try
            {
                List<string> args = (input as string[]).OfType<string>().ToList();

                if (args.Count <= 0)
                    return;
                if (args[0] == "Player")
                {
                    args.RemoveAt(0);
                    Database.insertValuePlayer(args.ToArray());
                }
                else if (args[0] == "Vehicle")
                {
                    args.RemoveAt(0);
                    Database.insertValueVehicle(args.ToArray());
                }
                    
            }
            catch (Exception e)
            {
                try { File.AppendAllText("TBModExt_Statistics_ERRORs.log", "[" + DateTime.Now.ToString("dd.MM.yyyy HH.mm.ss") + "] ERROR1 - " + e.ToString() + "\n"); } catch (Exception) { };
                error = true;
            }
        }
    }
}
