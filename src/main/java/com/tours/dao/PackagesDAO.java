package com.tours.dao;

import java.util.List;

import com.tours.dto.Packages;

public interface PackagesDAO {
	void addPackages(Packages packages);
	Packages findById(Integer id);
	List<Packages> findAll();
	void deletePackages(Integer id);
	void updatePackages(Packages packages);
}
