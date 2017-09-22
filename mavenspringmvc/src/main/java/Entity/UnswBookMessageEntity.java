package Entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "UNSWBookMessage", schema = "UNSWBook")
public class UnswBookMessageEntity {
    private int id;
    private int userId;
    private String title;
    private String content;
    private String image;
    private Timestamp time;
    private int like;
    private int unlike;
    private String url;

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
    @Column(name = "title", nullable = true, length = 255)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "content", nullable = true, length = 255)
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "image", nullable = true, length = 255)
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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
    @Column(name = "like", nullable = false)
    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    @Basic
    @Column(name = "unlike", nullable = false)
    public int getUnlike() {
        return unlike;
    }

    public void setUnlike(int unlike) {
        this.unlike = unlike;
    }

    @Basic
    @Column(name = "url", nullable = false, length = 255)
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UnswBookMessageEntity that = (UnswBookMessageEntity) o;

        if (id != that.id) return false;
        if (userId != that.userId) return false;
        if (like != that.like) return false;
        if (unlike != that.unlike) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;
        if (content != null ? !content.equals(that.content) : that.content != null) return false;
        if (image != null ? !image.equals(that.image) : that.image != null) return false;
        if (time != null ? !time.equals(that.time) : that.time != null) return false;
        if (url != null ? !url.equals(that.url) : that.url != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + userId;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (image != null ? image.hashCode() : 0);
        result = 31 * result + (time != null ? time.hashCode() : 0);
        result = 31 * result + like;
        result = 31 * result + unlike;
        result = 31 * result + (url != null ? url.hashCode() : 0);
        return result;
    }
}
