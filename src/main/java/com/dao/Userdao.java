package com.dao;

import com.entity.User;

public interface Userdao {
	public boolean saveUser(User user);
	public User getUserByUsernameAndPassword(String username, String password);
}
