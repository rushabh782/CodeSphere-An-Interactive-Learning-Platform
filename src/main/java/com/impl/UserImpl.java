package com.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.dao.Userdao;
import com.entity.User;

@Component
public class UserImpl implements Userdao {

	@Autowired
	private JdbcTemplate template;
	
	@Override
	public boolean saveUser(User user) {
		// TODO Auto-generated method stub
		 String sql = "insert into user(username, password) values (?, ?)";
	     int result = template.update(sql, user.getUsername(), user.getPassword());
	     return result == 1;
	}

	@Override
	public User getUserByUsernameAndPassword(String username, String password) {
		// TODO Auto-generated method stub
		String sql = "select * from user where username= ? and password=?";
		@SuppressWarnings("deprecation")
		List<User> users = template.query(sql, new Object[]{username, password}, new UserRowMapper());
		return users.isEmpty() ? null : users.get(0);
	}

}
