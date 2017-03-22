package Model;

/**
 * Created by Ivan Kolomiyecs on 22.03.2017.
 */
public class Group {
    private String name;
    private int stream_id;

    public Group() {

    }

    public Group(String name, int stream_id) {
        this.name = name;
        this.stream_id = stream_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStream_id() {
        return stream_id;
    }

    public void setStream_id(int stream_id) {
        this.stream_id = stream_id;
    }
}
