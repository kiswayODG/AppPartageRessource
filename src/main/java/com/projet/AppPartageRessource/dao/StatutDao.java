package com.projet.AppPartageRessource.dao;

import com.projet.AppPartageRessource.model.Statut;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StatutDao extends JpaRepository<Statut, Integer> {

}
