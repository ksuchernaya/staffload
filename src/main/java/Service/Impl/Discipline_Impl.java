package Service.Impl;

import DAO.Discipline_DAO;
import Model.Discipline;
import Service.Discipline_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Discipline_Impl implements Discipline_service{

    @Autowired
    Discipline_DAO discipline_DAO;

    @Override
    public Discipline add_Discipline(Discipline discipline) {
        Discipline save_Discipline = discipline_DAO.saveAndFlush(discipline);
        return save_Discipline;
    }

    @Override
    public void delete_Discipline(Long id) {
        discipline_DAO.delete(id);
    }
}
