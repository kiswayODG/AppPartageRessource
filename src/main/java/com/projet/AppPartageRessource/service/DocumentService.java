package com.projet.AppPartageRessource.service;

import com.projet.AppPartageRessource.dao.DocumentDao;
import com.projet.AppPartageRessource.dao.TypeDocDao;
import com.projet.AppPartageRessource.model.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class DocumentService {


    private final DocumentDao docDao;
    private final TypeDocDao typeDao;
    private final UserService uService;
    private final EmpruntService empService;

    public List<Document> findUserDoc(Integer id) {
        Optional<Utilisateur> user = uService.findUser(id);
        if(user != null)
        return docDao.findByEtudiant(user);
        else
            return null;
    }

    public List<Document> findUserNotDocDispo(Statut statut, Integer id) {
        Utilisateur user = uService.findUser(id).get();
        if(user != null)
            return docDao.findByStatutAndEtudiantNot(statut,user);
        else
            return null;
    }

    public List<Type> getAllTypeDoc(){
        return typeDao.findAll();
    }


    public void create(Document doc) {
        docDao.save(doc);

    }

    public void createNewEmprunt(Utilisateur user, Integer idDoc) {
        Optional<Document> doc = docDao.findById(idDoc);
        if(doc !=null) {
            Document toSave = doc.get();
            toSave.setStatut(Statut.Indisponible);
            docDao.save(toSave);
           empService.create(new Emprunt(user,toSave));
        }
    }

    public void Archive(Integer docId) {
        Document toSave = docDao.findById(docId).get() ;
        toSave.setStatut(Statut.Archivé);
        docDao.save(toSave);
    }
}
