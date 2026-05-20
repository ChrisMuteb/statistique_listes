package com.example.webflow.validator;

import com.example.webflow.model.StatistiquesForm;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class StatistiquesValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return aClass.equals(StatistiquesForm.class);
    }

    @Override
    public void validate(Object o, Errors errors) {
        StatistiquesForm form = (StatistiquesForm) o;

        // Validates that required drop-downs are not empty
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "application", "error.application.required", "L'application est obligatoire.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "departement", "error.departement.required", "Le département est obligatoire.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "typeRequete", "error.typeRequete.required", "Le type de requête est obligatoire.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "error.email.required", "L'email est obligatoire.");

        // Basic email syntax check
        if (form.getEmail() != null && !form.getEmail().matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$")) {
            errors.rejectValue("email", "error.email.invalid", "L'adresse email n'est pas valide.");
        }
    }
}
