package Model;

import javax.persistence.*;

@Entity
@Table(name = "academic_degree")
public class Academic_degree {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name")
    private String name;

    public Academic_degree() {

    }

    public Academic_degree(String name) {
        this.name = name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
