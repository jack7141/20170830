package com.gms.web.daoImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gms.web.constant.DB;
import com.gms.web.constant.SQL;
import com.gms.web.constant.Vendor;
import com.gms.web.dao.ArticleDAO;
import com.gms.web.domain.ArticleBean;
import com.gms.web.factory.DatabaseFactory;

public class ArticleDAOImpl implements ArticleDAO {
	public static ArticleDAOImpl instance = new ArticleDAOImpl();
	public static ArticleDAOImpl getInstance() {
		return instance;
	}
	private ArticleDAOImpl() {}
	@Override
	public String insert(ArticleBean bean) {
		String rs = "";
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.ARTICLE_INSERT);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getTitle());
			pstmt.setString(3, bean.getContent());
			rs =String.valueOf(pstmt.executeUpdate());
		} catch (Exception e) {
			System.out.println("터짐");
			e.printStackTrace();
		}
		return rs;
	}
	@Override
	public List<ArticleBean> selectAll() {
		List<ArticleBean> list = new ArrayList<>();
		ArticleBean bean = null;
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.ARTICLE_FINDBYID);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new ArticleBean();
				bean.setArticleSeq(Integer.parseInt(rs.getString(DB.ARTICLE_SEQ)));
				bean.setId(rs.getString(DB.MEMBER_ID));
				bean.setTitle(rs.getString(DB.TITLE));
				bean.setContent(rs.getString(DB.CONTENT));
				//bean.setHitCount(Integer.parseInt(rs.getString(DB.HIT_COUNT)));
				bean.setRegdate(rs.getString(DB.REGDATE));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("LIST 터짐");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ArticleBean> selectById(String id) {
		List<ArticleBean> list = new ArrayList<>();
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.ARTICLE_FINDBYID);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			ArticleBean bean = null;
			while (rs.next()) {
				bean = new ArticleBean();
				bean.setArticleSeq(Integer.parseInt(rs.getString(DB.ARTICLE_SEQ)));
				bean.setId(rs.getString(DB.CONTENT));
				bean.setTitle(rs.getString(DB.TITLE));
				bean.setContent(rs.getString(DB.ARTICLE_SEQ));
				bean.setRegdate(rs.getString(DB.REGDATE));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public ArticleBean selectBySeq(String seq) {
		ArticleBean bean = new ArticleBean();
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.ARTICLE_FINDBYSEQ);
			pstmt.setString(1, seq);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
			bean.setArticleSeq(Integer.parseInt(seq));	
			bean.setId(rs.getString(DB.CONTENT));
			bean.setTitle(rs.getString(DB.TITLE));
			bean.setContent(rs.getString(DB.ARTICLE_SEQ));
			bean.setRegdate(rs.getString(DB.REGDATE));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bean;
	}
	@Override
	public String count() {
		int count=0;
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.ARTICLE_COUNT);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				count = Integer.parseInt(rs.getString("count"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return String.valueOf(count);
	}
	@Override
	public String update(ArticleBean bean) {
		String rs = "";
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.BOARD_UPDATE);
			pstmt.setString(1, bean.getContent());
			pstmt.setString(2, String.valueOf(bean.getArticleSeq()));
			rs=String.valueOf(pstmt.executeUpdate());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	@Override
	public String delete(String seq) {
		String rs="";
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.BOARD_DELETE);
			pstmt.setString(1, seq);
			rs=String.valueOf(pstmt.executeUpdate());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
}
