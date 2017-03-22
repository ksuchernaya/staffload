package Model;

import javax.persistence.*;

@Entity
@Table(name = "load")
//@IdClass(Stream.class)
public class Load {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "teacher_id")
    private Long teacher_id;

    @Column(name = "discipline_id")
    private Long discipline_id;

    @Column(name = "stream_id")
    private Long stream_id;

    @Column(name = "semester")
    private int semester;

    @Column(name = "academic_year")
    private String academic_year;

    public Long getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(Long teacher_id) {
        this.teacher_id = teacher_id;
    }

    public Long getDiscipline() {
        return discipline_id;
    }

    public void setDiscipline(Long discipline) {
        this.discipline_id = discipline;
    }

    public Long getStream_id() {
        return stream_id;
    }

    public void setStream_id(Long stream_id) {
        this.stream_id = stream_id;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public String getAcademic_year() {
        return academic_year;
    }

    public void setAcademic_year(String academic_year) {
        this.academic_year = academic_year;
    }
}
