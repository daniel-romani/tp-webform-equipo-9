﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    /*La clase Item va a manejar una lista de artículos que serán agregados mediante session*/
    public class ItemShop
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public decimal Precio { get; set; }
        public string Imagen { get; set; }
        public int Cantidad { get; set; }
    }
}
