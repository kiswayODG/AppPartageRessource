package com.projet.AppPartageRessource.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name="document")
public class Document extends AbstractEntity{

    @Column(name="titre")
    private String titre;

    @Column(name="auteurs")
    private String auteurs;

    @Column(name="domaine")
    private String domaine;

    @Column (name="resume")
    private String resume;

    @ManyToOne
    @JoinColumn(name = "idEtudiant")
    private Utilisateur etudiant;

    @ManyToOne
    @JoinColumn(name = "typeId")
    private Type type;

    @ManyToOne
    @JoinColumn(name = "statutId")
    private Statut statut;
}
