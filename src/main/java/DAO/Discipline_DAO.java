package DAO;

import Model.Discipline;
import org.springframework.data.jpa.repository.JpaRepository;

public interface Discipline_DAO extends JpaRepository<Model.Discipline, Long> {
}