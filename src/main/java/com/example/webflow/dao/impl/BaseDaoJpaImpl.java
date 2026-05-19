package com.example.webflow.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public abstract class BaseDaoJpaImpl {
    @PersistenceContext
    protected EntityManager entityManager;
}
