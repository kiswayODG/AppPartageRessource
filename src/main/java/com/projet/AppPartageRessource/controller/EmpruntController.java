package com.projet.AppPartageRessource.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EmpruntController {

    @GetMapping(value = "/userHistorique")
    public String getHistorique(){

        return "historyEmprunt";
    }
}
