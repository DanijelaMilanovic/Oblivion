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

namespace Oblivion_Prototip
{
    /// <summary>
    /// Interaction logic for UcRacunar.xaml
    /// </summary>
    public partial class UcRacunar : UserControl
    {
        StackPanel podaci;
        public int BrojRacunara { get; set; }
        public string MreznoIme { get; set; }

        public UcRacunar(string mrezno_ime,StackPanel podaci,int brojRacunara)
        {
            InitializeComponent();
            lblNaziv.Content = mrezno_ime;
            this.podaci = podaci;
            this.BrojRacunara = brojRacunara;
            this.MreznoIme = mrezno_ime;
        }

        private void UserControl_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            podaci.Children.Clear();
            UcZauzmi zauzmi = new UcZauzmi(BrojRacunara,lblNaziv.Content.ToString());
            podaci.Children.Add(zauzmi);
        }
    }
}
