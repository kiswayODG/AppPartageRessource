package com.projet.AppPartageRessource.service;

import com.projet.AppPartageRessource.dao.DocumentDao;
import com.projet.AppPartageRessource.dao.StatutDao;
import com.projet.AppPartageRessource.dao.TypeDocDao;
import com.projet.AppPartageRessource.model.Document;
import com.projet.AppPartageRessource.model.Statut;
import com.projet.AppPartageRessource.model.Type;
import com.projet.AppPartageRessource.model.Utilisateur;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class DocumentService {


    private final DocumentDao docDao;
    private final TypeDocDao typeDao;
    private final UserService uService;
    private final StatutDao sDao;

    public List<Document> findUserDoc(Integer id) {
        Optional<Utilisateur> user = uService.findUser(id);
        if(user != null)
        return docDao.findByEtudiant(user);
        else
            return null;
    }

    public List<Document> findUserNotDoc(Integer id) {
        Optional<Utilisateur> user = uService.findUser(id);
        if(user != null)
            return docDao.findByEtudiantNot(user);
        else
            return null;
    }

    public List<Type> getAllTypeDoc(){
        return typeDao.findAll();
    }

    public List<Statut> getAllStatutDoc(){
        return sDao.findAll();
    }

    public void create(Document doc) {
        docDao.save(doc);
    }
}
