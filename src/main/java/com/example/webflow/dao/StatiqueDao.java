package com.example.webflow.dao;

import com.example.webflow.model.DemandeFichier;

import java.util.List;

public interface StatiqueDao {
    List<Object[]> getListOfApplication();
    List<Object[]> getListOfDept();
    List<Object[]> getListOfTypeRequete();

    // ADD THIS METHOD
    void insertDemandeFichier(DemandeFichier demande);
}
