using System;
using System.Collections.Generic;
using System.Data;
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
using System.Windows.Shapes;

using MySql.Data.MySqlClient;

namespace Oblivion_Prototip
{
    /// <summary>
    /// Interaction logic for AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window
    {
        public Korisnik admin;

        public AdminWindow(Korisnik korisnik)
        {
            InitializeComponent();
            this.admin = korisnik;
            ucitavanjeTabeleZaposlenik();
        }

        /// <summary>
        /// Logika izlaza iz aplikacije i omogućavanje promjene prikaza
        /// </summary>
        #region Upravljanje prikazom i izlazom iz aplikacije
        private void AdminWindow_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Escape)
            {
                WindowState = WindowState.Normal;
                WindowStyle = WindowStyle.ThreeDBorderWindow;
            }

        }

        private void AdminWindow_StateChanged(object sender, EventArgs e)
        {
            if (WindowState == WindowState.Maximized)
            {
                WindowStyle = WindowStyle.None;
            }
        }
        #endregion

        public void ucitavanjeTabeleZaposlenik()
        {
            string cmd_string = "SELECT jmbg,ime,prezime,dat_zaposlenja,plata,`mjesto`.`naziv` as \"mjesto\",administrator,`mjesto_ptt` FROM `radnik` " +
                "JOIN `mjesto` ON (`radnik`.`mjesto_ptt`=`mjesto`.`ptt`) WHERE `radnik`.`igraonica_reg_broj` = " + admin.RegBrojIgraonice + " AND `radnik`.`jmbg` <> " + admin.JMBG;
            MySqlCommand cmd = new MySqlCommand(cmd_string,Connection.GetConnection());

            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            da.Fill(dt);

            dataZaposleni.ItemsSource = null;
            dataZaposleni.ItemsSource = dt.DefaultView;
        }

        private void dataZaposleni_SelectedCellsChanged(object sender, SelectedCellsChangedEventArgs e)
        {
            dataZaposleni.UnselectAllCells();
        }

        private void btnBrisanje_Click(object sender, RoutedEventArgs e)
        {
            DataRowView dataRowView = (DataRowView)((Button)e.Source).DataContext;
            string JMBG = dataRowView[0].ToString();
            string ime = dataRowView[1].ToString();
            string prezime = dataRowView[2].ToString();
            DateTime datumZaposlenja = (DateTime)dataRowView[3];
            double plata = Double.Parse(dataRowView[4].ToString());
            bool administrator = Convert.ToBoolean(Int32.Parse(dataRowView[6].ToString()));
            int mjestoPtt = Int32.Parse(dataRowView[7].ToString());

            if (MessageBox.Show("Da li ste sigurni da želite da obrišete zaposlenika :" + ime + " " + prezime, "Brisanje zaposlenika", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                Korisnik korisnikZaBrisanje = new Korisnik(JMBG, ime, prezime, datumZaposlenja, plata, mjestoPtt, 0, administrator, "");

                string cmd_string = "UPDATE `racun` SET `radnik_idradnika` = NULL WHERE `radnik_idradnika` = '" + korisnikZaBrisanje.JMBG + "'";
                MySqlCommand cmd = new MySqlCommand(cmd_string, Connection.GetConnection());

                korisnikZaBrisanje.StampanjeIzvjestaja();
                cmd.ExecuteNonQuery();
                cmd_string = "DELETE from `radnik` WHERE `radnik`.JMBG = '" + JMBG + "'";
                cmd = new MySqlCommand(cmd_string, Connection.GetConnection());
                cmd.ExecuteNonQuery();

                MessageBox.Show("Zaposlenik: " + korisnikZaBrisanje.Ime + " " + korisnikZaBrisanje.Prezime + " je obrisan. Svi računi koje je radnik isplatio nalaze se \"Evidenciji obrisanih zaposlenika\".", "Brisanje zaposlenika", MessageBoxButton.OK, MessageBoxImage.Information);
                ucitavanjeTabeleZaposlenik();
            }
        }

        private void btnDodajNovogZaposlenika_Click(object sender, RoutedEventArgs e)
        {
            UcUnosZaposlenika unos = new UcUnosZaposlenika(this);

            ciscenjeSPa();
            spDodavanjeZaposlenika.Children.Add(unos);
            btnDodajNovogZaposlenika.Visibility = Visibility.Hidden;
        }

        public void ciscenjeSPa()
        {
            spDodavanjeZaposlenika.Children.Clear();
        }

        private void btnOdjava_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = true;
        }

        private void btnPromjena_Click(object sender, RoutedEventArgs e)
        {
            UcPromjenaPodataka promjena = new UcPromjenaPodataka(this);

            ciscenjeSPa();
            spDodavanjeZaposlenika.Children.Add(promjena);
            btnDodajNovogZaposlenika.Visibility = Visibility.Hidden;
        }
    }
}
