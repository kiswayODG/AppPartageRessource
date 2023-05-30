package com.projet.AppPartageRessource.dao;

import com.projet.AppPartageRessource.model.Document;
import com.projet.AppPartageRessource.model.Emprunt;
import com.projet.AppPartageRessource.model.Statut;
import com.projet.AppPartageRessource.model.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmpruntDao extends JpaRepository<Emprunt,Integer> {

    List<Emprunt> findByEtudiant(Utilisateur user);

//    @Query("SELECT e FROM emprunt  emp\n" +
//            "INNER JOIN utilisateur ut ON emp.etudiant_id = ut.id and emp.etudiant_id = :userId\n" +
//            "INNER JOIN document doc ON doc.id = emp.document_id\n" +
//            "where doc.statut = 'Indisponible' ;")
    List<Emprunt> findByEtudiantAndDoc_Statut(Utilisateur user, Statut statu);
}
