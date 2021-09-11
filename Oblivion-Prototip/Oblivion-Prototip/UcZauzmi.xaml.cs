using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Interaction logic for UcZauzmi.xaml
    /// </summary>
    public partial class UcZauzmi : UserControl
    {
        double ukupnoSati = 0;
        int ukupnoKafa = 0;
        int ukupnoVoda = 0;
        int ukupnoKokaKola = 0;
        int ukupnoFanta = 0;

        int brojRacunara = 0;

        public UcZauzmi(int brojRacunara, string naziv)
        {
            InitializeComponent();
            this.brojRacunara = brojRacunara;
            lblNaziv.Content = naziv;

            napuniIgrice();
        }

        private void napuniIgrice()
        {
            string upit = "SELECT * FROM `igrica` join instalirano on (instalirano.igrica_idigrica = igrica.idigrica) where racunar_broj_racunara = " + brojRacunara;
            MySqlCommand cmd = new MySqlCommand(upit, Connection.GetConnection());

            MySqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                string naziv = reader["naziv"].ToString();
                cmbIgrice.Items.Add(naziv);
            }

            reader.Close();
        }

        private void btn30min_Click(object sender, RoutedEventArgs e)
        {
            ukupnoSati += 0.5;
            txtUkupnoSati.Text = ukupnoSati.ToString("0.0#");
        }

        private void btn1Sat_Click(object sender, RoutedEventArgs e)
        {
            ukupnoSati += 1;
            txtUkupnoSati.Text = ukupnoSati.ToString("0.0#");
        }

        private void btn2Sata_Click(object sender, RoutedEventArgs e)
        {
            ukupnoSati += 2;
            txtUkupnoSati.Text = ukupnoSati.ToString("0.0#");
        }

        private void btn3sata_Click(object sender, RoutedEventArgs e)
        {
            ukupnoSati += 3;
            txtUkupnoSati.Text = ukupnoSati.ToString("0.0#");
        }

        private void txtUkupnoSati_TextChanged(object sender, TextChangedEventArgs e)
        {
            if(txtUkupnoSati.Text == "")
            {
                ukupnoSati = 0;
            }
        }

        private void btnKafa_Click(object sender, RoutedEventArgs e)
        {
            ukupnoKafa += 1;
            txtKolicinaKafa.Text = ukupnoKafa.ToString();
        }

        private void btnVoda_Click(object sender, RoutedEventArgs e)
        {
            ukupnoVoda += 1;
            txtKolicinaVoda.Text = ukupnoVoda.ToString();
        }

        private void btnKokaKola_Click(object sender, RoutedEventArgs e)
        {
            ukupnoKokaKola += 1;
            txtKolicinaKokaKola.Text = ukupnoKokaKola.ToString();
        }

        private void btnFanta_Click(object sender, RoutedEventArgs e)
        {
            ukupnoFanta += 1;
            txtKolicinaFanta.Text = ukupnoFanta.ToString();
        }

        private void txtKolicinaKafa_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void txtKolicinaVoda_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void txtKolicinaKokaKola_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void txtKolicinaFanta_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void txtKolicinaKafa_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (txtKolicinaKafa.Text == "")
            {
                ukupnoKafa = 0;
            }
        }

        private void txtKolicinaVoda_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (txtKolicinaVoda.Text == "")
            {
                ukupnoVoda = 0;
            }
        }

        private void txtKolicinaKokaKola_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (txtKolicinaKokaKola.Text == "")
            {
                ukupnoKokaKola = 0;
            }
        }

        private void txtKolicinaFanta_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (txtKolicinaFanta.Text == "")
            {
                ukupnoFanta = 0;
            }
        }

        private void txtUkupnoSati_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9.]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void btnZauzmi_Click(object sender, RoutedEventArgs e)
        {
            //zapisati na kontrolu racunar vrijeme zaueto, poceti tajmer i trenutno sistemsko vrijeme

            //u bazu upisati igraca ako je novi 

            //u bazu upisati igraca koji je zauzeo racunar 

            //unjeti podatke u tabelu naplacuje
        }


    }
}
