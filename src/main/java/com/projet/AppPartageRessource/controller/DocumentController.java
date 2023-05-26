package com.projet.AppPartageRessource.controller;

import com.projet.AppPartageRessource.model.Document;
import com.projet.AppPartageRessource.model.Statut;
import com.projet.AppPartageRessource.model.Utilisateur;
import com.projet.AppPartageRessource.service.DocumentService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.net.http.HttpRequest;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class DocumentController {

 private final  DocumentService docService ;

    @RequestMapping(value="/userDocs", method = RequestMethod.GET)
    public String indexUserDoc( HttpSession session, Model model){

        model.addAttribute("loggedInUser",session.getAttribute("loggedInUser"));
        model.addAttribute("doc", new Document());
        model.addAttribute("typesDoc",docService.getAllTypeDoc());
        model.addAttribute("documents",docService.findUserDoc(((Utilisateur)session.getAttribute("loggedInUser")).getId()));

        return "userDoc";
    }

    @RequestMapping(value="/userDocs", method = RequestMethod.POST)
    public String createDoc(@ModelAttribute("doc") Document doc, HttpSession session, ModelAndView model,
                            @RequestParam(name = "createOrUpdate", required = false) String createOrUpdate,
                            @RequestParam(name = "archive", required = false) String archive,
                            @RequestParam(name = "doc_id", required = false) Integer doc_id){
        if(createOrUpdate!=null && (createOrUpdate.equals("update") || createOrUpdate.equals("create"))) {
            if(createOrUpdate.equals("create"))
            doc.setStatut(Statut.Disponible);
            docService.create(doc);
            model.addObject("loggedInUser", session.getAttribute("loggedInUser"));
            model.addObject("documents", docService.findUserDoc(((Utilisateur) session.getAttribute("loggedInUser")).getId()));

            return "redirect:/userDocs";
        }

        if(archive.equals("archive")){
            docService.Archive(doc_id);
        }

        return "redirect:/userDocs";
    }

    @RequestMapping(value="/docDispos", method = RequestMethod.GET)
    public String giveDocDispo(HttpSession session, Model model){
        Statut statut = Statut.Disponible;
         List<Document> lisUserDoc = docService.findUserNotDocDispo(statut,((Utilisateur)session.getAttribute("loggedInUser")).getId());
        model.addAttribute("documents",lisUserDoc);
        return "docDispo";
    }

    @RequestMapping(value="/docDispos", method = RequestMethod.POST)
    public String empruntDispo(@RequestParam Integer idDoc, ModelAndView model,HttpSession session,@RequestParam(name="emprunter", required = false) String em){

        if(em.equals("EM")){
            model.addObject("documents",docService.findUserDoc(((Utilisateur)session.getAttribute("loggedInUser")).getId()));
            docService.createNewEmprunt((Utilisateur) session.getAttribute("loggedInUser"),idDoc);
            return "redirect:/docDispos";
        }
        Statut statut = Statut.Disponible;
        //List<Document> lisUserDoc = docService.findUserNotDoc(id);
        model.addObject("documents",docService.findUserNotDocDispo(statut,((Utilisateur)session.getAttribute("loggedInUser")).getId()));
        return "docDispo";
    }
}
