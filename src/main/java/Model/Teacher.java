package Model;

import javax.persistence.*;

@Entity
@Table(name = "teacher")
public class Teacher {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "last_name")
    private String last_name;

    @Column(name = "first_name")
    private String first_name;

    @Column(name = "middle_name")
    private String middle_name;

    @Column(name = "position_id")
    private int position_id;

    @Column(name = "academic_degree_id")
    private Long academic_degree_id;

    @Column(name = "academic_title_id")
    private Long academic_title_id;

    @Column(name = "wage_rate_percentage")
    private int wage_rate_percentage;

    @Column(name = "does_combine_jobs")
    private int does_combine_jobs;

    @Column(name = "specialty_id")
    private int specialty_id;

    public Teacher() {
    }

    public Teacher(String last_name, String first_name, String middle_name, int position_id,
                   Long academic_degree_id, Long academic_title_id, int wage_rate_percentage,
                   int does_combine_jobs, int specialty_id) {
        this.last_name = last_name;
        this.first_name = first_name;
        this.middle_name = middle_name;
        this.position_id = position_id;
        this.academic_degree_id = academic_degree_id;
        this.academic_title_id = academic_title_id;
        this.wage_rate_percentage = wage_rate_percentage;
        this.does_combine_jobs = does_combine_jobs;
        this.specialty_id = specialty_id;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getMiddle_name() {
        return middle_name;
    }

    public void setMiddle_name(String middle_name) {
        this.middle_name = middle_name;
    }

    public int getPosition_id() {
        return position_id;
    }

    public void setPosition_id(int position_id) {
        this.position_id = position_id;
    }

    public Long getAcademic_degree_id() {
        return academic_degree_id;
    }

    public void setAcademic_degree_id(Long academic_degree_id) {
        this.academic_degree_id = academic_degree_id;
    }

    public Long getAcademic_title_id() {
        return academic_title_id;
    }

    public void setAcademic_title_id(Long academic_title_id) {
        this.academic_title_id = academic_title_id;
    }

    public int getWage_rate_percentage() {
        return wage_rate_percentage;
    }

    public void setWage_rate_percentage(int wage_rate_percentage) {
        this.wage_rate_percentage = wage_rate_percentage;
    }

    public int getDoes_combine_jobs() {
        return does_combine_jobs;
    }

    public void setDoes_combine_jobs(int does_combine_jobs) {
        this.does_combine_jobs = does_combine_jobs;
    }

    public int getSpecialty_id() {
        return specialty_id;
    }

    public void setSpecialty_id(int specialty_id) {
        this.specialty_id = specialty_id;
    }
}
