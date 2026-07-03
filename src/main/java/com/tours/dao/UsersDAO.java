package com.tours.dao;

import java.util.List;

import com.tours.dto.Users;

public interface UsersDAO {
	void addUsers(Users user);
	Users findById(Integer id);
	List<Users> findAll();
	void deleteUser(Integer id);
	void updateUser(Users user);
}
