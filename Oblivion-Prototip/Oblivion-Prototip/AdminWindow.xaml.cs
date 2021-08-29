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
        Korisnik admin;

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

        private void ucitavanjeTabeleZaposlenik()
        {
            string cmd_string = "SELECT jmbg,ime,prezime,dat_zaposlenja,plata,`mjesto`.`naziv` as \"mjesto\",administrator FROM `radnik` " +
                "JOIN `mjesto` ON (`radnik`.`mjesto_ptt`=`mjesto`.`ptt`) WHERE `radnik`.`igraonica_reg_broj` = " + admin.RegBrojIgraonice;
            MySqlCommand cmd = new MySqlCommand(cmd_string,Connection.GetConnection());

            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            da.Fill(dt);
            dataZaposleni.ItemsSource = dt.DefaultView;
        }

        private void dataZaposleni_SelectedCellsChanged(object sender, SelectedCellsChangedEventArgs e)
        {
            dataZaposleni.UnselectAllCells();
        }
    }
}
