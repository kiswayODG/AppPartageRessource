package com.projet.AppPartageRessource.dao;


import com.projet.AppPartageRessource.model.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UtilisateurDAO extends JpaRepository<Utilisateur,Integer>{

    Utilisateur findByNomIgnoreCase(String nom);

    Utilisateur findByIne(String ine);
}