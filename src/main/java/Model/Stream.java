package Model;

/**
 * Created by Ivan Kolomiyecs on 22.03.2017.
 */
public class Stream {
    private String name;
    private int okr_id;
    private int specialty_id;

    public Stream() {
    }

    public Stream(String name, int okr_id, int specialty_id) {
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

    public int getOkr_id() {
        return okr_id;
    }

    public void setOkr_id(int okr_id) {
        this.okr_id = okr_id;
    }

    public int getSpecialty_id() {
        return specialty_id;
    }

    public void setSpecialty_id(int specialty_id) {
        this.specialty_id = specialty_id;
    }
}
