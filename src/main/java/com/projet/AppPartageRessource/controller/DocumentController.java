package com.projet.AppPartageRessource.controller;

import com.projet.AppPartageRessource.model.Document;
import com.projet.AppPartageRessource.model.Utilisateur;
import com.projet.AppPartageRessource.service.DocumentService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class DocumentController {

 private final  DocumentService docService ;

    @RequestMapping(value="/userDocs", method = RequestMethod.GET)
    public String indexUserDoc(@RequestParam Integer id, HttpSession session, Model model){

        model.addAttribute("loggedInUser",session.getAttribute("loggedInUser"));
        model.addAttribute("doc", new Document());
        model.addAttribute("typesDoc",docService.getAllTypeDoc());
        model.addAttribute("statuts",docService.getAllStatutDoc());
        model.addAttribute("documents",docService.findUserDoc(id));

        return "userDoc";
    }

    @RequestMapping(value="/userDocs", method = RequestMethod.POST)
    public String createDoc(@ModelAttribute("doc") Document doc, Model model){
        docService.create(doc);
        return "redirect:/userDocs";
    }

    @RequestMapping(value="/docDispos", method = RequestMethod.GET)
    public String giveDocDispo(@RequestParam Integer id, Model model){

         List<Document> lisUserDoc = docService.findUserNotDoc(id);

        return "docDispo";
    }
}
