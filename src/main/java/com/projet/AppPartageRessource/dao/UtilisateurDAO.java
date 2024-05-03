package com.projet.AppPartageRessource.dao;


import com.projet.AppPartageRessource.model.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UtilisateurDAO extends JpaRepository<Utilisateur,Integer>{

    Utilisateur findByNomIgnoreCase(String nom);

    Utilisateur findByIne(String ine);


    List<Utilisateur> findByOnlineIgnoreCase(String c);
}