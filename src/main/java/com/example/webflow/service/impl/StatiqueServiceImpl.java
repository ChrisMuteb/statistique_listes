package com.example.webflow.service.impl;

import com.example.webflow.dao.StatiqueDao;
import com.example.webflow.model.dto.ApplicationDto;
import com.example.webflow.model.dto.DepartementDto;
import com.example.webflow.model.dto.TypeRequeteDto;
import com.example.webflow.service.StatiqueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
                // row[0] is code, row[1] is libelle from your SQL script
                String code = row[0] != null ? row[0].toString() : "";
                String libelle = row[1] != null ? row[1].toString() : "";

                appList.add(new ApplicationDto(code, libelle));
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
        // 1. Get raw rows from DAO
        List<Object[]> rawList = statiqueDao.getListOfTypeRequete();
        List<TypeRequeteDto> typeRequeteList = new ArrayList<>();

        if (rawList != null) {
            for (Object[] row : rawList) {
                // row[0] is code, row[1] is libelle from your SQL script
                String code = row[0] != null ? row[0].toString() : "";
                String libelle = row[1] != null ? row[1].toString() : "";

                typeRequeteList.add(new TypeRequeteDto( code, libelle));
            }
        }

        return typeRequeteList;
    }
}
