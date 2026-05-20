package com.example.webflow.service;

import com.example.webflow.model.StatistiquesForm;
import com.example.webflow.model.dto.ApplicationDto;
import com.example.webflow.model.dto.DepartementDto;
import com.example.webflow.model.dto.TypeRequeteDto;

import java.util.List;

public interface StatiqueService {
    List<ApplicationDto> getListOfApplication();
    List<DepartementDto> getListOfDept();
    List<TypeRequeteDto> getListOfTypeRequete();
    void saveDemandeFichier(StatistiquesForm form);
}
