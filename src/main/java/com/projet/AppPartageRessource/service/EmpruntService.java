package com.projet.AppPartageRessource.service;

import com.projet.AppPartageRessource.dao.EmpruntDao;
import com.projet.AppPartageRessource.model.Emprunt;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class EmpruntService {

    private final EmpruntDao empDao;
    public void create(Emprunt emprunt) {
        empDao.save(emprunt);
    }
}
