package Model;

/**
 * Created by Ivan Kolomiyecs on 22.03.2017.
 */
public class Studies {
    private int studies_type_id;
    private int discipline_id;
    private int hours_budget_x10;
    private int hours_contract_x10;

    public Studies() {
    }

    public Studies(int studies_type_id, int discipline_id, int hours_budget_x10, int hours_contract_x10) {
        this.studies_type_id = studies_type_id;
        this.discipline_id = discipline_id;
        this.hours_budget_x10 = hours_budget_x10;
        this.hours_contract_x10 = hours_contract_x10;
    }

    public int getStudies_type_id() {
        return studies_type_id;
    }

    public void setStudies_type_id(int studies_type_id) {
        this.studies_type_id = studies_type_id;
    }

    public int getDiscipline_id() {
        return discipline_id;
    }

    public void setDiscipline_id(int discipline_id) {
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
