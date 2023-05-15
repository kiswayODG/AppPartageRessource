package com.projet.AppPartageRessource.model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

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


}
