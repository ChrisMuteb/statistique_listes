package com.example.webflow.service.impl;

import com.example.webflow.dao.StatiqueDao;
import com.example.webflow.model.DemandeFichier;
import com.example.webflow.model.StatistiquesForm;
import com.example.webflow.model.StatutDemande;
import com.example.webflow.model.dto.ApplicationDto;
import com.example.webflow.model.dto.DepartementDto;
import com.example.webflow.model.dto.TypeRequeteDto;
import com.example.webflow.service.StatiqueService;
import com.example.webflow.util.IdGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service("StatiqueService")
public class StatiqueServiceImpl implements StatiqueService {
    @Autowired
    private StatiqueDao statiqueDao;

    @Override
    @Transactional(readOnly = true)
    public List<ApplicationDto> getListOfApplication() {
        // 1. Get raw rows from DAO
        List<Object[]> rawList = statiqueDao.getListOfApplication();
        List<ApplicationDto> appList = new ArrayList<>();

        if (rawList != null) {
            for (Object[] row : rawList) {

                // FIX 1 & 2: Safe numerical conversion. If null, we assign null safely to the Integer object.
                Integer idApplication = null;
                if (row[0] != null) {
                    idApplication = ((Number) row[0]).intValue();
                }

                // Safe String assignment
                String libApplication = row[1] != null ? row[1].toString() : "";

                appList.add(new ApplicationDto(idApplication, libApplication));
            }
        }

        return appList;
    }

    @Override
    @Transactional(readOnly = true)
    public List<DepartementDto> getListOfDept() {
        // 1. Get raw rows from DAO
        List<Object[]> rawList = statiqueDao.getListOfDept();
        List<DepartementDto> deptList = new ArrayList<>();

        if (rawList != null) {
            for (Object[] row : rawList) {
                // row[0] is code, row[1] is libelle from your SQL script
                String code = row[0] != null ? row[0].toString() : "";
                String libelle = row[1] != null ? row[1].toString() : "";

                deptList.add(new DepartementDto(code, libelle));
            }
        }

        return deptList;
    }

    @Override
    @Transactional(readOnly = true)
    public List<TypeRequeteDto> getListOfTypeRequete() {
        // 1. Get raw database rows from your DAO layer selection query
        List<Object[]> rawList = statiqueDao.getListOfTypeRequete();
        List<TypeRequeteDto> typeRequeteList = new ArrayList<>();

        if (rawList != null) {
            for (Object[] row : rawList) {

                // Column 0: idrequete (INTEGER)
                Integer idRequete = row[0] != null ? ((Number) row[0]).intValue() : null;

                // Column 1: idapplication (INTEGER)
                Integer idApplication = row[1] != null ? ((Number) row[1]).intValue() : null;

                // Column 2: librequete (VARCHAR)
                String libRequete = row[2] != null ? row[2].toString() : "";

                // Column 3: requete (TEXT)
                String requete = row[3] != null ? row[3].toString() : "";

                // Column 4: dtdeb (TIMESTAMP)
                Timestamp dtDeb = row[4] != null ? (Timestamp) row[4] : null;

                // Column 5: dtfin (TIMESTAMP)
                Timestamp dtFin = row[5] != null ? (Timestamp) row[5] : null;

                // Instantiate and add the completely populated DTO record
                typeRequeteList.add(new TypeRequeteDto(idRequete, idApplication, libRequete, requete, dtDeb, dtFin));
            }
        }

        return typeRequeteList;
    }

    @Override
    @Transactional
    public void saveDemandeFichier(StatistiquesForm form) {
        // 1. Instantiate the database model entity
        DemandeFichier demande = new DemandeFichier();

        // 2. Inject our custom Unique ID Algorithm output
        demande.setIdDemandeFichier(IdGenerator.generateUniqueNumericId());

        // 3. Map basic textual dropdown mappings from screen data
        demande.setApplication(form.getApplication());
        demande.setDepartement(form.getDepartement());
        demande.setRequetes(form.getTypeRequete());

        // 4. Time calculations: Request time vs Expiration date (+30 days)
        LocalDateTime currentDateTime = LocalDateTime.now();
        demande.setDtDemande(Timestamp.valueOf(currentDateTime));
        demande.setDtExpiration(Timestamp.valueOf(currentDateTime.plusDays(30)));

        // 5. Explicitly assign initial Enum state value
        demande.setStatutCsv(StatutDemande.EN_COURS.name());

        // 6. Push down directly to DB persistent tier execution
        statiqueDao.insertDemandeFichier(demande);
    }

    @Override
    @Transactional(readOnly = true)
    public List<DemandeFichier> getAllDemandesForDisplay() {
        List<Object[]> rawList = statiqueDao.getListOfDemandesFichiers();
        List<DemandeFichier> dtoList = new ArrayList<>();

        if (rawList != null) {
            for (Object[] row : rawList) {
                DemandeFichier dto = new DemandeFichier();

                // Explicitly cast positional database array results to DTO properties safely
                dto.setIdDemandeFichier((Integer) row[0]);
                dto.setApplication((String) row[1]);
                dto.setDepartement((String) row[2]);
                dto.setRequetes((String) row[3]);
                dto.setDtDemande((Timestamp) row[4]);
                dto.setDtExpiration((Timestamp) row[5]);

                // Map database raw VARCHAR text directly to safe Java Enum types
                String dbStatutStr = (String) row[6];
                if (dbStatutStr != null) {
                    try {
                        dto.setStatutCsv(StatutDemande.valueOf(dbStatutStr).toString());
                    } catch (IllegalArgumentException e) {
                        // Fallback state mapping protection in case of legacy database entries
                        dto.setStatutCsv(StatutDemande.EN_COURS.toString());
                    }
                }

                dtoList.add(dto);
            }
        }
        return dtoList;
    }
}
