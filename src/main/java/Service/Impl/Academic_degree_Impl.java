package Service.Impl;

import DAO.Academic_degree_DAO;
import Service.Academic_degree_service;
import Model.Academic_degree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class Academic_degree_Impl implements Academic_degree_service {

    @Autowired
    private Academic_degree_DAO academic_degree_dao;

    @Override
    public Academic_degree add_Academic_degree(Academic_degree academic_degree) {

        Academic_degree save_academic_degree
                = academic_degree_dao.saveAndFlush(academic_degree);

        return save_academic_degree;
    }

    @Override
    public void delete_Academic_degree(Long id) {
        academic_degree_dao.delete(id);
    }
}
