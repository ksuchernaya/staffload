package DAO;

import Model.Faculty;
import org.springframework.data.jpa.repository.JpaRepository;

public interface Faculty_DAO extends JpaRepository<Faculty, Long> {
}