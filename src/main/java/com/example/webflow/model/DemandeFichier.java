package com.example.webflow.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class DemandeFichier implements Serializable {
    private static final long serialVersionUID = 1L;

    private long idDemandeFichier;
    private String application;
    private String departement;
    private String requetes;
    private Timestamp dtDemande;
    private Timestamp dtExpiration;
    private String statutCsv;

    // Getters and Setters
    public long getIdDemandeFichier() { return idDemandeFichier; }
    public void setIdDemandeFichier(long idDemandeFichier) { this.idDemandeFichier = idDemandeFichier; }

    public String getApplication() { return application; }
    public void setApplication(String application) { this.application = application; }

    public String getDepartement() { return departement; }
    public void setDepartement(String departement) { this.departement = departement; }

    public String getRequetes() { return requetes; }
    public void setRequetes(String requetes) { this.requetes = requetes; }

    public Timestamp getDtDemande() { return dtDemande; }
    public void setDtDemande(Timestamp dtDemande) { this.dtDemande = dtDemande; }

    public Timestamp getDtExpiration() { return dtExpiration; }
    public void setDtExpiration(Timestamp dtExpiration) { this.dtExpiration = dtExpiration; }

    public String getStatutCsv() { return statutCsv; }
    public void setStatutCsv(String statutCsv) { this.statutCsv = statutCsv; }
}
