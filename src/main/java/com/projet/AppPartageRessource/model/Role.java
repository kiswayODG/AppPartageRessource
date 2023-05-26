package com.projet.AppPartageRessource.model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import lombok.Data;

import java.util.Set;

@Entity
@Data
@Table(name = "role")
public class Role extends AbstractEntity{

    @Column(name = "libelle")
    private String libelle;

//    @ManyToMany(mappedBy = "roles")
//    private Set<Utilisateur> users;

}
