package com.tours.dao;

public interface DestinationDAO {
	void addDestination(Destination destination);
	Destination findById(Integer id);
	List<Destination> findAll();
	void deleteDestination(Integer id);
	void updateDestination(Destination destination);
	
}
