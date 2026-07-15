package com.tours.daoImpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tours.dao.DestinationDAO;
import com.tours.dto.Destinations;
import com.tours.utility.Connector;

public class DestinationsDAOImpl implements DestinationDAO {

	private Connection con;
	public DestinationsDAOImpl() {
		this.con=Connector.requestConnection();
	}
    @Override
    public void addDestination(Destinations destination) {

        String query = "INSERT INTO Destinations(city, destDescription, imageId) VALUES(?,?,?)";

        try {

            

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, destination.getCity());
            ps.setString(2, destination.getDestDescription());
            ps.setInt(3, destination.getImageId());

            ps.executeUpdate();

            System.out.println("Destination added successfully.");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public Destinations findById(Integer destId) {

        Destinations destination = null;

        String query = "SELECT * FROM Destinations WHERE destId=?";

        try {


            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, destId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                destination = new Destinations();

                destination.setDestId(rs.getInt("destId"));
                destination.setCity(rs.getString("city"));
                destination.setDestDescription(rs.getString("destDescription"));
                destination.setImageId(rs.getInt("imageId"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return destination;
    }

    @Override
    public List<Destinations> findAll() {

        List<Destinations> list = new ArrayList<>();

        String query = "SELECT * FROM Destinations";

        try {

            

            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Destinations destination = new Destinations();

                destination.setDestId(rs.getInt("destId"));
                destination.setCity(rs.getString("city"));
                destination.setDestDescription(rs.getString("destDescription"));
                destination.setImageId(rs.getInt("imageId"));

                list.add(destination);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public void deleteDestination(Integer destId) {

        String query = "DELETE FROM Destinations WHERE destId=?";

        try {

            

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, destId);

            int result = ps.executeUpdate();

            if (result > 0)
                System.out.println("Destination deleted successfully.");
            else
                System.out.println("Destination not found.");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void updateDestination(Destinations destination) {

        String query = "UPDATE Destinations SET city=?, destDescription=?, imageId=? WHERE destId=?";

        try {

           

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, destination.getCity());
            ps.setString(2, destination.getDestDescription());
            ps.setInt(3, destination.getImageId());
            ps.setInt(4, destination.getDestId());

            int result = ps.executeUpdate();

            if (result > 0)
                System.out.println("Destination updated successfully.");
            else
                System.out.println("Destination not found.");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}