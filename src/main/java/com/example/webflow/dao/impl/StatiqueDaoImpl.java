package com.example.webflow.dao.impl;

import com.example.webflow.dao.StatiqueDao;
import com.example.webflow.dao.helper.RequeteHelper;
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
                    .createNativeQuery(RequeteHelper.REQ_LIST_OF_TYPE_REQUETE);

            list = query.getResultList();
        }
        catch (Exception exception) {
//            log.error("Error executing getListCommuneParDept", exception);
        }

        return list;
    }
}
