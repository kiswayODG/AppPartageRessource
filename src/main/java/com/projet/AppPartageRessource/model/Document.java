package com.projet.AppPartageRessource.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

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

    @Column (name="etat")
    private String etat;

    @ManyToOne
    @JoinColumn(name = "idEtudiant")
    private Utilisateur etudiant;

    @ManyToOne
    @JoinColumn(name = "typeId")
    private Type type;

   @Enumerated(EnumType.STRING)
    private Statut statut;

    @PrePersist
    protected void onCreate() {
        super.setCreateAt(new Date());
        super.setUpdateAt(new Date());
    }

    @PreUpdate
    protected void onUpdate() {
        super.setUpdateAt(new Date());
    }

}
