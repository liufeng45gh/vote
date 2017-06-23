package com.lucifer.model.vote;

import java.util.List;

/**
 * Created by liufx on 17/1/16.
 */
public class AppreciateCategory {

    private Long id;

    private String name;

    private String icon;

    private Float top;

    private Integer isDeleted;

    private List<Appreciate> appreciateList;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Float getTop() {
        return top;
    }

    public void setTop(Float top) {
        this.top = top;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public List<Appreciate> getAppreciateList() {
        return appreciateList;
    }

    public void setAppreciateList(List<Appreciate> appreciateList) {
        this.appreciateList = appreciateList;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }
}
