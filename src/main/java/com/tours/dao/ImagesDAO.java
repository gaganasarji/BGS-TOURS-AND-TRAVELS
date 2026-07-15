package com.tours.dao;

import java.util.List;

import com.tours.dto.Images;



public interface ImagesDAO {
	void addImage(Images image);
    Images getImageById(Integer imageId);
	//List<Images> findAll();
	void updateImage(Images image);
    void deleteImage(Integer imageId);
}
