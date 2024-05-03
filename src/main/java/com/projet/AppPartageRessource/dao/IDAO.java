package com.projet.AppPartageRessource.dao;

import java.util.List;
import java.util.Optional;

public interface IDAO<T> {

 public T finBy(int i);

 public  List<T> findAll();

 public void create(T entity);

 public void createAll(List<T> entities);

 public  void update(T entity);

 public  void updateAll(List<T> entities);

 public void delete(T entity);

 public void deleteAll(List<T> entities);

}
