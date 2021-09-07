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
    /// Interaction logic for UcPromjenaPodataka.xaml
    /// </summary>
    public partial class UcPromjenaPodataka : UserControl
    {
        AdminWindow parentWindow;

        public UcPromjenaPodataka(AdminWindow parentWindow)
        {
            InitializeComponent();
            this.parentWindow = parentWindow;
            ucitavanje();
        }

        private void ucitavanje()
        {
            tbKorisnickoIme.Text = parentWindow.admin.KorisnickoIme;
            pbLozinka.IsEnabled = false;
            pbAutorizacija.IsEnabled = false;
        }

        private void cbPromjenaSifre_Checked(object sender, RoutedEventArgs e)
        {
            pbLozinka.IsEnabled = (bool)cbPromjenaSifre.IsChecked;
            pbAutorizacija.IsEnabled = (bool)cbPromjenaSifre.IsChecked;
        }

        private void btnOdustani_Click(object sender, RoutedEventArgs e)
        {
            parentWindow.ciscenjeSPa();
            parentWindow.btnDodajNovogZaposlenika.Visibility = Visibility.Visible;
        }

        private void btnPotvrda_Click(object sender, RoutedEventArgs e)
        {
            if (tbKorisnickoIme.Text != "")
            {
                if ((bool)cbPromjenaSifre.IsChecked)
                {
                    if (pbLozinka.Password == pbAutorizacija.Password)
                    {
                        if (pbLozinka.Password.Length > 4)
                        {
                            bool izvrsena_promjena = parentWindow.admin.promjenaKorisnickogImenaiSifre(tbKorisnickoIme.Text, pbLozinka.Password, (bool)cbPromjenaSifre.IsChecked);
                            if (izvrsena_promjena)
                            {
                                parentWindow.btnOdjava.RaiseEvent(new RoutedEventArgs(Button.ClickEvent));
                            }
                           
                        }
                        else
                        {
                            MessageBox.Show("Lozinka mora imati više od 4 karaktera.", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                        }
                    }
                    else
                    {
                        MessageBox.Show("Lozinka nije potvrđena.", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                    }
                }
                else
                {
                    bool izvrsena_promjena = parentWindow.admin.promjenaKorisnickogImenaiSifre(tbKorisnickoIme.Text, pbLozinka.Password, (bool)cbPromjenaSifre.IsChecked);
                    if (izvrsena_promjena)
                    {
                        parentWindow.btnOdjava.RaiseEvent(new RoutedEventArgs(Button.ClickEvent));
                    }
                    else
                    {
                        parentWindow.ciscenjeSPa();
                        parentWindow.btnDodajNovogZaposlenika.Visibility = Visibility.Visible;
                    }
                }
            }
            else
            {
                MessageBox.Show("Unesite korisničko ime.", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
    }
}
