package com.example.webflow.dao.impl;

import com.example.webflow.dao.StatiqueDao;
import com.example.webflow.dao.helper.RequeteHelper;
import com.example.webflow.model.DemandeFichier;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import java.util.Collections;
import java.util.List;

@Repository("statiqueDao")
public class StatiqueDaoImpl extends BaseDaoJpaImpl implements StatiqueDao {

    @Override
    public List<Object[]> getListOfApplication() {
        List<Object[]> list = null;

        try {
            // Using the static script defined in RequeteHelper
            Query query = entityManager
                    .createNativeQuery(RequeteHelper.REQ_LIST_OF_APPLICATION);

            list = query.getResultList();
        }
        catch (Exception exception) {
//            log.error("Error executing getListCommuneParDept", exception);
        }

        return list;
    }

    @Override
    public List<Object[]> getListOfDept() {
        List<Object[]> list = null;

        try {
            // Using the static script defined in RequeteHelper
            Query query = entityManager
                    .createNativeQuery(RequeteHelper.REQ_LIST_OF_DEPARTEMENT);

            list = query.getResultList();
        }
        catch (Exception exception) {
//            log.error("Error executing getListCommuneParDept", exception);
        }

        return list;
    }

    @Override
    public List<Object[]> getListOfTypeRequete() {
        List<Object[]> list = null;

        try {
            // Using the static script defined in RequeteHelper
            Query query = entityManager
                    .createNativeQuery(RequeteHelper.REQ_LIST_OF_REQUETE);

            list = query.getResultList();
        }
        catch (Exception exception) {
//            log.error("Error executing getListCommuneParDept", exception);
        }

        return list;
    }

    @Override
    public void insertDemandeFichier(DemandeFichier demande) {
        try {
            // 1. Create native query from your RequeteHelper SQL string
            Query query = entityManager.createNativeQuery(RequeteHelper.REQ_INSERT_DEMANDE_FICHIER);

            // 2. Bind parameters in the exact order of your SQL statement placeholder tokens (?)
            query.setParameter(1, demande.getIdDemandeFichier());
            query.setParameter(2, demande.getApplication());
            query.setParameter(3, demande.getDepartement());
            query.setParameter(4, demande.getRequetes());
            query.setParameter(5, demande.getDtDemande());
            query.setParameter(6, demande.getDtExpiration());
            query.setParameter(7, demande.getStatutCsv());

            // 3. Execute the SQL insertion statement
            query.executeUpdate();
        }
        catch (Exception exception) {
            // Clean Code reminder: Never swallow exceptions completely in production.
            // Throw it upwards so the transaction can safely rollback if it fails.
            throw new RuntimeException("Erreur lors de l'insertion dans demandefichiers", exception);
        }
    }

    @Override
    public List<Object[]> getListOfDemandesFichiers() {
        List<Object[]> list = null;
        try {
            // Simple query string selecting data in the exact order we want to map it
            String sql = "SELECT iddemandefichier, application, departement, requetes, dtdemande, dtexpiration, statutcsv " +
                    "FROM demandefichiers ORDER BY dtdemande DESC";

            Query query = entityManager.createNativeQuery(sql);
            list = query.getResultList();
        }
        catch (Exception exception) {
            // Log your error here depending on your logger configuration
        }
        return list;
    }
}
