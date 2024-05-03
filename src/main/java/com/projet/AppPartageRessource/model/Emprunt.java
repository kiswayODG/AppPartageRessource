package com.projet.AppPartageRessource.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.Optional;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Emprunt extends AbstractEntity{

    @ManyToOne
    @JoinColumn(name = "etudiant_id")
    private Utilisateur etudiant;

    @ManyToOne
    @JoinColumn(name = "document_id")
    private Document doc;

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
