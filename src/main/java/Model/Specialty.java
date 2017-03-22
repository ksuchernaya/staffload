package Model;

/**
 * Created by Ivan Kolomiyecs on 22.03.2017.
 */
public class Specialty {
    private String name;
    private int faculty_id;

    public Specialty() {
    }

    public Specialty(String name, int faculty_id) {
        this.name = name;
        this.faculty_id = faculty_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getFaculty_id() {
        return faculty_id;
    }

    public void setFaculty_id(int faculty_id) {
        this.faculty_id = faculty_id;
    }
}
