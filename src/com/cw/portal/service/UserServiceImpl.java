package com.cw.portal.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cw.common.domain.user.Department;
import com.cw.common.domain.user.Group;
import com.cw.common.domain.user.Role;
import com.cw.common.domain.user.User;
import com.cw.common.util.Page;
import com.cw.portal.persistence.UserMapper;

/**
 * @author Ocelot
 * @date 2014年6月8日 下午8:21:31
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	public UserMapper userMapper;

	@Override
	@Transactional
	public int addUser(User user,String authority,int groupId,HashMap<String,Role> roleMap) {
		try {
			int userId = -1;
			//添加用户信息
			userMapper.insertUser(user);
			userId = user.getUserId();
			//添加用户角色信息
			userMapper.grantUserRole(userId, roleMap.get(authority).getRoleId());
			if(user.getDepId() != 0)
				//添加学员对应的班级
				userMapper.addUserGroup(userId, groupId);
				//userMapper.addUser2Dep(userId, user.getDepId());
			return userId;
		} catch (Exception e) {
			String cause = e.getCause().getMessage();
			throw new RuntimeException(cause);
		}
	}
	
	
	@Override
	@Transactional
	public void updateUser(User user, String oldPassword) {
		// TODO Auto-generated method stub
		try {
			userMapper.updateUser(user, oldPassword);
			userMapper.deleteUser2Dep(user.getUserId());
			userMapper.addUser2Dep(user.getUserId(), user.getDepId());
		} catch (Exception e) {
			String cause = e.getCause().getMessage();
			throw new RuntimeException(cause);
		}
	}

	@Override
	public List<Group> getGroupListByUserId(int userId, Page<Group> page) {
		// TODO Auto-generated method stub
		return userMapper.getGroupListByUserId(userId, page);
	}

	@Override
	public HashMap<String, Role> getRoleMap() {
		// TODO Auto-generated method stub
		List<Role> roleList = userMapper.getRoleList();
		HashMap<String,Role> map = new HashMap<String,Role>();
		for(Role r : roleList){
			map.put(r.getAuthority(), r);
		}
		return map;
	}

	@Override
	public void changeUserStatus(List<Integer> idList,boolean enabled) {
		// TODO Auto-generated method stub
		userMapper.changeUserStatus(idList, enabled);
	}
	
	@Override
	public void addUserGroup(int userId, int groupId) {
		// TODO Auto-generated method stub
		userMapper.addUserGroup(userId, groupId);
	}


	@Override
	public void deleteUserGroup(int userId, int groupId, int managerId) {
		// TODO Auto-generated method stub
		userMapper.deleteUserGroup(userId, groupId, managerId);
	}


	@Override
	public List<Department> getDepList(Page<Department> page) {
		// TODO Auto-generated method stub
		return userMapper.getDepList(page);
	}


	@Override
	public User getUserByName(String userName) {
		// TODO Auto-generated method stub
		return userMapper.getUserByName(userName);
	}


	@Override
	public void updateUserPwd(User user, String oldPwd) {
		// TODO Auto-generated method stub
		userMapper.updateUser(user, oldPwd);
	}


	@Override
	public String getClassById(int id) {
		// TODO Auto-generated method stub
		return userMapper.getClassById(id);
	}


	@Override
	public String judgeUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.judgeUser(user);
	}


	@Override
	public List<Group> getGroup() {
		// TODO Auto-generated method stub
		return userMapper.getGroup();
	}
}