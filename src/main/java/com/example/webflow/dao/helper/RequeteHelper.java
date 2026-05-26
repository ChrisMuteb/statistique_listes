package com.example.webflow.dao.helper;

public class RequeteHelper {
    // Define your native SQL queries here
    public static final String REQ_LIST_OF_DEPARTEMENT =
            "SELECT code, libelle FROM ref_departement";

    public static final String REQ_LIST_OF_APPLICATION =
            "SELECT idapplication, libapplication FROM application";

    public static final String REQ_LIST_OF_REQUETE =
            "SELECT idrequete, idapplication, librequete, dtdeb, dtfin FROM requete";

    public static final String REQ_INSERT_DEMANDE_FICHIER =
            "INSERT INTO demandefichiers(iddemandefichier, application,departement, requetes, dtdemande,dtexpiration,statutcsv) values(?,?,?,?,?,?,?)";
}
