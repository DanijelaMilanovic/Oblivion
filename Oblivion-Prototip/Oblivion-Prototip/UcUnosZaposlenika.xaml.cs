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
    /// Interaction logic for UcUnosZaposlenika.xaml
    /// </summary>
    public partial class UcUnosZaposlenika : UserControl
    {
        AdminWindow parentWindow;

        public UcUnosZaposlenika(AdminWindow parentWindow)
        {
            InitializeComponent();
            this.parentWindow = parentWindow;
        }

        private void btnOdustani_Click(object sender, RoutedEventArgs e)
        {
            parentWindow.ciscenjeSPa();
            parentWindow.btnDodajNovogZaposlenika.Visibility = Visibility.Visible;
        }
    }
}
