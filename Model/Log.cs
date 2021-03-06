using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Text.Json;

namespace EasySave_Interface.Model
{
    class Log
    {
        public string backupName { get; set; }
        public string sourcePath { get; set; }
        public string destPath { get; set; }
        public string date { get; set; }
        public LogFile[] logsFile { get; set; }

        public Log(string backupName, string sourcePath, string destPath, LogFile[] logFiles, string date)
        {
           this.backupName = backupName;
            this.sourcePath = sourcePath;
            this.destPath = destPath;
            this.date = date;
            this.logsFile = logFiles;
        }

       

        public void Writelog()
        {
            string documentPath = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
            string logPath = documentPath + "\\EasySave\\logs";

            if (!Directory.Exists(logPath)) Directory.CreateDirectory(logPath);

            var json = JsonSerializer.Serialize(this);
            File.WriteAllText($"{logPath}\\{this.date}.json", json);
        }
    }
}
