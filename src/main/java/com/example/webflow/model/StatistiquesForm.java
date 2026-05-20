package com.example.webflow.model;

import java.io.Serializable;

public class StatistiquesForm implements Serializable {
    private String application;
    private String departement;
    private String typeRequete;
    private String email;

    // Getters and Setters
    public String getApplication() { return application; }
    public void setApplication(String application) { this.application = application; }

    public String getDepartement() { return departement; }
    public void setDepartement(String departement) { this.departement = departement; }

    public String getTypeRequete() { return typeRequete; }
    public void setTypeRequete(String typeRequete) { this.typeRequete = typeRequete; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}
