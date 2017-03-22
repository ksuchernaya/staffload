package Model;

import javax.persistence.*;

@Entity
@Table(name = "faculty")
public class Faculty {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "short_name")
    private String short_name;

    public Faculty() {

    }

    public Faculty(String name, String short_name) {
        this.name = name;
        this.short_name = short_name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setShort_name(String short_name) {
        this.short_name = short_name;
    }

    public String getName() {
        return name;
    }

    public String getShort_name() {
        return short_name;
    }
}
