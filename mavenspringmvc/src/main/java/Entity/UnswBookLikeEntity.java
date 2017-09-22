package Entity;

import javax.persistence.*;

@Entity
@Table(name = "UNSWBookLike", schema = "UNSWBook")
public class UnswBookLikeEntity {
    private int id;
    private int userId;
    private int messageId;
    private int like;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "userId", nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "messageId", nullable = false)
    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    @Basic
    @Column(name = "like", nullable = false)
    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UnswBookLikeEntity that = (UnswBookLikeEntity) o;

        if (id != that.id) return false;
        if (userId != that.userId) return false;
        if (messageId != that.messageId) return false;
        if (like != that.like) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + userId;
        result = 31 * result + messageId;
        result = 31 * result + like;
        return result;
    }
}
