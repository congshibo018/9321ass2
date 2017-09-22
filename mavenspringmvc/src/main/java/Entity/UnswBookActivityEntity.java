package Entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "UNSWBookActivity", schema = "UNSWBook")
public class UnswBookActivityEntity {
    private int id;
    private String activity;
    private Timestamp time;
    private int userId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "activity", nullable = false, length = 255)
    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    @Basic
    @Column(name = "time", nullable = false)
    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    @Basic
    @Column(name = "userId", nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UnswBookActivityEntity that = (UnswBookActivityEntity) o;

        if (id != that.id) return false;
        if (userId != that.userId) return false;
        if (activity != null ? !activity.equals(that.activity) : that.activity != null) return false;
        if (time != null ? !time.equals(that.time) : that.time != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (activity != null ? activity.hashCode() : 0);
        result = 31 * result + (time != null ? time.hashCode() : 0);
        result = 31 * result + userId;
        return result;
    }
}
