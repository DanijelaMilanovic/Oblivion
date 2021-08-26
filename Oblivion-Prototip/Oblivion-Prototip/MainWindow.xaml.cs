﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

using MySql.Data.MySqlClient;

namespace Oblivion_Prototip
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Logika izlaza iz aplikacije i omogućavanje promjene prikaza
        /// </summary>
        #region Upravljanje prikazom i izlazom iz aplikacije
        private void LogInWindow_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Escape)
            {
                WindowState = WindowState.Normal;
                WindowStyle = WindowStyle.ThreeDBorderWindow;
            }

        }

        private void LogInWindow_StateChanged(object sender, EventArgs e)
        {
            if (WindowState == WindowState.Maximized)
            {
                WindowStyle = WindowStyle.None;
            }
        }
        #endregion

        /// <summary>
        /// Prijava na sistem 
        /// </summary>
        #region SignIn
        private void btnSignIn_Click(object sender, RoutedEventArgs e)
        {
            MySqlDataReader reader = null;
            try
            {
                string cmd_string = "SELECT * FROM `igraonica`.`radnik` WHERE `radnik`.`korisnicko_ime`='" + tbKorisnickoIme.Text + "' AND `radnik`.`lozinka`=PASSWORD('" + pbLozinka.Password + "');";
                MySqlCommand cmd = new MySqlCommand(cmd_string, Connection.GetConnection());
                reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    if (reader.GetInt32("administrator") == 1)
                    {
                        tbKorisnickoIme.Text = "";
                        pbLozinka.Password = "";
                        lblGreska.Content = "";
                        MessageBox.Show("ADMIN");
                    }
                    else if (reader.GetInt32("administrator") == 0)
                    {
                        tbKorisnickoIme.Text = "";
                        pbLozinka.Password = "";
                        lblGreska.Content = "";
                        MessageBox.Show("Nije admin");
                    }
                }
                else
                {
                    tbKorisnickoIme.Text = "";
                    pbLozinka.Password = "";
                    lblGreska.Content = "Unijeli ste pogrešne podatke!";
                }
            }
            catch
            {
                MessageBox.Show("Neuspješno čitanje iz baze podataka", "Greška",MessageBoxButton.OK, MessageBoxImage.Error);
            }
            finally
            {
                if (reader != null)
                {
                    reader.Close();
                }
            }
        }
        #endregion
    }
}
