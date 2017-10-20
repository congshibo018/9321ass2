package Entity;

import javax.persistence.*;

@Entity
@Table(name = "UNSWBookEntity", schema = "UNSWBook")
public class UnswBookEntityEntity {
    private int id;
    private String entityId;
    private String entityAttribute;
    private String attributeValue;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "entityId", nullable = false, length = 255)
    public String getEntityId() {
        return entityId;
    }

    public void setEntityId(String entityId) {
        this.entityId = entityId;
    }

    @Basic
    @Column(name = "entityAttribute", nullable = false, length = 255)
    public String getEntityAttribute() {
        return entityAttribute;
    }

    public void setEntityAttribute(String entityAttribute) {
        this.entityAttribute = entityAttribute;
    }

    @Basic
    @Column(name = "attributeValue", nullable = false, length = 255)
    public String getAttributeValue() {
        return attributeValue;
    }

    public void setAttributeValue(String attributeValue) {
        this.attributeValue = attributeValue;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UnswBookEntityEntity that = (UnswBookEntityEntity) o;

        if (id != that.id) return false;
        if (entityId != null ? !entityId.equals(that.entityId) : that.entityId != null) return false;
        if (entityAttribute != null ? !entityAttribute.equals(that.entityAttribute) : that.entityAttribute != null)
            return false;
        if (attributeValue != null ? !attributeValue.equals(that.attributeValue) : that.attributeValue != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (entityId != null ? entityId.hashCode() : 0);
        result = 31 * result + (entityAttribute != null ? entityAttribute.hashCode() : 0);
        result = 31 * result + (attributeValue != null ? attributeValue.hashCode() : 0);
        return result;
    }
}
