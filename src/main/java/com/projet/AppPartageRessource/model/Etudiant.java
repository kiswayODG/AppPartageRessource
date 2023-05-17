package com.projet.AppPartageRessource.model;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name="etudiantuser")
public class Etudiant extends AbstractEntity {

    @Column(name="ine")
    private String ine;

    @Column(name="nom")
    private String nom;

    @Column(name="prenom")
    private String prenom;

    @Column(name="dateNAiss")
    private Date dateNAiss;

    @Column(name="adress")
    private String adress;

    @Column(name="email")
    private String email;

    @Column(name="tel")
    private String tel;

    @OneToMany(mappedBy = "etudiant")
    private List<Document> documents;

    @ManyToOne
    @JoinColumn(name = "idFiliere")
    private Filiere filiere;



}
