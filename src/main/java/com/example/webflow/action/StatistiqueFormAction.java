package com.example.webflow.action;

import com.example.webflow.model.dto.ApplicationDto;
import com.example.webflow.model.dto.DepartementDto;
import com.example.webflow.model.dto.TypeRequeteDto;
import com.example.webflow.service.StatiqueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.webflow.action.FormAction;
import org.springframework.webflow.execution.Event;
import org.springframework.webflow.execution.RequestContext;

import java.util.List;

public class StatistiqueFormAction extends FormAction {
    @Autowired
    private StatiqueService statiqueService;

    @Override
    public Event setupForm(RequestContext context) throws Exception
    {
        // Fetch the clean list of typed domain objects
        List<ApplicationDto> applications = statiqueService.getListOfApplication();
        List<DepartementDto> departements = statiqueService.getListOfDept();
        List<TypeRequeteDto> typeRequetes = statiqueService.getListOfTypeRequete();

        // Pass it to the view scope / flow scope
        context.getFlowScope().put("applicationsList", applications);
        context.getFlowScope().put("departementsList", departements);
        context.getFlowScope().put("typeRequeteList", typeRequetes);

        bind(context);
        return super.setupForm(context);
    }
}
