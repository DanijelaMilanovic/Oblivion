using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Oblivion_Prototip
{
    public class Korisnik
    {
        public string JMBG { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public DateTime DatumZaposlenja { get; set; }
        public double Plata { get; set; }
        public int MjestoPTT { get; set; }
        public int RegBrojIgraonice { get; set; }
        public bool Administrator { get; set; }
        public string KorisnickoIme { get; set; }
        private string Lozinka { get; set; }

        public Korisnik(string JMBG, string Ime, string Prezime, DateTime DatumZaposlenja, double Plata, int MjestoPTT, int RegBrojIgraonice, bool Administrator,
            string KorisnickoIme, string Lozinka)
        {
            this.JMBG = JMBG;
            this.Ime = Ime;
            this.Prezime = Prezime;
            this.DatumZaposlenja = DatumZaposlenja;
            this.Plata = Plata;
            this.MjestoPTT = MjestoPTT;
            this.RegBrojIgraonice = RegBrojIgraonice;
            this.Administrator = Administrator;
            this.KorisnickoIme = KorisnickoIme;
            this.Lozinka = Lozinka;
        }
    }
}
