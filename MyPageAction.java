package com.internousdev.panther.action;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.panther.dao.UserInfoDAO;
import com.internousdev.panther.dto.UserInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class MyPageAction extends ActionSupport implements SessionAware{
	private Map<String,Object>session;
	UserInfoDTO userInfoDTO;

	public String execute(){

		UserInfoDAO userInfoDAO = new UserInfoDAO();

		//セッションタイムアウトの処理
		if(!session.containsKey("userId") && !session.containsKey("tempUserId")){
					return "sessiontimeout";
				}

		//valueOfメソッドでobject型→String型にする
		try {
			userInfoDTO = userInfoDAO.getUserInfo(String.valueOf(session.get("userId")));
		} catch (SQLException e) {
			e.printStackTrace();
			return ERROR;
		}

		if(userInfoDTO.getUserId()==null){
			userInfoDTO=null;
		}

		return SUCCESS;
	}

	public Map<String,Object> getSession(){
		return session;
	}

	public void setSession(Map<String,Object>session){
		this.session = session;
	}

	public UserInfoDTO getUserInfoDTO(){
		return userInfoDTO;
	}

	public void setUserInfoDTO(UserInfoDTO userInfoDTO){
		this.userInfoDTO = userInfoDTO;
    }

}
