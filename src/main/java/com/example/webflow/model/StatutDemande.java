package com.example.webflow.model;

public enum StatutDemande {
    EN_COURS("En cours"),
    DISPONIBLE("Disponible"),
    EXPIRE("Expiré");

    private final String label;

    StatutDemande(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
}
