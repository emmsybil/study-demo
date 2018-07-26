function checkUserName() {
	var username = $(".form-username input").val();

	var regex = /^[0-9a-zA-Z]+$/;

	if (username == "") {
		$(".form-username .form-message").text("用户名不能为空");
		return false;
	} else if (username.length > 20 || username.length < 4) {
		$(".form-username .form-message").text("请保持在4-20个字符以内");
		return false;
	} else if (!regex.test(username)) {
		$(".form-username .form-message").text("只能是数字字母或者下划线的组合");
		return false;
	}

	$.ajax({
		url : '/exam-student/judgeUser',
		type : 'post',
		data : {
			userName : username
		},
		dataType : 'json',
		success : function(message, tst, jqXHR) {
			if (message.result == "success") {
				$(".form-username .form-message").text("用户名可以使用");
				return true;
			} else {
				$(".form-username .form-message").text("用户名已存在");
				return false;
			}
		}
	})
	return true;
}

function checkTrueName() {
	var truename = $(".form-truename input").val();
	if (truename == "") {
		$(".form-truename .form-message").text("姓名不能为空");
		return false;
	} else if (truename.length > 20 || truename.length < 2) {
		$(".form-truename .form-message").text("请保持在2-20个字符以内");
		return false;
	}

	$.ajax({
		url : '/exam-student/judgeUser',
		type : 'post',
		data : {
			trueName : truename
		},
		dataType : 'json',
		success : function(message, tst, jqXHR) {
			if (message.result == "success") {
				$(".form-truename .form-message").text("姓名可以使用");
				return true;
			} else {
				$(".form-truename .form-message").text("姓名已存在");
				return false;
			}
		}
	})
	return true;
}

function checkGender() {
	var gender = $("#gender-input-select").val();
	if (gender == "-1") {
		$(".form-gender .form-message").text("请选择性别");
		return false;
	}
	$(".form-gender .form-message").empty();
	return true;
}

function checkPassword() {
	var password = $(".form-password input").val();
	if (password == "") {
		$(".form-password .form-message").text("密码不能为空");
		return false;
	} else if (password.length < 6 || password.length > 20) {
		$(".form-password .form-message").text("密码请保持在6到20个字符以内");
		return false;
	} else {
		$(".form-password .form-message").empty();
		return true;
	}
}

function checkAddress() {
	var address = $(".form-address input").val();
	if (address == "") {
		$(".form-address .form-message").text("请填写家庭住址");
		return false;
	}
	$(".form-address .form-message").empty();
	return true;
}

function checkBirthday() {
	var birthday = $(".form-birthday input").val();
	if (birthday == "") {
		$(".form-birthday .form-message").text("请选择生日");
		return false;
	}
	$(".form-birthday .form-message").empty();
	return true;
}

function checkEducation() {
	var education = $("#education-input-select").val();
	if (education == "-1") {
		$(".form-education .form-message").text("请选择学历");
		return false;
	}
	$(".form-education .form-message").empty();
	return true;
}

function checkEnrolledTime() {
	var enrolledTime = $(".form-enrolledTime input").val();
	if (enrolledTime == "") {
		$(".form-enrolledTime .form-message").text("请选择入学日期");
		return false;
	}
	$(".form-enrolledTime .form-message").empty();
	return true;
}

