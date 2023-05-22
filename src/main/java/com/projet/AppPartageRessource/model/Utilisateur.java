package com.projet.AppPartageRessource.model;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name="utilisateur")
public class Utilisateur extends AbstractEntity {

    @Column(name="ine")
    private String ine;

    @Column(name="nom")
    private String nom;

    @Column(name="prenom")
    private String prenom;

    @Column(name="dateNaiss")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateNaiss;

    @Column(name="adress")
    private String adress;

    @Column(name="email")
    private String email;

    @Column(name="password")
    private String password;

    @Transient
    private String passwordConfirm;

    @Column(name="tel")
    private String tel;

    @OneToMany(mappedBy = "etudiant")
    private List<Document> documents;

    @ManyToOne
    @JoinColumn(name = "filiere_id")
    private Filiere filiere;

    @ManyToMany
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;




}
