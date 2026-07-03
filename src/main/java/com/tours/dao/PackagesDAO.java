package com.tours.dao;

public interface PackagesDAO {
	void addPackages(Packages packages);
	Packages findById(Integer id);
	List<Packages> findAll();
	void deletePackages(Integer id);
	void updatePackages(Packages packages);
}
