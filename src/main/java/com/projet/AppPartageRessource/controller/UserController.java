package com.projet.AppPartageRessource.controller;

import com.projet.AppPartageRessource.model.Filiere;
import com.projet.AppPartageRessource.model.Utilisateur;
import com.projet.AppPartageRessource.service.DocumentService;
import com.projet.AppPartageRessource.service.UserService;
import com.projet.AppPartageRessource.validator.UserValidator;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator validator;

    @Autowired
    private DocumentService docService;

    @GetMapping("/registration")
    public String registration(Model model) {
        List<Filiere>filieres = userService.filiereList();
        System.out.println(filieres);
        model.addAttribute("user", new Utilisateur());
        model.addAttribute("Listfilieres", filieres);

        return "createUser";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("user") Utilisateur user, BindingResult bindingResult,Model model) {
        validator.validate(user, bindingResult);

        if (bindingResult.hasErrors()) {
             model.addAttribute("errors",bindingResult.getAllErrors());
            return "createUser";
        }
        userService.save(user);

        return "redirect:/login";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {

        if (error != null)
            model.addAttribute("error", " Votre login ou mot de passe est invalide.");

        if (logout != null)
            model.addAttribute("message", "Déconnecté avec succès.");

        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String deconnexion(HttpSession session, Model model){
        userService.deconnexion((Utilisateur) session.getAttribute("loggedInUser"));
        session.removeAttribute("loggedInUser");

        return "redirect:/login";

    }
    
    @RequestMapping(value="/login", method = RequestMethod.POST)
    public String checkLogin( HttpSession session,Model model ,/*RedirectAttributes rattrs,*/ @RequestParam(name="login",required = false) String login, @RequestParam(name="password",required = false) String password){
    	if(userService.authentifier(login,password)) {

            Utilisateur userLogged = userService.findUserByIne(login);
            //rattrs.addAttribute("loggedInUser", userLogged);
           session.setAttribute("loggedInUser", userLogged);
    		return "redirect:/accueil";
    	} else {
    		model.addAttribute("error","Mot de passe ou login incorrect");
            return "login";
    	}
    	
    }

    @RequestMapping(value="/logOut", method = RequestMethod.GET)
    public String seDeconnecter(Model model , @RequestParam(name="login",required = false) String login, @RequestParam(name="password",required = false) String password){

//        if(userService.authentifier(login,password)) {
//            Utilisateur userLogged = userService.findUserByIne(login);
//            System.out.println(userLogged);
//            model.addAttribute("loggedInUser", userLogged);
//            return "accueil";
//        } else {
          //  model.addAttribute("error","Mot de passe ou login incorrect");
            return "redirect:/login";
      //  }

    }



    @RequestMapping(value = "/accueil", method = RequestMethod.GET)
    public String welcome(Model model, HttpSession session ) {
        model.addAttribute("loggedInUser",session.getAttribute("loggedInUser"));
        model.addAttribute("utilisateurTotal",userService.findUserNumber());
        model.addAttribute("docTotal",docService.countDocTotal());
        model.addAttribute("docEnEmprunt", docService.countDocEnEmprunt());
        model.addAttribute("userDoc",docService.findByUser((Utilisateur)session.getAttribute("loggedInUser")));
        return "accueil";
    }


}