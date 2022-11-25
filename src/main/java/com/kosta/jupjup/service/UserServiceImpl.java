package com.kosta.jupjup.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.UserDao;
import com.kosta.jupjup.vo.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public Map<String, Object> Join(Map<String, Object> param) {
		Map<String, Object> rs = new HashMap<String, Object>();

		String USERNAME = (String) param.get("username");
		String loginId = (String) param.get("loginId");
		String NICKNAME = (String) param.get("nickname");
		String PWD = (String) param.get("pwd");

		String EMAIL = (String) param.get("email");
		String PHONE = (String) param.get("phone");
		String GENDER = (String) param.get("gender");

		User user = userDao.getUserByLoginId(loginId);

		if (user == null) {

			rs.put("USERNAME", USERNAME);
			rs.put("loginId", loginId);
			rs.put("NICKNAME", NICKNAME);
			rs.put("PWD", PWD);
			rs.put("EMAIL", EMAIL);
			rs.put("PHONE", PHONE);
			rs.put("GENDER", GENDER);

			userDao.Join(rs);

			// int id = ((BigInteger) param.get("loginId")).intValue();

			rs.put("resultCode", "S-1");
			// rs.put("id",id);
			rs.put("msg", "회원가입이 완료되었습니다");
			return rs;
		}

		else {
			rs.put("resultCode", "F-1");
			rs.put("msg", "이미 존재하는 아이디 입니다");
			return rs;
		}
	
	}

	@Override
	public Map<String, Object> checkgetLoginAvailable(Map<String, Object> param) {
		Map<String, Object> rs = new HashMap<String, Object>();

		String loginId = (String) param.get("loginId");
		String loginpw = (String) param.get("loginpw");
		User user = userDao.getUserByLoginId(loginId);

		
		System.out.println(loginId);
		
		
		if (user == null) {
			rs.put("resultCode", "F-1");

			rs.put("msg", "해당 회원이 존재하지 않습니다.");
		} else if (user.getPwd().equals(loginpw) == false) {

			rs.put("resultCode", "F-2");
			rs.put("msg", "비밀번호가 일치하지 않습니다");
		} else {
			rs.put("resultCode", "S-1");
			rs.put("msg", "로그인 성공");
			rs.put("loginId", user.getId());
		}

		return rs;
	}

}
