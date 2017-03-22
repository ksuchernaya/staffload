package Service.Impl;

import DAO.Faculty_DAO;
import Model.Faculty;
import Service.Faculty_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Faculty_Impl implements Faculty_service {

    @Autowired
    Faculty_DAO faculty_dao;

    @Override
    public Faculty addFaculty(Faculty faculty) {
        Faculty saveFaculty = faculty_dao.saveAndFlush(faculty);
        return saveFaculty;
    }

    @Override
    public void deleteFaculty(Long id) {
        faculty_dao.delete(id);
    }
}
