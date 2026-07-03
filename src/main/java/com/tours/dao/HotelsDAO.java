package com.tours.dao;

import java.util.List;

import com.tours.dto.Hotels;


public interface HotelsDAO {
	void addUsers(Hotels hotels);
	Hotels findById(Integer id);
	List<Hotels> findAll();
	void deleteUser(Integer id);
	void updateUser(Hotels hotels);
}
