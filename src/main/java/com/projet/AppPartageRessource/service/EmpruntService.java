package com.projet.AppPartageRessource.service;

import com.projet.AppPartageRessource.dao.DocumentDao;
import com.projet.AppPartageRessource.dao.EmpruntDao;
import com.projet.AppPartageRessource.dao.UtilisateurDAO;
import com.projet.AppPartageRessource.model.Document;
import com.projet.AppPartageRessource.model.Emprunt;
import com.projet.AppPartageRessource.model.Statut;
import com.projet.AppPartageRessource.model.Utilisateur;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class EmpruntService {

    private final EmpruntDao empDao;
    private final UtilisateurDAO userDao;
    public void create(Emprunt emprunt) {
        empDao.save(emprunt);

    }

    public List<Emprunt> findUserDocEmpruntCours(Statut statu, Integer id){
        Utilisateur user = userDao.findById(id).get();
        return empDao.findByEtudiantAndDoc_Statut(user,statu);
    }

    public List<Emprunt> findUserDocEmprunt(Integer loggedInUser) {
        Utilisateur user = userDao.findById(loggedInUser).get();
        return empDao.findByEtudiant(user);
    }
    public Emprunt findEmpruntCoursByID(Integer id) {
        
        Optional<Emprunt> emprunt = empDao.findById(id);
        return emprunt.get();
        
    }
}
