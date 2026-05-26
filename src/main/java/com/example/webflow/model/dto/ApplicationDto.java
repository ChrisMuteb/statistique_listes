package com.example.webflow.model.dto;

import java.io.Serializable;

public class ApplicationDto implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer code;
    private String libelle;

    public ApplicationDto() {

    }
    // Constructor to quickly build the object from the DAO result
    public ApplicationDto(Integer code, String libelle) {
        this.code = code;
        this.libelle = libelle;
    }

    // Getters and Setters
    public Integer getCode() { return code; }
    public void setCode(Integer code) { this.code = code; }

    public String getLibelle() { return libelle; }
    public void setLibelle(String libelle) { this.libelle = libelle; }
}
