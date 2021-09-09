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

namespace Oblivion_Prototip
{
    /// <summary>
    /// Interaction logic for UcPrikazKomponenti.xaml
    /// </summary>
    public partial class UcPrikazKomponenti : UserControl
    {
        AdminWindow parentWindow;
        string tip;

        public UcPrikazKomponenti(AdminWindow parentWindow, string tip)
        {
            InitializeComponent();
            this.parentWindow = parentWindow;
            this.tip = tip;

            if (this.tip == "monitor")
            {
                lblNaslov.Text = "MONITORI";
            }
        }

        private void btnOdustani_Click(object sender, RoutedEventArgs e)
        {
            parentWindow.ciscenjeSPaRacunar();
            parentWindow.btnDodavanjeNovogRacunara.Visibility = Visibility.Visible;
        }

        private void lvPrikazKomponenti_PreviewMouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            var item = (sender as ListView).SelectedItem;
            if (item != null)
            {
                if (tip == "monitor")
                {
                    UnosMonitorWindow unos = new UnosMonitorWindow((Monitor)item, false);

                    if (unos.ShowDialog() == true)
                    {
                        lvPrikazKomponenti.SelectedItem = unos.monitor;
                        lvPrikazKomponenti.Items.Refresh();
                    }
                }
            }
        
        }
    }
}
