package Model;

import javax.persistence.*;

@Entity
@Table(name = "studies_type")
public class Studies_type {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name")
    private String name;

    public Studies_type() {
    }

    public Studies_type(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
