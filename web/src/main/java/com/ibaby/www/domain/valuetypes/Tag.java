package com.ibaby.www.domain.valuetypes;

import com.lhq.prj.bms.po.BaType;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-19
 * Time: AM10:57
 * To change this template use File | Settings | File Templates.
 */
public class Tag {

    private Integer id;
    private String name;
	private BaType catalog;
    private String description;
    private Integer parentId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BaType getCatalog() {
        return catalog;
    }

    public void setCatalog(BaType catalog) {
        this.catalog = catalog;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String toString(){
        return name;
    }
}
