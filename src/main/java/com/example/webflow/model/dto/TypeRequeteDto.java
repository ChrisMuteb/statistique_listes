package com.example.webflow.model.dto;

import java.io.Serializable;

public class TypeRequeteDto implements Serializable {
    private static final long serialVersionUID = 1L;

    private String id;
    private String libelle;

    public TypeRequeteDto() {

    }
    // Constructor to quickly build the object from the DAO result
    public TypeRequeteDto(String id, String libelle) {
        this.id = id;
        this.libelle = libelle;
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getLibelle() { return libelle; }
    public void setLibelle(String libelle) { this.libelle = libelle; }
}
