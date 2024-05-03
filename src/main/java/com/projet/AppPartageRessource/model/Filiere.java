package com.projet.AppPartageRessource.model;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name="filiere")
public class Filiere extends AbstractEntity {

    @Column(name="code")
    private String code;

    @Column(name="nom")
    private String libelle;

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
