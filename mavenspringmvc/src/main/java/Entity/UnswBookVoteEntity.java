package Entity;

import javax.persistence.*;

@Entity
@Table(name = "UNSWBookVote", schema = "UNSWBook")
public class UnswBookVoteEntity {
    private int id;
    private int userId;
    private int messageId;
    private int thumbUp;

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
    @Column(name = "thumbUp", nullable = false)
    public int getThumbUp() {
        return thumbUp;
    }

    public void setThumbUp(int thumbUp) {
        this.thumbUp = thumbUp;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UnswBookVoteEntity that = (UnswBookVoteEntity) o;

        if (id != that.id) return false;
        if (userId != that.userId) return false;
        if (messageId != that.messageId) return false;
        if (thumbUp != that.thumbUp) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + userId;
        result = 31 * result + messageId;
        result = 31 * result + thumbUp;
        return result;
    }
}
