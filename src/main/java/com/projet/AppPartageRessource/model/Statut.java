package com.projet.AppPartageRessource.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


public enum Statut {

   Disponible,

    En_demande,
    Indisponible,
    Archivé;

    public static Statut DEFAULT = Disponible;
}
