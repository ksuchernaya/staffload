package Model;

/**
 * Created by Ivan Kolomiyecs on 22.03.2017.
 */
public class Discipline {
    private String name;
    private int specialty_id;

    public Discipline() {
    }

    public Discipline(String name, int specialty_id) {
        this.name = name;
        this.specialty_id = specialty_id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSpecialty_id(int specialty_id) {
        this.specialty_id = specialty_id;
    }

    public String getName() {
        return name;
    }

    public int getSpecialty_id() {
        return specialty_id;
    }
}
