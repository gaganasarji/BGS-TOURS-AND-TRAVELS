package com.tours.dao;

import java.util.List;

import com.tours.dto.Images;



public interface ImagesDAO {
	void addUsers(Images images);
	Images findById(Integer id);
	List<Images> findAll();
	void deleteUser(Integer id);
	void updateUser(Images images);
}
