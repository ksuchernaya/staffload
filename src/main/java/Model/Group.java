package Model;

import javax.persistence.*;

@Entity
@Table(name = "group")
//@IdClass(Stream.class)
public class Group {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "stream_id")
    private Long stream_id;

    public Group() {

    }

    public Group(String name, Long stream_id) {
        this.name = name;
        this.stream_id = stream_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getStream_id() {
        return stream_id;
    }

    public void setStream_id(Long stream_id) {
        this.stream_id = stream_id;
    }
}
