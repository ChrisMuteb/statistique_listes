package com.example.webflow.dao.helper;

public class RequeteHelper {
    // Define your native SQL queries here
    public static final String REQ_LIST_OF_DEPARTEMENT =
            "SELECT code, libelle FROM ref_departement";

    public static final String REQ_LIST_OF_APPLICATION =
            "SELECT code, libelle FROM ref_application";

    public static final String REQ_LIST_OF_TYPE_REQUETE =
            "SELECT id, libelle FROM ref_type_requete";

    public static final String REQ_INSERT_DEMANDE_FICHIER =
            "INSERT INTO demandefichiers(iddemandefichier, application,departement, requetes, dtdemande,dtexpiration,statutcsv) values(?,?,?,?,?,?,?)";
}
