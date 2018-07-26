$(function() {
	$("#current-role").click(function() {
		if ($("#switch-role").is(":hidden")) {
			$("#switch-role").show();
		} else {
			$("#switch-role").hide();
		}
		return false;
	});

	var switch_role_links = $("ul#switch-role li");
	switch_role_links.each(function(index) {
		$(this).bind(
				"click",
				function() {
					document.location.href = document
							.getElementsByTagName('base')[0].href
							+ $(this).attr('value') + "/home";
				});
	});

	util.oddRowPrinter();
});

function url(url) {
	var iTop = (window.screen.availHeight - 30 - 600) / 2;
	var iLeft = (window.screen.availWidth - 10 - 800) / 2;
	window.open(url, "_blank", " top=" + iTop + ",left=" + iLeft
			+ ",width=800, height=600,");
}

var util = {
	checkSessionOut : function checkSessionOut(jqXHR) {
		var ct = jqXHR.getResponseHeader("content-type") || "";
		if (ct.indexOf('html') > -1) {
			util.error("登陆过期", function() {
				window.location.reload();
			});
			return false;
		} else {
			return true;
		}

	},
	getCurrentRole : function getCurrentRole() {
		// return $("#rule-role-val").text();
		// 获取用户名，请求用
		return $("#system-info-account").text();
	},
	oddRowPrinter : function oddRowPrinter() {
		if (this.getInternetExplorerVersion() == 8.0) {
			$("table.de-table tbody tr:nth-child(odd)").addClass("odd-row");
		} else {
			return false;
		}
	},
	parseDate : function parseDate(timestamp) {
		var newDate = new Date();
		newDate.setTime(timestamp);
		return newDate.toLocaleTimeString();
	},

	getInternetExplorerVersion : function getInternetExplorerVersion() {
		var rv = -1; // Return value assumes failure.
		if (navigator.appName == 'Microsoft Internet Explorer') {
			var ua = navigator.userAgent;
			var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
			if (re.exec(ua) != null)
				rv = parseFloat(RegExp.$1);
		}
		return rv;
	},

	MD5 : function MD5(string) {
		function RotateLeft(lValue, iShiftBits) {
			return (lValue << iShiftBits) | (lValue >>> (32 - iShiftBits));
		}

		function AddUnsigned(lX, lY) {
			var lX4, lY4, lX8, lY8, lResult;
			lX8 = (lX & 0x80000000);
			lY8 = (lY & 0x80000000);
			lX4 = (lX & 0x40000000);
			lY4 = (lY & 0x40000000);
			lResult = (lX & 0x3FFFFFFF) + (lY & 0x3FFFFFFF);
			if (lX4 & lY4) {
				return (lResult ^ 0x80000000 ^ lX8 ^ lY8);
			}
			if (lX4 | lY4) {
				if (lResult & 0x40000000) {
					return (lResult ^ 0xC0000000 ^ lX8 ^ lY8);
				} else {
					return (lResult ^ 0x40000000 ^ lX8 ^ lY8);
				}
			} else {
				return (lResult ^ lX8 ^ lY8);
			}
		}

		function F(x, y, z) {
			return (x & y) | ((~x) & z);
		}
		function G(x, y, z) {
			return (x & z) | (y & (~z));
		}
		function H(x, y, z) {
			return (x ^ y ^ z);
		}
		function I(x, y, z) {
			return (y ^ (x | (~z)));
		}

		function FF(a, b, c, d, x, s, ac) {
			a = AddUnsigned(a, AddUnsigned(AddUnsigned(F(b, c, d), x), ac));
			return AddUnsigned(RotateLeft(a, s), b);
		}
		;

		function GG(a, b, c, d, x, s, ac) {
			a = AddUnsigned(a, AddUnsigned(AddUnsigned(G(b, c, d), x), ac));
			return AddUnsigned(RotateLeft(a, s), b);
		}
		;

		function HH(a, b, c, d, x, s, ac) {
			a = AddUnsigned(a, AddUnsigned(AddUnsigned(H(b, c, d), x), ac));
			return AddUnsigned(RotateLeft(a, s), b);
		}
		;

		function II(a, b, c, d, x, s, ac) {
			a = AddUnsigned(a, AddUnsigned(AddUnsigned(I(b, c, d), x), ac));
			return AddUnsigned(RotateLeft(a, s), b);
		}
		;

		function ConvertToWordArray(string) {
			var lWordCount;
			var lMessageLength = string.length;
			var lNumberOfWords_temp1 = lMessageLength + 8;
			var lNumberOfWords_temp2 = (lNumberOfWords_temp1 - (lNumberOfWords_temp1 % 64)) / 64;
			var lNumberOfWords = (lNumberOfWords_temp2 + 1) * 16;
			var lWordArray = Array(lNumberOfWords - 1);
			var lBytePosition = 0;
			var lByteCount = 0;
			while (lByteCount < lMessageLength) {
				lWordCount = (lByteCount - (lByteCount % 4)) / 4;
				lBytePosition = (lByteCount % 4) * 8;
				lWordArray[lWordCount] = (lWordArray[lWordCount] | (string
						.charCodeAt(lByteCount) << lBytePosition));
				lByteCount++;
			}
			lWordCount = (lByteCount - (lByteCount % 4)) / 4;
			lBytePosition = (lByteCount % 4) * 8;
			lWordArray[lWordCount] = lWordArray[lWordCount]
					| (0x80 << lBytePosition);
			lWordArray[lNumberOfWords - 2] = lMessageLength << 3;
			lWordArray[lNumberOfWords - 1] = lMessageLength >>> 29;
			return lWordArray;
		}
		;

		function WordToHex(lValue) {
			var WordToHexValue = "", WordToHexValue_temp = "", lByte, lCount;
			for (lCount = 0; lCount <= 3; lCount++) {
				lByte = (lValue >>> (lCount * 8)) & 255;
				WordToHexValue_temp = "0" + lByte.toString(16);
				WordToHexValue = WordToHexValue
						+ WordToHexValue_temp.substr(
								WordToHexValue_temp.length - 2, 2);
			}
			return WordToHexValue;
		}
		;

		function Utf8Encode(string) {
			string = string.replace(/\r\n/g, "\n");
			var utftext = "";

			for (var n = 0; n < string.length; n++) {

				var c = string.charCodeAt(n);

				if (c < 128) {
					utftext += String.fromCharCode(c);
				} else if ((c > 127) && (c < 2048)) {
					utftext += String.fromCharCode((c >> 6) | 192);
					utftext += String.fromCharCode((c & 63) | 128);
				} else {
					utftext += String.fromCharCode((c >> 12) | 224);
					utftext += String.fromCharCode(((c >> 6) & 63) | 128);
					utftext += String.fromCharCode((c & 63) | 128);
				}

			}

			return utftext;
		}
		;

		var x = Array();
		var k, AA, BB, CC, DD, a, b, c, d;
		var S11 = 7, S12 = 12, S13 = 17, S14 = 22;
		var S21 = 5, S22 = 9, S23 = 14, S24 = 20;
		var S31 = 4, S32 = 11, S33 = 16, S34 = 23;
		var S41 = 6, S42 = 10, S43 = 15, S44 = 21;

		string = Utf8Encode(string);

		x = ConvertToWordArray(string);

		a = 0x67452301;
		b = 0xEFCDAB89;
		c = 0x98BADCFE;
		d = 0x10325476;

		for (k = 0; k < x.length; k += 16) {
			AA = a;
			BB = b;
			CC = c;
			DD = d;
			a = FF(a, b, c, d, x[k + 0], S11, 0xD76AA478);
			d = FF(d, a, b, c, x[k + 1], S12, 0xE8C7B756);
			c = FF(c, d, a, b, x[k + 2], S13, 0x242070DB);
			b = FF(b, c, d, a, x[k + 3], S14, 0xC1BDCEEE);
			a = FF(a, b, c, d, x[k + 4], S11, 0xF57C0FAF);
			d = FF(d, a, b, c, x[k + 5], S12, 0x4787C62A);
			c = FF(c, d, a, b, x[k + 6], S13, 0xA8304613);
			b = FF(b, c, d, a, x[k + 7], S14, 0xFD469501);
			a = FF(a, b, c, d, x[k + 8], S11, 0x698098D8);
			d = FF(d, a, b, c, x[k + 9], S12, 0x8B44F7AF);
			c = FF(c, d, a, b, x[k + 10], S13, 0xFFFF5BB1);
			b = FF(b, c, d, a, x[k + 11], S14, 0x895CD7BE);
			a = FF(a, b, c, d, x[k + 12], S11, 0x6B901122);
			d = FF(d, a, b, c, x[k + 13], S12, 0xFD987193);
			c = FF(c, d, a, b, x[k + 14], S13, 0xA679438E);
			b = FF(b, c, d, a, x[k + 15], S14, 0x49B40821);
			a = GG(a, b, c, d, x[k + 1], S21, 0xF61E2562);
			d = GG(d, a, b, c, x[k + 6], S22, 0xC040B340);
			c = GG(c, d, a, b, x[k + 11], S23, 0x265E5A51);
			b = GG(b, c, d, a, x[k + 0], S24, 0xE9B6C7AA);
			a = GG(a, b, c, d, x[k + 5], S21, 0xD62F105D);
			d = GG(d, a, b, c, x[k + 10], S22, 0x2441453);
			c = GG(c, d, a, b, x[k + 15], S23, 0xD8A1E681);
			b = GG(b, c, d, a, x[k + 4], S24, 0xE7D3FBC8);
			a = GG(a, b, c, d, x[k + 9], S21, 0x21E1CDE6);
			d = GG(d, a, b, c, x[k + 14], S22, 0xC33707D6);
			c = GG(c, d, a, b, x[k + 3], S23, 0xF4D50D87);
			b = GG(b, c, d, a, x[k + 8], S24, 0x455A14ED);
			a = GG(a, b, c, d, x[k + 13], S21, 0xA9E3E905);
			d = GG(d, a, b, c, x[k + 2], S22, 0xFCEFA3F8);
			c = GG(c, d, a, b, x[k + 7], S23, 0x676F02D9);
			b = GG(b, c, d, a, x[k + 12], S24, 0x8D2A4C8A);
			a = HH(a, b, c, d, x[k + 5], S31, 0xFFFA3942);
			d = HH(d, a, b, c, x[k + 8], S32, 0x8771F681);
			c = HH(c, d, a, b, x[k + 11], S33, 0x6D9D6122);
			b = HH(b, c, d, a, x[k + 14], S34, 0xFDE5380C);
			a = HH(a, b, c, d, x[k + 1], S31, 0xA4BEEA44);
			d = HH(d, a, b, c, x[k + 4], S32, 0x4BDECFA9);
			c = HH(c, d, a, b, x[k + 7], S33, 0xF6BB4B60);
			b = HH(b, c, d, a, x[k + 10], S34, 0xBEBFBC70);
			a = HH(a, b, c, d, x[k + 13], S31, 0x289B7EC6);
			d = HH(d, a, b, c, x[k + 0], S32, 0xEAA127FA);
			c = HH(c, d, a, b, x[k + 3], S33, 0xD4EF3085);
			b = HH(b, c, d, a, x[k + 6], S34, 0x4881D05);
			a = HH(a, b, c, d, x[k + 9], S31, 0xD9D4D039);
			d = HH(d, a, b, c, x[k + 12], S32, 0xE6DB99E5);
			c = HH(c, d, a, b, x[k + 15], S33, 0x1FA27CF8);
			b = HH(b, c, d, a, x[k + 2], S34, 0xC4AC5665);
			a = II(a, b, c, d, x[k + 0], S41, 0xF4292244);
			d = II(d, a, b, c, x[k + 7], S42, 0x432AFF97);
			c = II(c, d, a, b, x[k + 14], S43, 0xAB9423A7);
			b = II(b, c, d, a, x[k + 5], S44, 0xFC93A039);
			a = II(a, b, c, d, x[k + 12], S41, 0x655B59C3);
			d = II(d, a, b, c, x[k + 3], S42, 0x8F0CCC92);
			c = II(c, d, a, b, x[k + 10], S43, 0xFFEFF47D);
			b = II(b, c, d, a, x[k + 1], S44, 0x85845DD1);
			a = II(a, b, c, d, x[k + 8], S41, 0x6FA87E4F);
			d = II(d, a, b, c, x[k + 15], S42, 0xFE2CE6E0);
			c = II(c, d, a, b, x[k + 6], S43, 0xA3014314);
			b = II(b, c, d, a, x[k + 13], S44, 0x4E0811A1);
			a = II(a, b, c, d, x[k + 4], S41, 0xF7537E82);
			d = II(d, a, b, c, x[k + 11], S42, 0xBD3AF235);
			c = II(c, d, a, b, x[k + 2], S43, 0x2AD7D2BB);
			b = II(b, c, d, a, x[k + 9], S44, 0xEB86D391);
			a = AddUnsigned(a, AA);
			b = AddUnsigned(b, BB);
			c = AddUnsigned(c, CC);
			d = AddUnsigned(d, DD);
		}

		var temp = WordToHex(a) + WordToHex(b) + WordToHex(c) + WordToHex(d);

		return temp.toLowerCase();
	},

	notify : function notify(text) {
		jNotify(text, {
			autoHide : true, // added in v2.0
			clickOverlay : false, // added in v2.0
			MinWidth : 250,
			TimeShown : 2000,
			ShowTimeEffect : 200,
			HideTimeEffect : 200,
			LongTrip : 20,
			HorizontalPosition : 'center',
			VerticalPosition : 'top',
			ShowOverlay : true,
			ColorOverlay : '#000',
			OpacityOverlay : 0.3,
			onClosed : function() {

			},
			onCompleted : function() { // added in v2.0

			}
		});

	},
	error : function error(text, _onClosed) {
		jError(text, {
			autoHide : true, // added in v2.0
			clickOverlay : false, // added in v2.0
			MinWidth : 250,
			TimeShown : 2000,
			ShowTimeEffect : 200,
			HideTimeEffect : 200,
			LongTrip : 20,
			HorizontalPosition : 'center',
			VerticalPosition : 'top',
			ShowOverlay : true,
			ColorOverlay : '#000',
			OpacityOverlay : 0.3,
			onClosed : _onClosed,
			onCompleted : function() { // added in v2.0

			}
		});
	},

	success : function success(text, _onClosed) {
		jSuccess(text, {
			autoHide : true, // added in v2.0
			clickOverlay : false, // added in v2.0
			MinWidth : 250,
			TimeShown : 1800,
			ShowTimeEffect : 200,
			HideTimeEffect : 200,
			LongTrip : 20,
			HorizontalPosition : 'center',
			VerticalPosition : 'top',
			ShowOverlay : true,
			ColorOverlay : '#000',
			OpacityOverlay : 0.3,
			onClosed : _onClosed,
			onCompleted : function() { // added in v2.0

			}
		});
	},
	fieldSelect : function fieldSelect(id, fieldId) {
		var obj = $(id).get(0);
		for (var i = 0; i < obj.options.length; i++) {
			var tmp = obj.options[i].value;
			if (tmp == fieldId) {
				obj.options[i].selected = 'selected';
				break;
			}
		}
	},
	checkPhone : function checkPhone(obj) { // 手机号码
		var value = $(obj).val();
		var Phone = new RegExp("^[1][3,4,5,7,8][0-9]{9}$");
		if (!Phone.test(value)) {
			util.error("请输入正确的手机号！");
			$(obj).val("");
			$(obj).focus();
			return false;
		}
		return true;
	},
	checkNumber : function checkNumber(obj, message) {
		var value = $(obj).val();
		var isNaN = new RegExp("^[0-9]*$");
		if (!isNaN.test(value)) {
			util.error(message);
			$(obj).val("");
			$(obj).focus();
			return false;
		}
		return true;
	},
	/**
	 * price is it right
	 * 
	 * @param obj
	 * @param message
	 */
	checkPrestore : function checkPrestore(obj, message) {
		var value = $(obj).val();
		var isNaN = /^(([1-9][0-9]*)|(([0]\.\d{1,2}|[1-9][0-9]*\.\d{1,2})))$/;
		if (!isNaN.test(value)) {
			util.error(message);
			$(obj).val("");
			$(obj).focus();
			return false;
		}
		return true;
	},
	/**
	 * check positive integer
	 */
	checkNumber : function checkNumber(obj, message) {
		var value = $(obj).val();
		var isNumber = /^[0-9]*[1-9][0-9]*$/;
		if (!isNumber.test(value)) {
			util.error(message);
			$(obj).val("");
			$(obj).focus();
			return false;
		}
		return true;
	},
	/**
	 * id is html place,message is show message;check input value is not null
	 */
	checkInputValue : function checkInputValue(id, message) {
		var value = $(id + " input").val();
		if (value == "") {
			$(id + "  .form-message").text(message);
			$(id + "  input").focus();
			$(id + "  input").addClass("has-error");
			return false;
		} else {
			return true;
		}
	},
	/**
	 * id is html place,message is show message;check textare value is not null
	 */
	checkTextareValue : function checkTextareValue(id, message) {
		var value = $(id + " textare").val();
		if (value == "") {
			$(id + "  .form-message").text(message);
			$(id + "  textare").focus();
			$(id + "  textare").addClass("has-error");
			return false;
		} else {
			return true;
		}
	},
	/**
	 * id is html place,message is show message;check select value is not null
	 */
	checkSelectValue : function checkSelectValue(id, message) {
		var value = $(id + " select").val();
		if (value == "") {
			$(id + "  .form-message").text(message);
			$(id + "  select").focus();
			$(id + "  select").addClass("has-error");
			return false;
		} else {
			return true;
		}
	},
	getNowFormatDate : function getNowFormatDate() {// get date
		var date = new Date();
		var seperator1 = "-";
		var seperator2 = ":";
		var month = date.getMonth() + 1;
		var strDate = date.getDate();
		if (month >= 1 && month <= 9) {
			month = "0" + month;
		}
		if (strDate >= 0 && strDate <= 9) {
			strDate = "0" + strDate;
		}
		var currentdate = date.getFullYear() + seperator1 + month + seperator1
				+ strDate + " " + date.getHours() + seperator2
				+ date.getMinutes() + seperator2 + date.getSeconds();
		return currentdate;
	},
	basePath : function basePath() {// get context
		var context = document.getElementsByTagName('base')[0].href;
		return context;
	},
	cleanForm : function cleanForm(id) {// clean form table data

		$(id)[0].reset();

	}
};

