using System;
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

using System.Text.RegularExpressions;

namespace Oblivion_Prototip
{
    /// <summary>
    /// Interaction logic for UcUnosZaposlenika.xaml
    /// </summary>
    public partial class UcUnosZaposlenika : UserControl
    {
        AdminWindow parentWindow;

        public UcUnosZaposlenika(AdminWindow parentWindow)
        {
            InitializeComponent();
            this.parentWindow = parentWindow;
            upisMjesta();
        }

        private void btnOdustani_Click(object sender, RoutedEventArgs e)
        {
            parentWindow.ciscenjeSPa();
            parentWindow.btnDodajNovogZaposlenika.Visibility = Visibility.Visible;
        }

        private void upisMjesta()
        {
            string cmd_string = "SELECT * FROM `mjesto`";
            MySqlCommand cmd = new MySqlCommand(cmd_string, Connection.GetConnection());

            MySqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                cmbMjesta.Items.Add(new Mjesto(reader["naziv"].ToString(), (int)reader["ptt"]));
            }

            reader.Close();
        }

        private void tbJMBG_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void tbPlata_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9.]+");
            e.Handled = regex.IsMatch(e.Text);
        }


        private void btnPotvrda_Click(object sender, RoutedEventArgs e)
        {
            if (tbJMBG.Text.Length == 13)
            {
               try
               { 
                    string jmbg = tbJMBG.Text;
                    string ime = tbIme.Text;
                    string prezime = tbPrezime.Text;
                    string dat_zaposlenja = DateTime.Now.ToString("yyyy-MM-dd");
                    double plata = Double.Parse(tbPlata.Text);
                    Mjesto mjesto = (Mjesto)cmbMjesta.SelectedItem;
                    int igraonica_reg_broj = parentWindow.admin.RegBrojIgraonice;
                    bool administrator = (bool)cbAdministrator.IsChecked;
                    string korisnickoIme = tbKorisnickoIme.Text;
                    string lozinka = pbLozinka.Password;

                    // Provjera da li korisnicko ime postoji !!! 
                    if (korisnickoIme != "")
                    {
                        string cmd_string_postoji = "SELECT COUNT(*) as \"postoji\" FROM `radnik` WHERE `korisnicko_ime`='" + korisnickoIme + "'";
                        MySqlCommand cmd_postoji = new MySqlCommand(cmd_string_postoji, Connection.GetConnection());

                        MySqlDataReader reader = cmd_postoji.ExecuteReader();

                        reader.Read();
                        int postoji = reader.GetInt32("postoji");

                        reader.Close();

                        if (postoji == 0)
                        {
                            if (pbLozinka.Password == pbAutorizacija.Password)
                            {
                                if (pbLozinka.Password.Length > 4)
                                {
                                    string cmd_string = "INSERT INTO `radnik` (`jmbg`,`ime`,`prezime`,`dat_zaposlenja`,`plata`,`mjesto_ptt`,`igraonica_reg_broj`,`administrator`,`korisnicko_ime`,`lozinka`) " +
                                        "VALUES ('" + jmbg + "','" + ime + "','" + prezime + "','" + dat_zaposlenja + "'," + plata + "," + mjesto.PostanskiBroj + "," + igraonica_reg_broj + "," + administrator + ",'" + korisnickoIme + "'," +
                                        "PASSWORD('" + lozinka + "'))";

                                    MySqlCommand cmd = new MySqlCommand(cmd_string, Connection.GetConnection());

                                    cmd.ExecuteNonQuery();

                                    parentWindow.ucitavanjeTabeleZaposlenik();
                                    parentWindow.ciscenjeSPa();
                                    parentWindow.btnDodajNovogZaposlenika.Visibility = Visibility.Visible;
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
                            MessageBox.Show("Korisničko ime je zauzeto.", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                        }
                    }
                    else
                    {
                        MessageBox.Show("Unesite korisničko ime.", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                    }
                }
                catch
                {
                    MessageBox.Show("Unesene informacije nisu validne.", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                }
            }
            else
            {
                MessageBox.Show("JMBG mora imati 13 cifara.", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

    }
}
