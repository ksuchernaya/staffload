package Model;

import javax.persistence.*;

@Entity
@Table(name = "stream")
public class Stream {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "okr_id")
    private Long okr_id;

    @Column(name = "specialty_id")
    private Long specialty_id;

    public Stream() {
    }

    public Stream(String name, Long okr_id, Long specialty_id) {
        this.name = name;
        this.okr_id = okr_id;
        this.specialty_id = specialty_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getOkr_id() {
        return okr_id;
    }

    public void setOkr_id(Long okr_id) {
        this.okr_id = okr_id;
    }

    public Long getSpecialty_id() {
        return specialty_id;
    }

    public void setSpecialty_id(Long specialty_id) {
        this.specialty_id = specialty_id;
    }
}
