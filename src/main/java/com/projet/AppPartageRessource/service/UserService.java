package com.projet.AppPartageRessource.service;

import java.util.List;
import java.util.Optional;

import com.projet.AppPartageRessource.dao.FiliereDao;
import com.projet.AppPartageRessource.dao.RoleDao;
import com.projet.AppPartageRessource.dao.UtilisateurDAO;
import com.projet.AppPartageRessource.model.Filiere;
import com.projet.AppPartageRessource.model.Utilisateur;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


@Service
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

    public Optional<Utilisateur> findUser(Integer id){
        return  uDao.findById(id);
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
            boolean result = bCryptPasswordEncoder.matches(motDpass, user.getPassword());
            if (result)
                changeUserLogState(user);

            return result;
        }else{
            return false;
        }
    }

    public void deconnexion(Utilisateur user){
        changeUserLogState(user);
    }

    public void changeUserLogState(Utilisateur user){
        if(user.getOnline().equalsIgnoreCase("N")){
        user.setOnline("O");
        uDao.save(user);
        }else{
            user.setOnline("N");
            uDao.save(user);
        }
    }

    public List<Utilisateur> findUserLogged(){
        return uDao.findByOnlineIgnoreCase("O");
    }

    public Utilisateur findUserByIne(String ine){
        return uDao.findByIne(ine);
    }
}
