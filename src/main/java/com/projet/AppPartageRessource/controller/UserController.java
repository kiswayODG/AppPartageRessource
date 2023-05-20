package com.projet.AppPartageRessource.controller;

import com.projet.AppPartageRessource.model.Utilisateur;
import com.projet.AppPartageRessource.service.UserService;
import com.projet.AppPartageRessource.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator validator;

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new Utilisateur());

        return "registration";
    }

    @PostMapping("/enregistrement")
    public String registration(@ModelAttribute("userForm") Utilisateur userForm, BindingResult bindingResult) {
        validator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        return "redirect:/welcome";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", " Votre login ou mot de passe est invalide.");

        if (logout != null)
            model.addAttribute("message", "Déconnecté avec succès.");

        return "login";
    }

    @GetMapping({"/dashboard"})
    public String welcome(Model model) {
        return "dashboard";
    }
}