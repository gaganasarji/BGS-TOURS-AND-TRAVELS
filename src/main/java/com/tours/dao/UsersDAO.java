package com.tours.dao;

import java.util.List;

import com.tours.dto.Users;

public interface UsersDAO {
	void addUsers(Users user);
	Users findById(Integer userId);
	List<Users> findAll();
	void deleteUser(Integer userId);
	void updateUser(Users user);
	Users getUsersByMailAndPassword(String userEmail,String password);
	Users getUsersByMail(String userEmail);
}
