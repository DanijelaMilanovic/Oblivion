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
using System.Windows.Shapes;
using MySql.Data.MySqlClient;

namespace Oblivion_Prototip
{
    /// <summary>
    /// Interaction logic for ZaposleniWindow.xaml
    /// </summary>
    public partial class ZaposleniWindow : Window
    {
        Korisnik zaposlenik;
        string mrezno_ime = "";
        int broj_racunara = 0;
        int igraonica_reg_broj = 0;

        public ZaposleniWindow(Korisnik korisnik)
        {
            InitializeComponent();

            this.zaposlenik = korisnik;
            UcitajKomponente();
            
            
        }

        /// <summary>
        /// Logika izlaza iz aplikacije i omogućavanje promjene prikaza
        /// </summary>
        #region Upravljanje prikazom i izlazom iz aplikacije
        private void ZaposleniWindow_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Escape)
            {
                WindowState = WindowState.Normal;
                WindowStyle = WindowStyle.ThreeDBorderWindow;
            }

        }

        private void ZaposleniWindow_StateChanged(object sender, EventArgs e)
        {
            if (WindowState == WindowState.Maximized)
            {
                WindowStyle = WindowStyle.None;
            }
        }
        #endregion

        public void UcitajKomponente()
        {
            string upit = "select * from racunar where igraonica_reg_broj = " + zaposlenik.RegBrojIgraonice;
            MySqlCommand cmd = new MySqlCommand(upit, Connection.GetConnection());

            MySqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                broj_racunara = Int32.Parse( reader["broj_racunara"].ToString());
                mrezno_ime = reader["mrezno_ime"].ToString();
                igraonica_reg_broj = Int32.Parse(reader["igraonica_reg_broj"].ToString());

                int pozicija = mrezno_ime.IndexOf("_", 0);
                String mreznoIme = mrezno_ime.Insert(pozicija, "_");

                UcRacunar racunar = new UcRacunar(mreznoIme,spPodaci,broj_racunara);
                wrapRacunari.Children.Add(racunar);
            }

            reader.Close();
        }
    }
}
