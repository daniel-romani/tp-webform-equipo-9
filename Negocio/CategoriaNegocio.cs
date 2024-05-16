using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Negocio
{
    public class CategoriaNegocio
    {
        public List<Categoria> listar()
        {
            List<Categoria> categorias = new List<Categoria>();
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setConsulta("SELECT Id, Descripcion FROM dbo.CATEGORIAS");
                accesoDatos.ejecutarLectura();

                while(accesoDatos.Lector.Read())
                {
                    Categoria categoria = new Categoria();
                    categoria.Id = (int)accesoDatos.Lector["Id"];
                    categoria.Descripcion = (string)accesoDatos.Lector["Descripcion"];

                    categorias.Add(categoria);
                }

                return categorias;
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
                datos.setConsulta("delete from CATEGORIAS where id = @id");
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

        public void agregar(Categoria nuevoArticulo)
        {
            AccesoDatos datos = new AccesoDatos();
            List<Categoria> lista = listar();

            Categoria articulo_aux = new Categoria();

            articulo_aux = lista.Last();

            try
            {
                datos.setConsulta("INSERT INTO CATEGORIAS (Descripcion) VALUES (@Descripcion)");
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

        public void modificar(Categoria articulo, string modificacion)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setConsulta("UPDATE CATEGORIAS set Descripcion = @descripcion WHERE Id = @id");
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
