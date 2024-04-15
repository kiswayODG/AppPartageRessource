package com.projet.AppPartageRessource.controller;

import com.projet.AppPartageRessource.model.Document;
import com.projet.AppPartageRessource.model.Emprunt;
import com.projet.AppPartageRessource.model.Statut;
import com.projet.AppPartageRessource.model.Utilisateur;
import com.projet.AppPartageRessource.service.DocumentService;
import com.projet.AppPartageRessource.service.EmpruntService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

import static com.projet.AppPartageRessource.model.Statut.Disponible;

@Controller
@RequiredArgsConstructor
public class EmpruntController {

    private final EmpruntService empService;
    private final DocumentService docService;

    @GetMapping(value="/emprunt.enCours")
    public String indexEmpruntCours(HttpSession session, Model model){
        Statut statut = Statut.Indisponible;
        List<Emprunt> lisEmprunt = empService.findUserDocEmpruntCours(statut,((Utilisateur)session.getAttribute("loggedInUser")).getId());
        model.addAttribute("documents",lisEmprunt);
        model.addAttribute("doc", new Document());
        return "empruntCours";
    }

    @PostMapping(value="/emprunt.enCours")
    public String EndEmprunt(@RequestParam(name = "emp_id", required = false) Integer emp_id, HttpSession session, Model model){
        Emprunt emp = empService.findEmpruntCoursByID(emp_id);
        emp.getDoc().setStatut(Disponible);
        docService.create(emp.getDoc());

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
