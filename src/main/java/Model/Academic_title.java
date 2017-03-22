package Model;

import javax.persistence.*;

@Entity
@Table(name = "academic_title")
public class Academic_title {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name")
    private String name;

    public Academic_title() {

    }

    public Academic_title(String name) {
        this.name = name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
