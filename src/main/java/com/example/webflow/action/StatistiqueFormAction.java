package com.example.webflow.action;

import org.springframework.webflow.action.FormAction;
import org.springframework.webflow.execution.Event;
import org.springframework.webflow.execution.RequestContext;

public class StatistiqueFormAction extends FormAction {

    @Override
    public Event setupForm(RequestContext context) throws Exception
    {
        bind(context);

        return super.setupForm(context);
    }
}
