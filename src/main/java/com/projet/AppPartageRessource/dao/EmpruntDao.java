package com.projet.AppPartageRessource.dao;

import com.projet.AppPartageRessource.model.Emprunt;
import com.projet.AppPartageRessource.model.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EmpruntDao extends JpaRepository<Emprunt,Integer> {

    List<Emprunt> findByEtudiant(Utilisateur user);
}
