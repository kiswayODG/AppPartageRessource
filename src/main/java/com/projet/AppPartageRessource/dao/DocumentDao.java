package com.projet.AppPartageRessource.dao;

import com.projet.AppPartageRessource.model.Document;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DocumentDao extends JpaRepository<Document,Integer> {

     List<Document> findByEtudiant(Integer id);

     List<Document> findByEtudiantNot(Integer id);

     List<Document> findByStatut(String statut);

     Document findByStatutAndEtudiant(String statut, Integer id);

}
