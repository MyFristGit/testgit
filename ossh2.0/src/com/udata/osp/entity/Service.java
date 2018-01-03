package com.udata.osp.entity;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;

public class Service implements  Serializable{
    private Integer serviceId;

    private String serviceName;

    private String serviceAdress;

    private Integer servicePraiseNumber;

    private Integer serviceUseNumber;

    private Integer serviceBrowseNumber;

    private Date serviceCreateTime;

    private String serviceAuthor;

    private Integer typeId;
    
    private String roleId;

    private byte[] serviceIcon;
    
    private byte[]  flow_chart;
    
    private String service_detail;
    
    private String  service_time;
    
    private Integer comment_count;
    private Integer praise_count;
    private Integer collection_count;
    
    
    

    public Integer getComment_count() {
		return comment_count;
	}

	public void setComment_count(Integer comment_count) {
		this.comment_count = comment_count;
	}

	public Integer getPraise_count() {
		return praise_count;
	}

	public void setPraise_count(Integer praise_count) {
		this.praise_count = praise_count;
	}

	public Integer getCollection_count() {
		return collection_count;
	}

	public void setCollection_count(Integer collection_count) {
		this.collection_count = collection_count;
	}

	
    
    
    public byte[] getFlow_chart() {
		return flow_chart;
	}

	public void setFlow_chart(byte[] flow_chart) {
		this.flow_chart = flow_chart;
	}

	public String getService_detail() {
		return service_detail;
	}

	public void setService_detail(String service_detail) {
		this.service_detail = service_detail;
	}

	public String getService_time() {
		return service_time;
	}

	public void setService_time(String service_time) {
		this.service_time = service_time;
	}

	
    public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public Integer getServiceId() {
        return serviceId;
    }

    public void setServiceId(Integer serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName == null ? null : serviceName.trim();
    }

    public String getServiceAdress() {
        return serviceAdress;
    }

    public void setServiceAdress(String serviceAdress) {
        this.serviceAdress = serviceAdress == null ? null : serviceAdress.trim();
    }

    public Integer getServicePraiseNumber() {
        return servicePraiseNumber;
    }

    public void setServicePraiseNumber(Integer servicePraiseNumber) {
        this.servicePraiseNumber = servicePraiseNumber;
    }

    public Integer getServiceUseNumber() {
        return serviceUseNumber;
    }

    public void setServiceUseNumber(Integer serviceUseNumber) {
        this.serviceUseNumber = serviceUseNumber;
    }

    public Integer getServiceBrowseNumber() {
        return serviceBrowseNumber;
    }

    public void setServiceBrowseNumber(Integer serviceBrowseNumber) {
        this.serviceBrowseNumber = serviceBrowseNumber;
    }

    public Date getServiceCreateTime() {
        return serviceCreateTime;
    }

    public void setServiceCreateTime(Date serviceCreateTime) {
        this.serviceCreateTime = serviceCreateTime;
    }

    public String getServiceAuthor() {
        return serviceAuthor;
    }

    public void setServiceAuthor(String serviceAuthor) {
        this.serviceAuthor = serviceAuthor == null ? null : serviceAuthor.trim();
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public byte[] getServiceIcon() {
        return serviceIcon;
    }

    public void setServiceIcon(byte[] serviceIcon) {
        this.serviceIcon = serviceIcon;
    }

	@Override
	public String toString() {
		return "Service [serviceId=" + serviceId + ", serviceName=" + serviceName + ", serviceAdress=" + serviceAdress
				+ ", servicePraiseNumber=" + servicePraiseNumber + ", serviceUseNumber=" + serviceUseNumber
				+ ", serviceBrowseNumber=" + serviceBrowseNumber + ", serviceCreateTime=" + serviceCreateTime
				+ ", serviceAuthor=" + serviceAuthor + ", typeId=" + typeId + ", roleId=" + roleId + ", serviceIcon="
				+ Arrays.toString(serviceIcon) + "]";
	}
    
    
}