function checkEmergencyCall() {
	var emergencyCall = $(".form-emergencyCall input").val();
	if (emergencyCall == "") {
		$(".form-emergencyCall .form-message").text("请填写紧急联系人号码");
		return false;
	} else {
		var myreg = /^(0|86|17951)?(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$/;
		if (emergencyCall.length != 11) {
			$(".form-emergencyCall .form-message").text("请输入有效的手机号码！");
			return false;
		} else if (!myreg.test(emergencyCall)) {
			$(".form-emergencyCall .form-message").text("请输入有效的手机号码！");
			return false;
		} else {
			$(".form-emergencyCall .form-message").empty();
			return true;
		}
	}
}

function checKindred() {
	var kindred = $("#kindred-input-select").val();
	if (kindred == "-1") {
		$(".form-kindred .form-message").text("请选择亲属关系");
		return false;
	}
	$(".form-kindred .form-message").empty();
	return true;
}

function checkDepartment() {
	var department = $("#department-input-select").val();
	if (department == "-1") {
		$(".form-department .form-message").text("请选择所在班级");
		return false;
	}
	$(".form-department .form-message").empty();
	return true;
}

function checkEmail() {
	var email = $(".form-email input").val();
	if (email == "") {
		$(".form-email .form-message").text("邮箱不能为空");
		return false;
	} else if (email.length > 60 || email.length < 9) {
		$(".form-email .form-message").text("请保持在9-60个字符以内");
		return false;
	} else {
		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		if (re.test(email)) {
			$(".form-email .form-message").empty();
			return true;
		} else {
			$(".form-email .form-message").text("无效的邮箱");
			return false;
		}
	}
}

function checkPhoneNum() {
	var phonenum = $(".form-phone input").val();
	if (phonenum == "") {
		$(".form-phone .form-message").text("号码不能为空");
		return false;
	} else {
		var re = /^(0|86|17951)?(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$/;
		if (!re.test(phonenum)) {
			$(".form-phone .form-message").text("手机不合法");
			return false;
		} else {
			$(".form-phone .form-message").empty();
			return true;
		}
	}
}

function checkConfirmPassword() {
	var password_confirm = $(".form-password-confirm input").val();
	var password = $(".form-password input").val();
	if (password_confirm == "") {
		$(".form-password-confirm .form-message").text("请再输入一次密码");
		return false;
	} else if (password_confirm.length > 20) {
		$(".form-password-confirm .form-message").text("内容过长，请保持在20个字符以内");
		return false;
	} else if (password_confirm != password) {
		$(".form-password-confirm .form-message").text("2次密码输入不一致");
		return false;
	} else {
		$(".form-password-confirm .form-message").empty();
		return true;
	}
}

function checkNationalId() {
	var idcard = $(".form-national-id input").val();
	if (idcard == "") {
		$(".form-national-id .form-message").text("单位不能为空");
		return false;
	} else if (idcard.length > 20 || idcard.idcard < 5) {
		$(".form-national-id .form-message").text("请保持在5-20个字符以内");
		return false;
	} else {
		var re = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		if (!re.test(idcard)) {
			$(".form-national-id .form-message").text("身份证信息不合法");
			return false;
		} else {
			$(".form-national-id .form-message").empty();
			return true;
		}
	}
}

function bindSubmitForm() {
	var result = verifyInput();
	if (result) {
		var data = new Object();
		data.userName = $(".form-username input").val();
		data.email = $(".form-email input").val();
		data.password = $(".form-password input").val();
		//data.fieldId = $("#job-type-input-select").val();
		data.company = $(".form-company input").val();
		data.phoneNum = $(".form-phone input").val();
		data.nationalId = $(".form-national-id input").val();
		data.trueName = $(".form-truename input").val();
		data.depId = $("#department-input-select").val();
		data.kindred = $("#kindred-input-select").val();
		data.emergencyCall = $(".form-emergencyCall input").val();
		data.education = $("#education-input-select").val();
		data.birthday = $(".form-birthday input").val();
		data.enrolledTime = $(".form-enrolledTime input").val();
		data.gender = $("#gender-input-select").val();
		data.address = $(".form-address input").val();
		console.log(data);
		jQuery.ajax({
			headers : {
				'Accept' : 'application/json',
				'Content-Type' : 'application/json'
			},
			type : "POST",
			url : "/exam-student/add-user",
			data : JSON.stringify(data),
			success : function(message, tst, jqXHR) {
				if (message.result == "success") {
					util.success("添加成功！", function() {
						window.location.reload();
					});
				} else {
					if (message.result == "duplicate-username") {
						$(".form-username .form-message").text(
								message.messageInfo);
					} else if (message.result == "duplicate-national-id") {
						$(".form-national-id .form-message").text(
								message.messageInfo);
					} else if (message.result == "duplicate-email") {
						$(".form-email .form-message")
								.text(message.messageInfo);
					} else if (message.result == "duplicate-phone") {
						$(".form-phone .form-message")
								.text(message.messageInfo);
					} else {
						alert(message.result);
					}
				}
			}
		});
	}
	return false;
}

function verifyInput() {
	$(".form-message").empty();
	var result = true;
	var check_u = checkUserName();
	var check_t = checkTrueName();
	var check_e = checkEmail();
	var check_p = checkPassword();

	var check_pc = checkConfirmPassword();

	var check_id = checkNationalId();

	var check_phone = checkPhoneNum();

	var check_dep = checkDepartment();

	var check_kind = checKindred();

	var check_emer = checkEmergencyCall();

	var check_bir = checkBirthday();

	var check_edu = checkEducation();

	var check_enrT = checkEnrolledTime();

	var check_sex = checkGender();

	var check_Add = checkAddress();

	result = check_u && check_t && check_e && check_p && check_pc && check_id
			&& check_phone && check_dep && check_kind && check_sex && check_bir
			&& check_edu && check_enrT && check_Add && check_emer;
	return result;
}
