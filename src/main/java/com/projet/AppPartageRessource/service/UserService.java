package com.projet.AppPartageRessource.service;

import java.util.HashSet;

import com.projet.AppPartageRessource.dao.RoleDao;
import com.projet.AppPartageRessource.dao.UtilisateurDAO;
import com.projet.AppPartageRessource.model.Utilisateur;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


@Service
public class UserService  {
    @Autowired
    private UtilisateurDAO uDao;
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    public void save(Utilisateur user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(new HashSet <> (roleDao.findAll("role")));
        uDao.create(user);
    }


    public Utilisateur findByUsername(String username) {
        return uDao.findByUsername(username);
    }
}
