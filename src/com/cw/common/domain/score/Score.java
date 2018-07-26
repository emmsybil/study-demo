package com.cw.common.domain.score;
/**
*
*@author XieRong
*成绩管理实体类
*/
public class Score {

	private int id; //成绩管理编号
	private int stuNo; //学生编号
	private Double score; //分数
	private String pass; //1为及格、2为不及格
	private String fieldId; //知识点编号
	private String examTime; //考试时间
	private String makeUp; //补考
	private int creatorId; //成绩录入人编号
	private String creatorName; //录入人姓名
	private String createTime; //录入时间
	private String examId; // 考试编号
	private String trueName; //学生姓名
	private String groupName; //用户组名称
	private String examName; //考试名称
	private String fieldName; //知识点名称
	private String groupId; //学员组编号
	private int passScore; //及格分数
	private String examType; //考试类型1笔试，2机试
	
	
	public String getExamType() {
		return examType;
	}
	public void setExamType(String examType) {
		this.examType = examType;
	}
	public int getPassScore() {
		return passScore;
	}
	public void setPassScore(int passScore) {
		this.passScore = passScore;
	}
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStuNo() {
		return stuNo;
	}
	public void setStuNo(int stuNo) {
		this.stuNo = stuNo;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getFieldId() {
		return fieldId;
	}
	public void setFieldId(String fieldId) {
		this.fieldId = fieldId;
	}
	public String getExamTime() {
		return examTime;
	}
	public void setExamTime(String examTime) {
		this.examTime = examTime;
	}
	public String getMakeUp() {
		return makeUp;
	}
	public void setMakeUp(String makeUp) {
		this.makeUp = makeUp;
	}
	public int getCreatorId() {
		return creatorId;
	}
	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
	}
	public String getCreatorName() {
		return creatorName;
	}
	public void setCreatorName(String creatorName) {
		this.creatorName = creatorName;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getExamId() {
		return examId;
	}
	public void setExamId(String examId) {
		this.examId = examId;
	}
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	
	@Override
	public String toString() {
		return "Score [id=" + id + ", stuNo=" + stuNo + ", score=" + score + ", pass=" + pass + ", fieldId=" + fieldId
				+ ", examTime=" + examTime + ", makeUp=" + makeUp + ", creatorId=" + creatorId + ", creatorName="
				+ creatorName + ", createTime=" + createTime + ", examId=" + examId + ", trueName=" + trueName
				+ ", groupName=" + groupName + ", examName=" + examName + ", fieldName=" + fieldName + "]";
	}
	
}
