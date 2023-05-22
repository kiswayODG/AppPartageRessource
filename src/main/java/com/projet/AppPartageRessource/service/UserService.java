package com.projet.AppPartageRessource.service;

import java.util.HashSet;
import java.util.List;

import com.projet.AppPartageRessource.dao.FiliereDao;
import com.projet.AppPartageRessource.dao.RoleDao;
import com.projet.AppPartageRessource.dao.UtilisateurDAO;
import com.projet.AppPartageRessource.model.Filiere;
import com.projet.AppPartageRessource.model.Utilisateur;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


@Repository
public class UserService  {
    @Autowired
    private UtilisateurDAO uDao;

    @Autowired
    private FiliereDao fDao;
  //  @Autowired
    private RoleDao roleDao;
    //@Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

    public void save(Utilisateur user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
       // user.setRoles(new HashSet <> (roleDao.findAll("role")));
        uDao.save(user);
    }


    public Utilisateur findByUsername(String username) {
        return uDao.findByNomIgnoreCase(username);
    }

    public List<Filiere> filiereList(){
        return fDao.findAll();
    }

    public boolean authentifier(String login, String motDpass){
        Utilisateur user = uDao.findByIne(login);

        if (user != null) {
            return bCryptPasswordEncoder.matches(motDpass, user.getPassword());
        }else{
            return false;
        }
    }
}
