package com.test.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.test.common.DBConn2;
import com.test.dto.Goods;
import com.test.dto.Page;
import com.test.dto.Vendor;

public class VendorService {


	public List<Vendor> selectVendorList(String viName){
		Connection con = null;
		PreparedStatement ps = null;
		try {
			String sql = "select vinum, viname, videsc, viaddress, viphone from vendor_info where 1=1";
			if(viName!=null){
				sql += " and viname like ?";
			}
			con = DBConn2.getCon();
			ps = con.prepareStatement(sql);
			if(viName!=null){
				ps.setString(1, "%" + viName + "%");
			}
			ResultSet rs = ps.executeQuery();
			List<Vendor> vendorList = new ArrayList<Vendor>();
			while(rs.next()){
				Vendor vendor = new Vendor();
				vendor.setViNum(rs.getInt("vinum"));
				vendor.setViName(rs.getString("viname"));
				vendor.setViDesc(rs.getString("videsc"));
				vendor.setViAddress(rs.getString("viaddress"));
				vendor.setViPhone(rs.getString("viphone"));
				vendorList.add(vendor);
			}
			return vendorList;
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				DBConn2.closeCon();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	public int deleteVendor(Vendor pVendor){
		Connection con = null;
		PreparedStatement ps = null;
		try{
			String sql = "delete from vendor_info where vinum=?";
			con = DBConn2.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, pVendor.getViNum());
			int result = ps.executeUpdate();
			con.commit();
			return result;
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				DBConn2.closeCon();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
	public int insertVendor(Vendor pVendor){
		Connection con = null;
		PreparedStatement ps = null;
		try{
			String sql = "insert into vendor_info(viname, videsc, viaddress, viphone,gicredat, gicretim)";
			sql += "values(?,?,?,?,DATE_FORMAT(NOW(),'%Y%m%d'), DATE_FORMAT(NOW(),'%H%i%s'))";
			con = DBConn2.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, pVendor.getViName());
			ps.setString(2, pVendor.getViDesc());
			ps.setString(3, pVendor.getViAddress());
			ps.setString(4, pVendor.getViPhone());
			
			int result = ps.executeUpdate();
			con.commit();
			return result;
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				DBConn2.closeCon();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
	public Vendor selectVendor(Vendor pVendor){
		Connection con = null;
		PreparedStatement ps = null;
		try {
			String sql = "select vinum, viname, videsc, viaddress, viphone ";
					sql += " from vendor_info";
					
			con = DBConn2.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, pVendor.getViNum());
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Vendor vendor = new Vendor();
				vendor.setViNum(rs.getInt("vinum"));
				vendor.setViName(rs.getString("viname"));
				vendor.setViDesc(rs.getString("gidesc"));
				vendor.setViAddress(rs.getString("viaddress"));
				vendor.setViPhone(rs.getString("viphone"));
				return vendor;
	
				
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				DBConn2.closeCon();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
