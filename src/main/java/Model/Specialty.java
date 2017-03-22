package Model;

import javax.persistence.*;

@Entity
@Table(name = "specialty")
public class Specialty {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "faculty_id")
    private Long faculty_id;

    public Specialty() {
    }

    public Specialty(String name, Long faculty_id) {
        this.name = name;
        this.faculty_id = faculty_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getFaculty_id() {
        return faculty_id;
    }

    public void setFaculty_id(Long faculty_id) {
        this.faculty_id = faculty_id;
    }
}
