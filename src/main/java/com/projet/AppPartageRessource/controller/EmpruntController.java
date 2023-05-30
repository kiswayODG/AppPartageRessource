package com.projet.AppPartageRessource.controller;

import com.projet.AppPartageRessource.model.Document;
import com.projet.AppPartageRessource.model.Emprunt;
import com.projet.AppPartageRessource.model.Statut;
import com.projet.AppPartageRessource.model.Utilisateur;
import com.projet.AppPartageRessource.service.EmpruntService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class EmpruntController {

    private final EmpruntService empService;

    @GetMapping(value="/emprunt.enCours")
    public String indexEmpruntCours(HttpSession session, Model model){
        Statut statut = Statut.Indisponible;
        List<Emprunt> lisEmprunt = empService.findUserDocEmpruntCours(statut,((Utilisateur)session.getAttribute("loggedInUser")).getId());
        model.addAttribute("documents",lisEmprunt);
        model.addAttribute("doc", new Document());
        return "empruntCours";
    }

    @GetMapping(value = "/emprunt.historique")
    public String getHistorique(Model model, HttpSession session){

        List<Emprunt> lisEmprunt = empService.findUserDocEmprunt(((Utilisateur)session.getAttribute("loggedInUser")).getId());

        model.addAttribute("emprunts",lisEmprunt);
        return "historyEmprunt";
    }
}
