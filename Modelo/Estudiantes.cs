using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace web_umg_bd
{
    public class Empleado
    {
        ConexionBD conectar;
        private DataTable drop_puesto(){
            DataTable tabla = new DataTable();
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string strConsulta = string.Format("select id_tipos_sangre as id,sangre from tipos_sangre;");
            MySqlDataAdapter consulta = new MySqlDataAdapter(strConsulta, conectar.conectar);
            consulta.Fill(tabla);
            conectar.CerarConexion();
            return tabla;
        }
        public void drop_tipo_sangre(DropDownList drop){
            drop.ClearSelection();
            drop.Items.Clear();
            drop.AppendDataBoundItems = true;
            drop.Items.Add("<< Elige tipo sangre >>");
            drop.Items[0].Value = "0";
            drop.DataSource = drop_tipo_sangre();
            drop.DataTextField = "sangre";
            drop.DataValueField = "id";
            drop.DataBind();

        }
        private DataTable grid_estudiantes() {
            DataTable tabla = new DataTable();
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            String consulta = string.Format("select e.id_estudiantes as id,e.carne,e.nombre,e.apellido,e.direccion,e.telefono,e.correo_electronico,e.fecha_nacimiento,p.puesto,p.id_tipos_sangre from estudiantes as e inner join tipos_sangre as p on e.id_tipos_sangre = p.id_tipos_sangre;");
            MySqlDataAdapter query = new MySqlDataAdapter(consulta, conectar.conectar);
            query.Fill(tabla);
            conectar.CerarConexion();
            return tabla;
        }
        public void grid_estudiantes(GridView grid){
            grid.DataSource = grid_estudiantes();
            grid.DataBind();

        }
        public int agregar(string carne,string nombre,string apellido,string direccion,string telefono,string correo_electronico,string fecha_nacimiento,int id_tipos_sangre){
            int no_ingreso = 0;
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string strConsulta = string.Format("insert into estudiantes(carne,nombre,apellido,direccion,telefono,correo_electronico,fecha_nacimiento,id_tipos_sangre) values('{0}','{1}','{2}','{3}','{4}','{5}',{6}','{7}');",carne,nombre,apellido,direccion,telefono,correo_electronico,fecha_nacimiento,id_tipos_sangre);
            MySqlCommand insertar = new MySqlCommand(strConsulta, conectar.conectar);
            
            insertar.Connection = conectar.conectar;
            no_ingreso = insertar.ExecuteNonQuery();
            conectar.CerarConexion();
            return no_ingreso;

        }
        public int modificar(int id,string carne, string nombre, string apellido, string direccion, string telefono, string correo_electronico, string fecha_nacimiento, int id_tipos_sangre){
            int no_ingreso = 0;
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string strConsulta = string.Format("update estudiantes set carne = '{0}',nombre = '{1}',apellido = '{2}',direccion = '{3}',telefono='{4}',correo_electronico = '{5}',fecha_nacimiento='{6}',id_tipos_sangre = {7} where id_estudiantes = {8};", carne, nombre, apellido, direccion, telefono, correo_electronico, fecha_nacimiento, id_tipos_sangre,id);
            MySqlCommand modificar = new MySqlCommand(strConsulta, conectar.conectar);

            modificar.Connection = conectar.conectar;
            no_ingreso = modificar.ExecuteNonQuery();
            conectar.CerarConexion();
            return no_ingreso;
        }
        public int eliminar(int id){
            int no_ingreso = 0;
        conectar = new ConexionBD();
        conectar.AbrirConexion();
            string strConsulta = string.Format("delete from estudiantes  where id_estudiantes = {0};", id);
        MySqlCommand eliminar = new MySqlCommand(strConsulta, conectar.conectar);

            eliminar.Connection = conectar.conectar;
            no_ingreso = eliminar.ExecuteNonQuery();
            conectar.CerarConexion();
            return no_ingreso;
        }

}
}