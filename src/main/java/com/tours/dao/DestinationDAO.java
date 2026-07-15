package com.tours.dao;

import java.util.List;

import com.tours.dto.Destinations;

public interface DestinationDAO {
	void addDestination(Destinations destination);
	Destinations findById(Integer destId);
	List<Destinations> findAll();
	void deleteDestination(Integer destId);
	void updateDestination(Destinations destination);
	
}
