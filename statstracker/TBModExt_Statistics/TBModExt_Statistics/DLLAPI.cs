﻿using RGiesecke.DllExport;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;

namespace TBModExt_Statistics
{
    class DLLAPI
    {

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
            }
            
            catch (Exception e)
            {
                output.Append("Error");
                try { File.AppendAllText("TBModExt_Statistics_ERRORs.log", "[" + DateTime.Now.ToString("dd.MM.yyyy HH.mm.ss") + "] ERROR3 - " + e.ToString() + "\n"); } catch (Exception) { };
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
                
                if (function == "Player")
                    ThreadPool.QueueUserWorkItem(new WaitCallback(ProcessInputPlayerShot), args);
                if (function == "Vehicle")
                    ThreadPool.QueueUserWorkItem(new WaitCallback(ProcessInputVehicleShot), args);
                if (function == "Medical")
                    ThreadPool.QueueUserWorkItem(new WaitCallback(ProcessInputMedical), args);
                if (function == "Position")
                    ThreadPool.QueueUserWorkItem(new WaitCallback(ProcessInputPosition), args);
                if (function == "KIPosition")
                    ThreadPool.QueueUserWorkItem(new WaitCallback(ProcessInputKIPosition), args);
                if (function == "CPS")
                    ThreadPool.QueueUserWorkItem(new WaitCallback(ProcessInputCPS), args);
                if (function == "FPS")
                    ThreadPool.QueueUserWorkItem(new WaitCallback(ProcessInputFPS), args);


            }
            catch (Exception e)
            {
                try { File.AppendAllText("TBModExt_Statistics_ERRORs.log", "[" + DateTime.Now.ToString("dd.MM.yyyy HH.mm.ss") + "] ERROR2 - " + e.ToString() + "\n"); } catch (Exception) { };
                return -1;
            }

            return 100;
        }

        public static void ProcessInputPlayerShot(object input)
        {
            try
            {
                List<string> args = (input as string[]).OfType<string>().ToList();
                 Database.insertValuePlayer(args.ToArray());
                
                    
            }
            catch (Exception e)
            {
                try { File.AppendAllText("TBModExt_Statistics_ERRORs.log", "[" + DateTime.Now.ToString("dd.MM.yyyy HH.mm.ss") + "] ERROR1 - " + e.ToString() + "\n"); } catch (Exception) { };
            }
        }

        public static void ProcessInputVehicleShot(object input)
        {
            try
            {
                List<string> args = (input as string[]).OfType<string>().ToList();
                Database.insertValueVehicle(args.ToArray());
            }
            catch (Exception e)
            {
                try { File.AppendAllText("TBModExt_Statistics_ERRORs.log", "[" + DateTime.Now.ToString("dd.MM.yyyy HH.mm.ss") + "] ERROR1 - " + e.ToString() + "\n"); } catch (Exception) { };
            }
        }

        public static void ProcessInputMedical(object input)
        {
            try
            {
                List<string> args = (input as string[]).OfType<string>().ToList();
                Database.insertValueMedical(args.ToArray());
            }
            catch (Exception e)
            {
                try { File.AppendAllText("TBModExt_Statistics_ERRORs.log", "[" + DateTime.Now.ToString("dd.MM.yyyy HH.mm.ss") + "] ERROR1 - " + e.ToString() + "\n"); } catch (Exception) { };
            }
        }

        public static void ProcessInputPosition(object input)
        {
            try
            {
                List<string> args = (input as string[]).OfType<string>().ToList();
                Database.insertValuePosition(args.ToArray());
            }
            catch (Exception e)
            {
                try { File.AppendAllText("TBModExt_Statistics_ERRORs.log", "[" + DateTime.Now.ToString("dd.MM.yyyy HH.mm.ss") + "] ERROR1 - " + e.ToString() + "\n"); } catch (Exception) { };
            }
        }

        public static void ProcessInputKIPosition(object input)
        {
            try
            {
                List<string> args = (input as string[]).OfType<string>().ToList();
                Database.insertValueKIPosition(args.ToArray());
            }
            catch (Exception e)
            {
                try { File.AppendAllText("TBModExt_Statistics_ERRORs.log", "[" + DateTime.Now.ToString("dd.MM.yyyy HH.mm.ss") + "] ERROR1 - " + e.ToString() + "\n"); } catch (Exception) { };
            }
        }

        public static void ProcessInputFPS(object input)
        {
            try
            {
                List<string> args = (input as string[]).OfType<string>().ToList();
                Database.insertValueFPS(args.ToArray());
            }
            catch (Exception e)
            {
                try { File.AppendAllText("TBModExt_Statistics_ERRORs.log", "[" + DateTime.Now.ToString("dd.MM.yyyy HH.mm.ss") + "] ERROR1 - " + e.ToString() + "\n"); } catch (Exception) { };
            }
        }

        public static void ProcessInputCPS(object input)
        {
            try
            {
                List<string> args = (input as string[]).OfType<string>().ToList();
                Database.insertValueCPS(args.ToArray());
            }
            catch (Exception e)
            {
                try { File.AppendAllText("TBModExt_Statistics_ERRORs.log", "[" + DateTime.Now.ToString("dd.MM.yyyy HH.mm.ss") + "] ERROR1 - " + e.ToString() + "\n"); } catch (Exception) { };
            }
        }
    }
}
