package com.projet.AppPartageRessource.model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name="filiere")
public class Filiere extends AbstractEntity {

    @Column(name="code")
    private Integer code;

    @Column(name="nom")
    private String libelle;

}
