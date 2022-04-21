package model;

import java.time.LocalDate;
import java.util.Objects;

public class Todo {
    private String name;
    private LocalDate createdAt;
    private LocalDate endAt;
    private boolean status;

    public Todo(){}

    public Todo(String name, LocalDate createdAt, LocalDate endAt, boolean status) {
        this.name = name;
        this.createdAt = createdAt;
        this.endAt = endAt;
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDate getEndAt() {
        return endAt;
    }

    public void setEndAt(LocalDate endAt) {
        this.endAt = endAt;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Todo{" +
                "name='" + name + '\'' +
                ", createdAt=" + createdAt +
                ", endAt=" + endAt +
                ", status=" + status +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Todo)) return false;
        Todo todo = (Todo) o;
        return getName().equals(todo.getName());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getName());
    }
}
