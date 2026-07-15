package com.tours.dao;

import java.util.List;

import com.tours.dto.Packages;

public interface PackagesDAO {
	void addPackages(Packages packages);
	Packages findById(Integer packageId);
	List<Packages> findAll();
	void deletePackages(Integer packageId);
	void updatePackages(Packages packages);
}
