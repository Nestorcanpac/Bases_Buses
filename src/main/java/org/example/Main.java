package org.example;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.*;


public class Main {
    public static void main(String[] args) {

        try{
            FileReader fileReader =new FileReader(new File("Buses.sql"));
            BufferedReader bufferedReader=new BufferedReader(fileReader);
            StringBuilder script= new StringBuilder();
            String linea;

            while ((linea = bufferedReader.readLine()) != null){
                script.append(linea).append("\n");
            }

            Connection conexion=
                    DriverManager.getConnection("jdbc:sqlite:Buses.db");

            Statement sentencia = conexion.createStatement();
            String sql = script.toString();
            sentencia.executeUpdate(sql);

            String consultaBuses= "Select * from BUSES";
            ResultSet resultado= sentencia.executeQuery(consultaBuses);

            while (resultado.next()) {
                String id_bus = resultado.getString("id_bus");
                String modelo = resultado.getString("modelo");
                String matricula = resultado.getString("matricula");

                System.out.println(id_bus + " " + modelo + " " + matricula);
            }

            Statement sentenciaCreateBono=conexion.createStatement();
            String create= "Create table if not exists Bonos(\n" +
                    "ID_Bono Integer,\n" +
                    "Tipo varchar(20),\n" +
                    "Duracion Integer\n," +
                    "Constraint ID_bono_pk PRIMARY KEY(ID_bono)" +
                    ");";
            sentenciaCreateBono.executeUpdate(create);

            String insertBono="INSERT INTO Bonos(ID_Bono,tipo,duracion) VALUES\n" +
                    "(1,'Todo Incluido',1),\n" +
                    "(2,'Todo Incluido',7),\n" +
                    "(3,'Todo Incluido',30),\n" +
                    "(4,'50%',1),\n" +
                    "(5,'50%',7),\n" +
                    "(6,'50%',30);";
            PreparedStatement updateBono= conexion.prepareStatement(insertBono);
            updateBono.executeUpdate();



            Statement sentenciaCreateUsuarios= conexion.createStatement();
            String create2="Create table if not exists Usuarios(" +
                    "DNI integer,\n" +
                    "Nombre varchar(20),\n" +
                    "F_nacimiento Date,\n" +
                    "Ciudad varchar(15)," +
                    "Constraint DNI_pk PRIMARY KEY(DNI));";
            sentenciaCreateUsuarios.executeUpdate(create2);

            Statement sentenciaCreateBonos_Activos= conexion.createStatement();

            String create3= "Create table if not exists Bonos_Activos(" +
                    "ID_bono integer,\n" +
                    "DNI_usuario integer,\n" +
                    "ID_linea integer,\n" +
                    "Caducidad Date," +
                    "Constraint pk_BonosActivos PRIMARY KEY (ID_bono,DNI_usuario,ID_linea)" +
                    ");";
            sentenciaCreateBonos_Activos.executeUpdate(create3);

            Statement printeaTabla= conexion.createStatement();
            String print="Select * from Bonos";
            ResultSet resultSet= printeaTabla.executeQuery(print);

            while (resultSet.next()){
                int id_bono=resultSet.getInt("ID_Bono");
                String tipo=resultSet.getString("tipo");
                int duracion= resultSet.getInt("duracion");
                System.out.println(id_bono+" "+tipo+" "+duracion);
            }




        }catch (Exception exception){
            exception.printStackTrace();
        }

    }
}