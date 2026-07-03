package com.tours.daoImpl;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tours.dao.PackagesDAO;
import com.tours.dto.Packages;
import com.tours.utility.Connector;

public class PackagesDAOImpl implements PackagesDAO {

	private Connection con;
	public PackagesDAOImpl () {
		this.con=Connector.requestConnection();
	}
    @Override
    public void addPackages(Packages packages) {

        String query = "INSERT INTO Packages(packageName, destId, duration, price, description, imageId) VALUES(?,?,?,?,?,?)";

        try {

           
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, packages.getPackageName());
            ps.setInt(2, packages.getDestId());
            ps.setString(3, packages.getDuration());
            ps.setDouble(4, packages.getPrice());
            ps.setString(5, packages.getDescription());
            ps.setInt(6, packages.getImageId());

            ps.executeUpdate();

            System.out.println("Package added successfully.");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public Packages findById(Integer id) {

        Packages packages = null;

        String query = "SELECT * FROM Packages WHERE packageId=?";

        try {

            

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                packages = new Packages();

                packages.setPackageId(rs.getInt("packageId"));
                packages.setPackageName(rs.getString("packageName"));
                packages.setDestId(rs.getInt("destId"));
                packages.setDuration(rs.getString("duration"));
                packages.setPrice(rs.getDouble("price"));
                packages.setDescription(rs.getString("description"));
                packages.setImageId(rs.getInt("imageId"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return packages;
    }

    @Override
    public List<Packages> findAll() {

        List<Packages> list = new ArrayList<>();

        String query = "SELECT * FROM Packages";

        try {

            

            PreparedStatement st = con.prepareStatement(query);

            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {

                Packages packages = new Packages();

                packages.setPackageId(rs.getInt("packageId"));
                packages.setPackageName(rs.getString("packageName"));
                packages.setDestId(rs.getInt("destId"));
                packages.setDuration(rs.getString("duration"));
                packages.setPrice(rs.getDouble("price"));
                packages.setDescription(rs.getString("description"));
                packages.setImageId(rs.getInt("imageId"));

                list.add(packages);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public void deletePackages(Integer id) {

        String query = "DELETE FROM Packages WHERE packageId=?";

        try {

            

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, id);

            int result = ps.executeUpdate();

            if (result > 0)
                System.out.println("Package deleted successfully.");
            else
                System.out.println("Package not found.");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void updatePackages(Packages packages) {

        String query = "UPDATE Packages SET packageName=?, destId=?, duration=?, price=?, description=?, imageId=? WHERE packageId=?";

        try {

            

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, packages.getPackageName());
            ps.setInt(2, packages.getDestId());
            ps.setString(3, packages.getDuration());
            ps.setDouble(4, packages.getPrice());
            ps.setString(5, packages.getDescription());
            ps.setInt(6, packages.getImageId());
            ps.setInt(7, packages.getPackageId());

            int result = ps.executeUpdate();

            if (result > 0)
                System.out.println("Package updated successfully.");
            else
                System.out.println("Package not found.");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}