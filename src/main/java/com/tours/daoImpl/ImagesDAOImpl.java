package com.tours.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tours.dao.ImagesDAO;
import com.tours.dto.Images;
import com.tours.utility.Connector;

public class ImagesDAOImpl implements ImagesDAO {

	private Connection con;

	public ImagesDAOImpl() {
		this.con = Connector.requestConnection();
	}

	@Override
	public void addImage(Images image) {
		String sql = "INSERT INTO Images (imageId, imageUrl, imgDescription) VALUES (?, ?, ?)";
		try (PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, image.getImageId());
			ps.setString(2, image.getImageUrl());
			ps.setString(3, image.getImgDescription());
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Error adding image: " + e.getMessage());
		}
	}

	@Override
	public Images getImageById(Integer imageId) {
		Images image = null;
		String sql = "SELECT * FROM Images WHERE imageId=?";
		try (PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, imageId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				image = new Images();
				image.setImageId(rs.getInt("imageId"));
				image.setImageUrl(rs.getString("imageUrl"));
				image.setImgDescription(rs.getString("imgDescription"));
			}
		} catch (SQLException e) {
			System.out.println("Error fetching image: " + e.getMessage());
		}
		return image;
	}

	@Override
	public void updateImage(Images image) {
		String sql = "UPDATE Images SET imageUrl=?, imgDescription=? WHERE imageId=?";
		try (PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, image.getImageUrl());
			ps.setString(2, image.getImgDescription());
			ps.setInt(3, image.getImageId());
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Error updating image: " + e.getMessage());
		}
	}

	@Override
	public void deleteImage(Integer imageId) {
		String sql = "DELETE FROM Images WHERE imageId=?";
		try (PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, imageId);
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Error deleting image: " + e.getMessage());
		}
	}

}
