package com.cw.common.domain.exam;

import java.io.Serializable;

/**
 * 信息实体类
 * 
 * @author yuanguangjie
 *
 */
public class Message implements Serializable {

	private static final long serialVersionUID = -2999571571280318844L;
	private String result = "success"; // 结果状态
	private int generatedId; // 生成的ID
	private String messageInfo; // 信息描述

	private Object object;

	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}

	public String getMessageInfo() {
		return messageInfo;
	}

	public void setMessageInfo(String messageInfo) {
		this.messageInfo = messageInfo;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public int getGeneratedId() {
		return generatedId;
	}

	public void setGeneratedId(int generatedId) {
		this.generatedId = generatedId;
	}

}
