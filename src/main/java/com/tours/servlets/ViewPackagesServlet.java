package com.tours.servlets;

import java.util.List;
import java.util.Map;
import java.io.IOException;
import java.util.HashMap;

import com.tours.dao.DestinationDAO;
import com.tours.dao.PackagesDAO;
import com.tours.daoImpl.DestinationsDAOImpl;
import com.tours.daoImpl.PackagesDAOImpl;
import com.tours.dto.Destinations;
import com.tours.dto.Packages;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ViewPackagesServlet extends HttpServlet{

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PackagesDAO pdao = new PackagesDAOImpl();
        DestinationDAO ddao = new DestinationsDAOImpl();
        
        List<Packages> packageList = pdao.findAll();
        Map<Integer, String> destMap = new HashMap<>();
        
        // Map destination names to package IDs so the JSP doesn't have to query the database
        if (packageList != null) {
            for (Packages p : packageList) {
                Destinations dest = ddao.findById(p.getDestId());
                destMap.put(p.getPackageId(), (dest != null) ? dest.getCity() : "India");
            }
        }
        
        req.setAttribute("packageList", packageList);
        req.setAttribute("destMap", destMap);
        req.getRequestDispatcher("packages.jsp").forward(req, resp);
    }
}
