using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Negocio
{
    public class MarcaNegocio
    {
        public List<Marca> listar()
        {
            List<Marca> marcas = new List<Marca>();
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setConsulta("SELECT Id, Descripcion FROM dbo.MARCAS");
                accesoDatos.ejecutarLectura();

                while (accesoDatos.Lector.Read())
                {
                    Marca marca = new Marca();
                    marca.Id = (int)accesoDatos.Lector["Id"];
                    marca.Descripcion = (string)accesoDatos.Lector["Descripcion"];

                    marcas.Add(marca);
                }

                return marcas;
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

        public void Eliminar(int id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setConsulta("delete from MARCAS where id = @id");
                datos.setParametro("@id", id);
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

        public void agregar(Marca nuevoArticulo)
        {
            AccesoDatos datos = new AccesoDatos();
            List<Marca> lista = listar();

            Marca articulo_aux = new Marca();

            articulo_aux = lista.Last();

            try
            {
                datos.setConsulta("INSERT INTO MARCAS (Descripcion) VALUES (@Descripcion)");
                datos.setParametro("@Descripcion", nuevoArticulo.Descripcion);
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

        public void modificar(Marca articulo, string modificacion)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setConsulta("UPDATE MARCAS set Descripcion = @descripcion WHERE Id = @id");
                datos.setParametro("@id", articulo.Id);
                datos.setParametro("@descripcion", modificacion);

                datos.ejecutarLectura();

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