// function getBaseURL() {
// return location.protocol + "//" + location.hostname + (location.port && ":" +
// location.port) + "/";
// }

(function($) {

	$.jNotify = {
		defaults : {
			/** VARS - OPTIONS * */
			autoHide : true, // Notify box auto-close after 'TimeShown' ms ?
			clickOverlay : false, // if 'clickOverlay' = false, close the
			// notice box on the overlay click ?
			MinWidth : 200, // min-width CSS property
			TimeShown : 1500, // Box shown during 'TimeShown' ms
			ShowTimeEffect : 200, // duration of the Show Effect
			HideTimeEffect : 200, // duration of the Hide effect
			LongTrip : 15, // in pixel, length of the move effect when show and
			// hide
			HorizontalPosition : 'center', // left, center, right
			VerticalPosition : 'top', // top, center, bottom
			ShowOverlay : true, // show overlay behind the notice ?
			ColorOverlay : '#000', // color of the overlay
			OpacityOverlay : 0.3, // opacity of the overlay

			/** METHODS - OPTIONS * */
			onClosed : null,
			onCompleted : null
		},

		/** ************** */
		/** Init Method * */
		/** ************** */
		init : function(msg, options, id) {
			opts = $.extend({}, $.jNotify.defaults, options);

			/** Box * */
			if ($("#" + id).length == 0)
				$Div = $.jNotify._construct(id, msg);

			// Width of the Brower
			WidthDoc = parseInt($(window).width());
			HeightDoc = parseInt($(window).height());

			// Scroll Position
			ScrollTop = parseInt($(window).scrollTop());
			ScrollLeft = parseInt($(window).scrollLeft());

			// Position of the jNotify Box
			posTop = $.jNotify.vPos(opts.VerticalPosition);
			posLeft = $.jNotify.hPos(opts.HorizontalPosition);

			// Show the jNotify Box
			if (opts.ShowOverlay && $("#jOverlay").length == 0)
				$.jNotify._showOverlay($Div);

			$.jNotify._show(msg);
		},

		/** **************** */
		/** Construct DOM * */
		/** **************** */
		_construct : function(id, msg) {
			$Div = $('<div id="' + id + '"/>').css({
				opacity : 0,
				minWidth : opts.MinWidth
			}).html(msg).appendTo('body');
			return $Div;
		},

		/** ******************* */
		/** Postions Methods * */
		/** ******************* */
		vPos : function(pos) {
			switch (pos) {
			case 'top':
				var vPos = ScrollTop + parseInt($Div.outerHeight(true) / 2);
				break;
			case 'center':
				var vPos = ScrollTop + (HeightDoc / 2)
						- (parseInt($Div.outerHeight(true)) / 2);
				break;
			case 'bottom':
				var vPos = ScrollTop + HeightDoc
						- parseInt($Div.outerHeight(true));
				break;
			}
			return vPos;
		},

		hPos : function(pos) {
			switch (pos) {
			case 'left':
				var hPos = ScrollLeft;
				break;
			case 'center':
				var hPos = ScrollLeft + (WidthDoc / 2)
						- (parseInt($Div.outerWidth(true)) / 2);
				break;
			case 'right':
				var hPos = ScrollLeft + WidthDoc
						- parseInt($Div.outerWidth(true));
				break;
			}
			return hPos;
		},

		/** ****************** */
		/** Show Div Method * */
		/** ****************** */
		_show : function(msg) {
			$Div.css({
				top : posTop,
				left : posLeft
			});
			switch (opts.VerticalPosition) {
			case 'top':
				$Div.animate({
					top : posTop + opts.LongTrip,
					opacity : 1
				}, opts.ShowTimeEffect, function() {
					if (opts.onCompleted)
						opts.onCompleted();
				});
				if (opts.autoHide)
					$.jNotify._close();
				else
					$Div.css('cursor', 'pointer').click(function(e) {
						$.jNotify._close();
					});
				break;
			case 'center':
				$Div.animate({
					opacity : 1
				}, opts.ShowTimeEffect, function() {
					if (opts.onCompleted)
						opts.onCompleted();
				});
				if (opts.autoHide)
					$.jNotify._close();
				else
					$Div.css('cursor', 'pointer').click(function(e) {
						$.jNotify._close();
					});
				break;
			case 'bottom':
				$Div.animate({
					top : posTop - opts.LongTrip,
					opacity : 1
				}, opts.ShowTimeEffect, function() {
					if (opts.onCompleted)
						opts.onCompleted();
				});
				if (opts.autoHide)
					$.jNotify._close();
				else
					$Div.css('cursor', 'pointer').click(function(e) {
						$.jNotify._close();
					});
				break;
			}
		},

		_showOverlay : function(el) {
			var overlay = $('<div id="jOverlay" />').css({
				backgroundColor : opts.ColorOverlay,
				opacity : opts.OpacityOverlay
			}).appendTo('body').show();

			if (opts.clickOverlay)
				overlay.click(function(e) {
					e.preventDefault();
					opts.TimeShown = 0; // Thanks to Guillaume M.
					$.jNotify._close();
				});
		},

		_close : function() {
			switch (opts.VerticalPosition) {
			case 'top':
				if (!opts.autoHide)
					opts.TimeShown = 0;
				$Div.stop(true, true).delay(opts.TimeShown).animate({ // Tanks
					// to
					// Guillaume
					// M.
					top : posTop - opts.LongTrip,
					opacity : 0
				}, opts.HideTimeEffect, function() {
					$(this).remove();
					if (opts.ShowOverlay && $("#jOverlay").length > 0)
						$("#jOverlay").remove();
					if (opts.onClosed)
						opts.onClosed();
				});
				break;
			case 'center':
				if (!opts.autoHide)
					opts.TimeShown = 0;
				$Div.stop(true, true).delay(opts.TimeShown).animate({ // Tanks
					// to
					// Guillaume
					// M.
					opacity : 0
				}, opts.HideTimeEffect, function() {
					$(this).remove();
					if (opts.ShowOverlay && $("#jOverlay").length > 0)
						$("#jOverlay").remove();
					if (opts.onClosed)
						opts.onClosed();
				});
				break;
			case 'bottom':
				if (!opts.autoHide)
					opts.TimeShown = 0;
				$Div.stop(true, true).delay(opts.TimeShown).animate({ // Tanks
					// to
					// Guillaume
					// M.
					top : posTop + opts.LongTrip,
					opacity : 0
				}, opts.HideTimeEffect, function() {
					$(this).remove();
					if (opts.ShowOverlay && $("#jOverlay").length > 0)
						$("#jOverlay").remove();
					if (opts.onClosed)
						opts.onClosed();
				});
				break;
			}
		},

		_isReadable : function(id) {
			if ($('#' + id).length > 0)
				return false;
			else
				return true;
		}
	};

	/** Init method * */
	jNotify = function(msg, options) {
		if ($.jNotify._isReadable('jNotify'))
			$.jNotify.init(msg, options, 'jNotify');
	};

	jSuccess = function(msg, options) {
		if ($.jNotify._isReadable('jSuccess'))
			$.jNotify.init(msg, options, 'jSuccess');
	};

	jError = function(msg, options) {
		if ($.jNotify._isReadable('jError'))
			$.jNotify.init(msg, options, 'jError');
	};
})(jQuery);
