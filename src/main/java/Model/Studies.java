package Model;

import javax.persistence.*;

@Entity
@Table(name = "studies")
public class Studies {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "studies_type_id")
    private Long studies_type_id;

    @Column(name = "discipline_id")
    private Long discipline_id;

    @Column(name = "hours_budget_x10")
    private int hours_budget_x10;

    @Column(name = "hours_contract_x10")
    private int hours_contract_x10;

    public Studies() {
    }

    public Studies(Long studies_type_id, Long discipline_id, int hours_budget_x10, int hours_contract_x10) {
        this.studies_type_id = studies_type_id;
        this.discipline_id = discipline_id;
        this.hours_budget_x10 = hours_budget_x10;
        this.hours_contract_x10 = hours_contract_x10;
    }

    public Long getStudies_type_id() {
        return studies_type_id;
    }

    public void setStudies_type_id(Long studies_type_id) {
        this.studies_type_id = studies_type_id;
    }

    public Long getDiscipline_id() {
        return discipline_id;
    }

    public void setDiscipline_id(Long discipline_id) {
        this.discipline_id = discipline_id;
    }

    public int getHours_budget_x10() {
        return hours_budget_x10;
    }

    public void setHours_budget_x10(int hours_budget_x10) {
        this.hours_budget_x10 = hours_budget_x10;
    }

    public int getHours_contract_x10() {
        return hours_contract_x10;
    }

    public void setHours_contract_x10(int hours_contract_x10) {
        this.hours_contract_x10 = hours_contract_x10;
    }
}
