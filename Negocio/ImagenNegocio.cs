using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Negocio
{
    internal class ImagenNegocio
    {
        public List<Imagen> listar()
        {
            List<Imagen> listaimagen = new List<Imagen>();
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setConsulta("SELECT IdArticulo, ImagenUrl FROM dbo.IMAGENES");
                accesoDatos.ejecutarLectura();

                while (accesoDatos.Lector.Read())
                {
                    Imagen imagen = new Imagen();
                    imagen.IdArticulo = (int)accesoDatos.Lector["IdArticulo"];
                    imagen.ImagenUrl = (string)accesoDatos.Lector["ImagenUrl"];

                    listaimagen.Add(imagen);
                }

                return listaimagen;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        public void añadir(Articulo articulo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setConsulta("INSERT INTO IMAGENES VALUES(" + articulo.ID + ", '" + articulo.Imagenes.Last() + "')");
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
