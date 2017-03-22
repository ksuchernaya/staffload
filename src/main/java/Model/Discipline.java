package Model;

import javax.persistence.*;

@Entity
@Table(name = "Discipline_DAO")
//@IdClass(Specialty.class)
//@Embeddable
public class Discipline {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "specialty_id")
    private Long specialty_id;

    public Discipline() {
    }

    public Discipline(String name, Long specialty_id) {
        this.name = name;
        this.specialty_id = specialty_id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSpecialty_id(Long specialty_id) {
        this.specialty_id = specialty_id;
    }

    public String getName() {
        return name;
    }

    public long getSpecialty_id() {
        return specialty_id;
    }
}
