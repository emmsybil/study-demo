package com.cw.common.domain.question;

import java.util.LinkedHashMap;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 问题内容类
 * @author yuanguangjie
 *
 */
@XStreamAlias("QuestionContent")
public class QuestionContent {

	@XStreamAlias("title")
	private String title; //题目
	@XStreamAlias("titleImg")
	private String titleImg = ""; // 题目图片
	@XStreamAlias("choiceList")
	private LinkedHashMap<String, String> choiceList; //选择题集合
	@XStreamAlias("choiceImgList")
	private LinkedHashMap<String, String> choiceImgList; // 选择题图片集合

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	public LinkedHashMap<String, String> getChoiceList() {
		return choiceList;
	}

	public void setChoiceList(LinkedHashMap<String, String> choiceList) {
		this.choiceList = choiceList;
	}

	public LinkedHashMap<String, String> getChoiceImgList() {
		return choiceImgList;
	}

	public void setChoiceImgList(LinkedHashMap<String, String> choiceImgList) {
		this.choiceImgList = choiceImgList;
	}

}
