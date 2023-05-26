package com.projet.AppPartageRessource.dao;

import com.projet.AppPartageRessource.model.Emprunt;
import com.projet.AppPartageRessource.model.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmpruntDao extends JpaRepository<Emprunt,Integer> {

    List<Emprunt> findByEtudiant(Utilisateur user);
}
