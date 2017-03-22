package Service.Impl;

import DAO.Academic_title_DAO;
import Model.Academic_title;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import Service.Academic_title_service;

@Service
public class Academic_title_Impl implements Academic_title_service {

    @Autowired
    private Academic_title_DAO academic_title_dao;

    @Override
    public Academic_title add_Academic_title(Academic_title academic_title) {

        Academic_title save_academic_title
                = academic_title_dao.saveAndFlush(academic_title);

        return save_academic_title;
    }

    @Override
    public void delete_Academic_title(Long id) {
        academic_title_dao.delete(id);
    }
}
