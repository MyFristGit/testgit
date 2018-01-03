package com.udata.osp.entity;

import java.util.Date;

public class ServiceType {
    private Integer typeId;

    private String typeName;

    private String typeAuthor;

    private Date createTime;

    private Integer parentId;

    private String fwRoleId;

    private byte[] typeIcon;

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    public String getTypeAuthor() {
        return typeAuthor;
    }

    public void setTypeAuthor(String typeAuthor) {
        this.typeAuthor = typeAuthor == null ? null : typeAuthor.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getFwRoleId() {
        return fwRoleId;
    }

    public void setFwRoleId(String fwRoleId) {
        this.fwRoleId = fwRoleId == null ? null : fwRoleId.trim();
    }

    public byte[] getTypeIcon() {
        return typeIcon;
    }

    public void setTypeIcon(byte[] typeIcon) {
        this.typeIcon = typeIcon;
    }
}