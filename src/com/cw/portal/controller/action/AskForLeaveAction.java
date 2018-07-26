package com.cw.portal.controller.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.sound.midi.Synthesizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cw.common.domain.exam.Message;
import com.cw.portal.security.UserInfo;
import com.cw.portal.service.AskForLeaveService;
import com.cw.protal.token.TokenProccessor;
import com.cw.common.util.Page;
import com.cw.common.util.PagingUtil;
import com.cw.common.domain.askForLeave.AskForLeave;


/**
*
*@author XieRong
*请假
*/

@Controller
public class AskForLeaveAction {

	@Autowired
	private AskForLeaveService askForLeaveService;
	
	/**
	 * 页面请求
	 * @return
	 */
	@RequestMapping(value = "/student/ask-for-leave", method = RequestMethod.GET)
	public String questionListPage() {

		return "redirect:ask-for-leave/filter-1-0-0-0.html";
	}
	
	/**
	 * 查询用户请假历史（页面初始化/分页查询/条件查询）
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/student/ask-for-leave/filter-{page}-{id}-{start}-{end}", method = RequestMethod.GET)
	public String getAskForLeaveHistory(Model model, HttpServletRequest request, @PathVariable("page") int pageNumber, @PathVariable("id") String id,
			@PathVariable("start") String start, @PathVariable("end") String end) {
		
		//获取当前登录的用户信息
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//获取用户的id
		int userId = userInfo.getUserid();
		AskForLeave askForLeave = new AskForLeave();
		askForLeave.setId(id.equals("0")? null :id);
		askForLeave.setUser_id(userId);
		//获取总数
		int count = askForLeaveService.getCount(askForLeave, start.equals("0")? null : start, end.equals("0")? null : end);
		//分页
		Page<AskForLeave> page = new Page<AskForLeave>();
		page.setTotalRecord(count);
		page.setPageNo(pageNumber);
		page.setPageSize(10);
		//分页按钮
		String str = PagingUtil.getPageBtnlink(pageNumber, page.getTotalPage()); 
		List<AskForLeave> askForLeaveList = askForLeaveService.getAskForLeaveHistory(askForLeave, page, start.equals("0")? null : start, end.equals("0")? null : end);
		
		//产生随机令牌，并存入session域中
		String token = TokenProccessor.getIntance().makeToken();
		request.getSession().setAttribute("token", token);
		
		model.addAttribute("askForLeaveList",askForLeaveList);
		model.addAttribute("pageStr", str);
		model.addAttribute("total", count);
		
		return "user-center/ask-for-leave";
	}
	
	/**
	 * 根据id查询请假详情
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/student/ask-for-leave/particulars-list/{id}", method = RequestMethod.GET)
	public String showDetails(Model model, @PathVariable("id") String id) {
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int userId = userInfo.getUserid(); 
		AskForLeave askForLeave = askForLeaveService.queryById(id, userId);
		model.addAttribute("askForLeave", askForLeave);
		return "user-center/ask-for-leave-details";
	}
	
	/**
	 * 提交请假申请
	 * @param askForLeave
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/student/ask-for-leave-application", method = RequestMethod.POST)
	public @ResponseBody Message submitApplication(@RequestBody AskForLeave askForLeave,HttpServletRequest request ){
		Message msg = new Message();
		
		//判断是否重复提交表单
		if(TokenProccessor.getIntance().isRepeatSubmit(request)){
			msg.setResult("repeatSubmit");
			return msg;
		}
		
		//获取用户信息
		UserInfo userInfo = (UserInfo)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		try{
			askForLeave.setUser_id(userInfo.getUserid());
			askForLeaveService.addApplication(askForLeave);
			
		}catch(Exception e){
			e.printStackTrace();
			msg.setResult("error");
			msg.setResult(e.getClass().getName());
		}
		return msg;
	}
	
}
