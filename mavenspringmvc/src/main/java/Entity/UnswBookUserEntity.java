package Entity;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "UNSWBookUser", schema = "UNSWBook")
public class UnswBookUserEntity {
    private int id;
    private Date doB;
    private String emailAddress;
    private String gender;
    private String name;
    private String password;
    private String photo;
    private String username;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "DoB", nullable = false)
    public Date getDoB() {
        return doB;
    }

    public void setDoB(Date doB) {
        this.doB = doB;
    }

    @Basic
    @Column(name = "emailAddress", nullable = false, length = 255)
    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    @Basic
    @Column(name = "gender", nullable = false, length = 255)
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "password", nullable = false, length = 255)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "photo", nullable = true, length = 255)
    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Basic
    @Column(name = "username", nullable = false, length = 255)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UnswBookUserEntity that = (UnswBookUserEntity) o;

        if (id != that.id) return false;
        if (doB != null ? !doB.equals(that.doB) : that.doB != null) return false;
        if (emailAddress != null ? !emailAddress.equals(that.emailAddress) : that.emailAddress != null) return false;
        if (gender != null ? !gender.equals(that.gender) : that.gender != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (password != null ? !password.equals(that.password) : that.password != null) return false;
        if (photo != null ? !photo.equals(that.photo) : that.photo != null) return false;
        if (username != null ? !username.equals(that.username) : that.username != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (doB != null ? doB.hashCode() : 0);
        result = 31 * result + (emailAddress != null ? emailAddress.hashCode() : 0);
        result = 31 * result + (gender != null ? gender.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (photo != null ? photo.hashCode() : 0);
        result = 31 * result + (username != null ? username.hashCode() : 0);
        return result;
    }
}
