package com.cw.common.domain.askForLeave;

/**
 *
 * @author XieRong 请假实体类
 */
public class AskForLeave {

	private String id; // 请假编号
	private int user_id; // 用户编号
	private int role_id; // 审批人用户编号
	private String create_time; // 申请时间
	private int type; // 请假类型：1病假、2事假、3其他
	private String reason; // 请假原因
	private String start_time; // 请假开始时间
	private String end_time; // 请假结束时间
	private int status; // 是否已审批：1是、0否
	private int audit; //审核是否通过：1已通过、0未通过
	private String true_name; //用户名
	private String group_name; //学生组名
	private String role_name; //审批人姓名
	private String day; //请假天数
	private String hour; //请假小时
	private String role; //用户权限
	
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getHour() {
		return hour;
	}

	public void setHour(String hour) {
		this.hour = hour;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public int getAudit() {
		return audit;
	}

	public void setAudit(int audit) {
		this.audit = audit;
	}

	public String getTrue_name() {
		return true_name;
	}

	public void setTrue_name(String true_name) {
		this.true_name = true_name;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getRole_id() {
		return role_id;
	}

	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {

		this.create_time = create_time;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	@Override
	public String toString() {
		return "AskForLeave [id=" + id + ", user_id=" + user_id + ", role_id=" + role_id + ", create_time="
				+ create_time + ", type=" + type + ", reason=" + reason + ", start_time=" + start_time + ", end_time="
				+ end_time + ", status=" + status + ", audit=" + audit + ", true_name=" + true_name + ", group_name="
				+ group_name + ", role_name=" + role_name + ", day=" + day + "]";
	}
}
