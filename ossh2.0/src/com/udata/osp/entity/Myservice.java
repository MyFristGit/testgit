package com.udata.osp.entity;

/**
 * 
 * @author 周有亮 每个人的服务
 * 
 */
public class Myservice {
	private int serivceId;
	private String serviceName;
	private byte[] serviceIcon;
	private String serviceAdress;
	private int typeId;
	private String typeName;
	private byte[] typeIcon;

	public int getSerivceId() {
		return serivceId;
	}

	public void setSerivceId(int serivceId) {
		this.serivceId = serivceId;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public byte[] getServiceIcon() {
		return serviceIcon;
	}

	public void setServiceIcon(byte[] serviceIcon) {
		this.serviceIcon = serviceIcon;
	}

	public String getServiceAdress() {
		return serviceAdress;
	}

	public void setServiceAdress(String serviceAdress) {
		this.serviceAdress = serviceAdress;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public byte[] getTypeIcon() {
		return typeIcon;
	}

	public void setTypeIcon(byte[] typeIcon) {
		this.typeIcon = typeIcon;
	}

}
