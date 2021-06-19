using System;
using System.IO;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Imaging;
using Microsoft.Win32;
using System.Drawing;
using System.Diagnostics;
using System.Windows.Forms;
using WinForms = System.Windows.Forms;
using System.Data;
using System.Timers;
using System.Windows.Media;


namespace EasySave_Interface
{

    public partial class MainWindow : Window
    {
        public ViewModel.ViewModel viewModel;
        private System.Timers.Timer timer;

        public MainWindow()
        {
            InitializeComponent();
            this.viewModel = new ViewModel.ViewModel(this);
            this.viewModel.CountAndClose();
            this.Backups.ItemsSource = this.viewModel.backups;
            this.timer = new System.Timers.Timer(500);
            timer.Elapsed += ((Object source, ElapsedEventArgs e) => this.updateBackupsList());
            timer.AutoReset = true;
            timer.Enabled = true;
        }

        private void launch_Click(object sender, RoutedEventArgs e)
        {
            string name = "";
            //this.totalFile.Value = 0;
            if (name == "") this.sourcePath.Text.Substring(this.sourcePath.Text.LastIndexOf(@"\") + 1);

            string backupType = "complete";

            this.viewModel.PrepareBackup(name, this.sourcePath.Text, this.destinationPath.Text, backupType, false);
        }

        

        public void initField(string sourcePath, string destinationPath, string presetName)
        {
            this.sourcePath.Text = sourcePath;
            this.destinationPath.Text = destinationPath;
        }

        private void DispatchingPrint(string text)
        {
            try
            {
                this.Dispatcher.Invoke(() => this.status.Items.Add(text));
            }
            catch { }
        }

        public void PrintError(string errorName)
        {
            this.DispatchingPrint($"Error: {errorName}");
        }

        public void PrintWarning(string errorName)
        {
            this.DispatchingPrint($"Warning: {errorName}");
        }

        public void printFileSaved(string fileName)
        {
            this.DispatchingPrint($"{fileName}: File updated");
        }

        public void printSuccess(string processName)
        {
            this.DispatchingPrint($"{processName}: Success");
        }

        public void printLaunch(string processName)
        {
            this.DispatchingPrint($"{processName}: Launch");
        }

        public void PrintSocket(string texte)
        {
            this.DispatchingPrint($"Socket : {texte}");
        }

       

       


        

        private void quit_Click(object sender, RoutedEventArgs e)
        {
            SocketDis_Click(sender, e);
            System.Windows.Application.Current.Shutdown();
        }

        private void source_Click(object sender, RoutedEventArgs e)
        {
            WinForms.FolderBrowserDialog folderDialog = new WinForms.FolderBrowserDialog();
            folderDialog.ShowNewFolderButton = false;
            folderDialog.SelectedPath = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
            WinForms.DialogResult result = folderDialog.ShowDialog();

            if (result == WinForms.DialogResult.OK)
            {
                this.sourcePath.Text = folderDialog.SelectedPath;              
            }
        }

        private void dest_Click(object sender, RoutedEventArgs e)
        {
            WinForms.FolderBrowserDialog folderDialog = new WinForms.FolderBrowserDialog();
            folderDialog.ShowNewFolderButton = false;
            folderDialog.SelectedPath = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
            WinForms.DialogResult result = folderDialog.ShowDialog();

            if (result == WinForms.DialogResult.OK)
            {
                this.destinationPath.Text = folderDialog.SelectedPath;
            }
        }

        private void SocketServer_Click(object sender, RoutedEventArgs e)
        {
            this.viewModel.LaunchSS();
            SocketStatus.Foreground = new SolidColorBrush(Colors.Green);
            SocketStatus.Text = "On";
        }

        private void SocketDis_Click(object sender, RoutedEventArgs e)
        {
            try
            { 
                this.viewModel.LaunchSSDis();
                SocketStatus.Foreground = new SolidColorBrush(Colors.Red);
                SocketStatus.Text = "Off";
            }
            catch (NullReferenceException)
            {
                throw new NotImplementedException();
            }
        }

        private void Openparametre(object sender, RoutedEventArgs e)
        {
            Parametre objParametre = new Parametre(this);
            this.Visibility = Visibility.Visible;
            objParametre.ShowDialog();
        }

        public void updateBackupsList()
        {
            try
            {
                this.Dispatcher.Invoke(() =>
                {
                    this.Backups.Items.Refresh();
                });
            }
            catch { }
        }

        private void btnStop_Click(object sender, RoutedEventArgs e)
        {
            Model.Backup backup = (Model.Backup)((System.Windows.Controls.Button)e.Source).DataContext;
            this.viewModel.StopBackup(backup);
        }

        private void btnPlay_Click(object sender, RoutedEventArgs e)
        {
            Model.Backup backup = (Model.Backup)((System.Windows.Controls.Button)e.Source).DataContext;
            this.viewModel.ResumeBackup(backup);
        }

        private void btnPause_Click(object sender, RoutedEventArgs e)
        {
            Model.Backup backup = (Model.Backup)((System.Windows.Controls.Button)e.Source).DataContext;
            this.viewModel.PauseBackup(backup);
        }
    }
}
