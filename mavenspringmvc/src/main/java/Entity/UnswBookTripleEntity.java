package Entity;

import javax.persistence.*;

@Entity
@Table(name = "UNSWBookTriple", schema = "UNSWBook", catalog = "")
public class UnswBookTripleEntity {
    private int id;
    private String nodeFrom;
    private String edge;
    private String nodeTo;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "nodeFrom", nullable = false, length = 255)
    public String getNodeFrom() {
        return nodeFrom;
    }

    public void setNodeFrom(String nodeFrom) {
        this.nodeFrom = nodeFrom;
    }

    @Basic
    @Column(name = "edge", nullable = false, length = 255)
    public String getEdge() {
        return edge;
    }

    public void setEdge(String edge) {
        this.edge = edge;
    }

    @Basic
    @Column(name = "nodeTo", nullable = false, length = 255)
    public String getNodeTo() {
        return nodeTo;
    }

    public void setNodeTo(String nodeTo) {
        this.nodeTo = nodeTo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UnswBookTripleEntity that = (UnswBookTripleEntity) o;

        if (id != that.id) return false;
        if (nodeFrom != null ? !nodeFrom.equals(that.nodeFrom) : that.nodeFrom != null) return false;
        if (edge != null ? !edge.equals(that.edge) : that.edge != null) return false;
        if (nodeTo != null ? !nodeTo.equals(that.nodeTo) : that.nodeTo != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (nodeFrom != null ? nodeFrom.hashCode() : 0);
        result = 31 * result + (edge != null ? edge.hashCode() : 0);
        result = 31 * result + (nodeTo != null ? nodeTo.hashCode() : 0);
        return result;
    }
}
