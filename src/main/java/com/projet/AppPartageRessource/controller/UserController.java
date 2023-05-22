package com.projet.AppPartageRessource.controller;

import com.projet.AppPartageRessource.model.Filiere;
import com.projet.AppPartageRessource.model.Utilisateur;
import com.projet.AppPartageRessource.service.UserService;
import com.projet.AppPartageRessource.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator validator;

    @GetMapping("/registration")
    public String registration(Model model) {
        List<Filiere>filieres = userService.filiereList();
        System.out.println(filieres);
        model.addAttribute("user", new Utilisateur());
        model.addAttribute("Listfilieres", filieres);

        return "createUser";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("user") Utilisateur user, BindingResult bindingResult) {
        validator.validate(user, bindingResult);

        if (bindingResult.hasErrors()) {

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
    
    @RequestMapping(value="/login", method = RequestMethod.POST)
    public String checkLogin(Model model ,@RequestParam(name="login",required = false) String login, @RequestParam(name="password",required = false) String password){

    	if(userService.authentifier(login,password)) {
    		return "redirect:/success";
    	} else {
    		model.addAttribute("error","Mot de passe ou login incorrect");
            return "redirect:/login";
    	}
    	
    }

    @GetMapping("/success")
    public String welcome(Model model) {

        return "accueil";
    }
}