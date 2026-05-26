package com.example.webflow.model.dto;

import java.io.Serializable;
import java.sql.Timestamp;

public class TypeRequeteDto implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer idRequete;
    private Integer idApplication;
    private String libRequete;
    private String requete;
    private Timestamp dtDeb;
    private Timestamp dtFin;

    // Full constructor matching all your table fields
    public TypeRequeteDto(Integer idRequete, Integer idApplication, String libRequete,
                          String requete, Timestamp dtDeb, Timestamp dtFin) {
        this.idRequete = idRequete;
        this.idApplication = idApplication;
        this.libRequete = libRequete;
        this.requete = requete;
        this.dtDeb = dtDeb;
        this.dtFin = dtFin;
    }

    public Integer getIdRequete() {
        return idRequete;
    }

    public void setIdRequete(Integer idRequete) {
        this.idRequete = idRequete;
    }

    public Integer getIdApplication() {
        return idApplication;
    }

    public void setIdApplication(Integer idApplication) {
        this.idApplication = idApplication;
    }

    public String getLibRequete() {
        return libRequete;
    }

    public void setLibRequete(String libRequete) {
        this.libRequete = libRequete;
    }

    public String getRequete() {
        return requete;
    }

    public void setRequete(String requete) {
        this.requete = requete;
    }

    public Timestamp getDtDeb() {
        return dtDeb;
    }

    public void setDtDeb(Timestamp dtDeb) {
        this.dtDeb = dtDeb;
    }

    public Timestamp getDtFin() {
        return dtFin;
    }

    public void setDtFin(Timestamp dtFin) {
        this.dtFin = dtFin;
    }
}
