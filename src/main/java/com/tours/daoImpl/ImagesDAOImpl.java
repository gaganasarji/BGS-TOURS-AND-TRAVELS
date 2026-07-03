package com.tours.daoImpl;


	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.util.ArrayList;
	import java.util.List;

import com.tours.dao.ImagesDAO;
import com.tours.dto.Images;
	import com.tours.utility.Connector;

	public class ImagesDAOImpl implements ImagesDAO {

		private Connection con;
		public ImagesDAOImpl() {
			this.con=Connector.requestConnection();
		}
	    @Override
	    public void addUsers(Images images) {

	        String query = "INSERT INTO Images(imageUrl, imgDescription) VALUES(?,?)";

	        try {

	            

	            PreparedStatement ps = con.prepareStatement(query);

	            ps.setString(1, images.getImageUrl());
	            ps.setString(2, images.getImgDescription());

	            ps.executeUpdate();

	            System.out.println("Image added successfully.");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	    }

	    @Override
	    public Images findById(Integer id) {

	        Images image = null;

	        String query = "SELECT * FROM Images WHERE imageId=?";

	        try {

	            

	            PreparedStatement ps = con.prepareStatement(query);

	            ps.setInt(1, id);

	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {

	                image = new Images();

	                image.setImageId(rs.getInt("imageId"));
	                image.setImageUrl(rs.getString("imageUrl"));
	                image.setImgDescription(rs.getString("imgDescription"));

	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return image;
	    }

	    @Override
	    public List<Images> findAll() {

	        List<Images> list = new ArrayList<>();

	        String query = "SELECT * FROM Images";

	        try {

	           

	            PreparedStatement st = con.prepareStatement(query);

	            ResultSet rs = st.executeQuery(query);

	            while (rs.next()) {

	                Images image = new Images();

	                image.setImageId(rs.getInt("imageId"));
	                image.setImageUrl(rs.getString("imageUrl"));
	                image.setImgDescription(rs.getString("imgDescription"));

	                list.add(image);

	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return list;
	    }

	    @Override
	    public void deleteUser(Integer id) {

	        String query = "DELETE FROM Images WHERE imageId=?";

	        try {

	            

	            PreparedStatement ps = con.prepareStatement(query);

	            ps.setInt(1, id);

	            int result = ps.executeUpdate();

	            if (result > 0)
	                System.out.println("Image deleted successfully.");
	            else
	                System.out.println("Image not found.");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	    }

	    @Override
	    public void updateUser(Images images) {

	        String query = "UPDATE Images SET imageUrl=?, imgDescription=? WHERE imageId=?";

	        try {

	            

	            PreparedStatement ps = con.prepareStatement(query);

	            ps.setString(1, images.getImageUrl());
	            ps.setString(2, images.getImgDescription());
	            ps.setInt(3, images.getImageId());

	            int result = ps.executeUpdate();

	            if (result > 0)
	                System.out.println("Image updated successfully.");
	            else
	                System.out.println("Image not found.");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	    }
	}

