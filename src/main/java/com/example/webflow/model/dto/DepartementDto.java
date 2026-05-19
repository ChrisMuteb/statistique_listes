package com.example.webflow.model.dto;

import java.io.Serializable;

public class DepartementDto implements Serializable {
    private static final long serialVersionUID = 1L;

    private String code;
    private String libelle;

    public DepartementDto() {

    }
    // Constructor to quickly build the object from the DAO result
    public DepartementDto(String code, String libelle) {
        this.code = code;
        this.libelle = libelle;
    }

    // Getters and Setters
    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public String getLibelle() { return libelle; }
    public void setLibelle(String libelle) { this.libelle = libelle; }
}
