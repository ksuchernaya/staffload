package Model;

/**
 * Created by Ivan Kolomiyecs on 22.03.2017.
 */
public class Faculty {
    private String name;
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
