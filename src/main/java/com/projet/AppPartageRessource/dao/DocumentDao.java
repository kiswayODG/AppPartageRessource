package com.projet.AppPartageRessource.dao;
import com.projet.AppPartageRessource.model.Document;
import com.projet.AppPartageRessource.model.Statut;
import com.projet.AppPartageRessource.model.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface DocumentDao extends JpaRepository<Document,Integer> {

     List<Document> findByEtudiant(Optional<Utilisateur> user);

     List<Document> findByEtudiantNot(Optional<Utilisateur> id);

     List<Document> findByStatutAndEtudiantNot(Statut statut, Utilisateur user);

     List<Document> findByStatutAndEtudiant(Statut statut, Utilisateur user);


     List<Document> findByEtudiantNotAndStatut(Utilisateur user, Statut statu);

     List<Document> findByEtudiantAndStatut(Utilisateur user, Statut statut);
}
