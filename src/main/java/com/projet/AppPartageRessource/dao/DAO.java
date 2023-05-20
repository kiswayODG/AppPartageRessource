package com.projet.AppPartageRessource.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;

import java.util.List;

public class DAO<T> {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistence");
    EntityManager em = emf.createEntityManager();
    Class<T> entity;


    public T finBy(int i) {
        return em.find(entity, i);
    }


    public List<T> findAll(String nomTable) {
        return em.createQuery("from "+nomTable).getResultList();
    }


    public void create(T entity) {
        em.getTransaction().begin();
        em.persist(entity);
        em.getTransaction().commit();
    }


    public void createAll(List<T> entities) {
        em.getTransaction().begin();
        for (T entity: entities) {
            em.persist(entity);
        }
        em.getTransaction().commit();
    }


    public void update(T entity) {
        em.getTransaction().begin();
        em.merge(entity);
        em.getTransaction().commit();
    }


    public void updateAll(List<T> entities) {
        em.getTransaction().begin();
        for (T entity: entities) {
            em.merge(entity);
        }
        em.getTransaction().commit();
    }


    public void delete(T entity) {
        em.getTransaction().begin();
        em.remove(entity);
        em.getTransaction().commit();
    }


    public void deleteAll(List<T> entities) {
        em.getTransaction().begin();
        for (T entity: entities) {
            em.remove(entity);
        }
        em.getTransaction().commit();
    }
}
