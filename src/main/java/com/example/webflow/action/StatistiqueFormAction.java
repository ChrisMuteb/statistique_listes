package com.example.webflow.action;

import com.example.webflow.model.DemandeFichier;
import com.example.webflow.model.StatistiquesForm;
import com.example.webflow.model.dto.ApplicationDto;
import com.example.webflow.model.dto.DepartementDto;
import com.example.webflow.model.dto.TypeRequeteDto;
import com.example.webflow.service.StatiqueService;
import com.example.webflow.validator.StatistiquesValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
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

        // 2. Fetch the newly saved file records directly out of our persistence service layer
        List<DemandeFichier> listDemandes = statiqueService.getAllDemandesForDisplay();

        // Pass it to the view scope / flow scope
        context.getFlowScope().put("applicationsList", applications);
        context.getFlowScope().put("departementsList", departements);
        context.getFlowScope().put("typeRequeteList", typeRequetes);

        // This key "historiqueDemandesList" matches the items looping property inside your JSP template
        context.getFlowScope().put("historiqueDemandesList", listDemandes);

        bind(context);
        return super.setupForm(context);
    }

    public Event soumettre(RequestContext context) throws Exception
    {
        // Extract the typed data sent by the user form submission
//        StatistiquesForm form = (StatistiquesForm) getFormObject(context);
        super.bind(context);
        StatistiquesForm form = (StatistiquesForm)context.getFlowScope().get("statistiqueform");

        StatistiquesValidator validator = (StatistiquesValidator) getValidator();
//        Object objectForm = getFormObject(context);
        Errors errors = getFormErrors(context);
        validator.validate(form, errors);
        if(errors.hasErrors()){
            context.getFlowScope().put(getFormObjectName(), form);
            return error();
        }

        try {
            // 4. Delegate sequence computation and execution to transaction service layer
            statiqueService.saveDemandeFichier(form);

            // 5. Flag successful execution target state back into presentation view components
            context.getFlashScope().put("submitSuccess", true);
            return success();

        } catch (Exception exception) {
            // Global data fallback context error message registration
            errors.reject("error.global.db.failure",
                    "Une erreur système s'est produite. L'enregistrement n'a pas pu être finalisé.");
            return error();
        }

    }
}
