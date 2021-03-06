package Entity;

import javax.persistence.*;

@Entity
@Table(name = "UNSWBookFriendship", schema = "UNSWBook")
public class UnswBookFriendshipEntity {
    private int id;
    private int fid;
    private int uid;
    private String status;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "Fid", nullable = false)
    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    @Basic
    @Column(name = "Uid", nullable = false)
    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    @Basic
    @Column(name = "status", nullable = false, length = 255)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UnswBookFriendshipEntity that = (UnswBookFriendshipEntity) o;

        if (id != that.id) return false;
        if (fid != that.fid) return false;
        if (uid != that.uid) return false;
        if (status != null ? !status.equals(that.status) : that.status != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + fid;
        result = 31 * result + uid;
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }
}
