package com.example.webflow.dao;

import java.util.List;

public interface StatiqueDao {
    List<Object[]> getListOfApplication();
    List<Object[]> getListOfDept();
    List<Object[]> getListOfTypeRequete();
}
