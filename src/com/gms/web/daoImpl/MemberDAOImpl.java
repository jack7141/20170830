package com.gms.web.daoImpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.gms.web.command.Command;
import com.gms.web.constant.DB;
import com.gms.web.constant.SQL;
import com.gms.web.constant.Vendor;
import com.gms.web.dao.MemberDAO;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;
import com.gms.web.factory.DatabaseFactory;
public class MemberDAOImpl implements MemberDAO {
	Connection conn;
	public static MemberDAOImpl instance = new MemberDAOImpl();
	public static MemberDAOImpl getInstance() {
		return instance;
	}
	private MemberDAOImpl(){
		conn=null;
	}	
	
	@Override
	public String insert(Map<?,?> map) {
		System.out.println("memberDAOimpl INSERT에 진입!!");
		String rs="";
		System.out.println("memberserviceimpl에서 넘어온 member::::"+map.get("member"));
		System.out.println("memberserviceimpl에서 넘어온 major::::"+map.get("major"));
		MemberBean bean=(MemberBean) map.get("member");
		@SuppressWarnings("unchecked")
		List<MajorBean> major=(List<MajorBean>) map.get("major");
		PreparedStatement pstmt=null;
		
		try {
			//transaction
			conn=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection();
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(SQL.MEMBER_INSERT);
			pstmt.setString(1,bean.getId());
			System.out.println("가입한 아이디!!:  "+bean.getId());
			pstmt.setString(2,bean.getName());
			System.out.println(bean.getName());
			pstmt.setString(3,bean.getPassword());
			pstmt.setString(4,bean.getSsn());
			pstmt.setString(5,bean.getPhone());
			pstmt.setString(6,bean.getProfile());
			pstmt.setString(7,bean.getEmail());
			pstmt.executeUpdate();
			
			for(int i=0;i<major.size();i++){
				System.out.println("메이저 메이저아이디:" +major.get(1).getMajorId());
				System.out.println("메이저 제목:" +major.get(1).getTitle());
				System.out.println("메이저 멤버아이디:" +major.get(1).getMajorId());
				pstmt=conn.prepareStatement(SQL.MAJOR_INSERT);
				pstmt.setString(1, major.get(i).getMajorId());
				pstmt.setString(2, major.get(i).getTitle());
				pstmt.setString(3, major.get(i).getMajorId());
				pstmt.setString(4, major.get(i).getSubjId());
				rs=String.valueOf(pstmt.executeUpdate());
			
			}
			
			conn.commit();
			//맨 마지막에 rs로 받고 commit을 해준다.
			//transaction
		} catch (Exception e) {
			e.printStackTrace();
			if(conn!=null){
				try {
					conn.rollback();
				} catch (SQLException ex) {
					e.printStackTrace();
				}
			}
		}
		return rs;
	}
	@Override
	public List<?> selectAll(Command cmd) {
		System.out.println("daoImple SelecAll에 진입:::::::::::");
		List<StudentBean> list = new ArrayList<>();
		try {
			conn=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection();
			PreparedStatement pstmt=conn.prepareStatement(SQL.STUDENT_LIST);
			System.out.println("sql::::"+SQL.STUDENT_LIST);
			System.out.println("start Row::::"+cmd.getStartRow());
			System.out.println("end Row::::"+cmd.getEndRow());
			System.out.println("PageNum Row::::"+cmd.getEndRow());
			pstmt.setString(1,cmd.getStartRow());
			pstmt.setString(2,cmd.getEndRow());
			System.out.println("cmd number:::::"+cmd.getPageNumber());
			ResultSet rs=pstmt.executeQuery();
			StudentBean student=null;
			while(rs.next()){
				student=new StudentBean();
				student.setNum(rs.getString(DB.NUM));
				student.setId(rs.getString(DB.ID));
				student.setName(rs.getString(DB.NAME));
				student.setEmail(rs.getString(DB.EMAIL));
				student.setPhone(rs.getString(DB.PHONE));
				student.setRegdate(rs.getString(DB.REGDATE));
				student.setSsn(rs.getString(DB.SSN));
				student.setTitle(rs.getString(DB.TITLE));
				list.add(student);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<StudentBean> selectByName(Command cmd) {
		System.out.println("selectByName("+cmd.getSearch()+")");
		System.out.println("selectByName("+cmd.getColumn()+")");
		List<StudentBean> list = new ArrayList<>();
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.STUDENT_FINDBYNAME);
			pstmt.setString(1, "%"+cmd.getSearch()+"%");
			ResultSet rs = pstmt.executeQuery();
			StudentBean student=null;
			while(rs.next()){
				student=new StudentBean();
				student.setNum(rs.getString(DB.NUM));
				student.setId(rs.getString(DB.ID));
				student.setName(rs.getString(DB.NAME));
				student.setEmail(rs.getString(DB.EMAIL));
				student.setPhone(rs.getString(DB.PHONE));
				student.setRegdate(rs.getString(DB.REGDATE));
				student.setSsn(rs.getString(DB.SSN));
				student.setTitle(rs.getString(DB.TITLE));
				list.add(student);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public StudentBean selectById(Command cmd) {
		StudentBean Student = null;
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.STUDENT_FINDBYID);
			pstmt.setString(1, cmd.getSearch());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				Student = new StudentBean();
				Student.setId(rs.getString(DB.MEMBER_ID));
				Student.setName(rs.getString(DB.NAME));
				Student.setSsn(rs.getString(DB.SSN));
				Student.setRegdate(rs.getString(DB.REGDATE));

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Student;
	}

	   @Override
	   public String count(Command cmd) {
	      System.out.println("count("+cmd.getSearch()+")");
	      System.out.println("count("+cmd.getColumn()+")");
	      String count="";
	      try {
	         conn=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME,DB.PASSWORD).getConnection();
	            PreparedStatement pstmt = null;
	            if(cmd.getSearch()==null){
	               System.out.println("cmd.getSearch() is null");
	               pstmt = conn.prepareStatement(SQL.STUDENT_COUNT);
	               pstmt.setString(1, "%");
	            }else{
	               System.out.println("cmd.getSearch() is not null");
	               pstmt = conn.prepareStatement(SQL.STUDENT_COUNT);
	               pstmt.setString(1, "%"+cmd.getSearch()+"%");
	               
	            }   
	            ResultSet rs = pstmt.executeQuery();
	            if(rs.next()){
	               count=rs.getString("count");
	            }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return count;
	   }
	@Override
	public String update(MemberBean bean) {
		// TODO Auto-generated method stub
		String rs="";
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.MEMBER_UPDATE);
			pstmt.setString(1, bean.getPassword());
			pstmt.setString(2, bean.getId());
			rs = String.valueOf(pstmt.executeUpdate());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	@Override
	public String delete(Command cmd) {
		String rs = "";
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.MEMBER_DELETE);
			pstmt.setString(1, cmd.getSearch());
			rs =String.valueOf(pstmt.executeUpdate());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	@Override
	public MemberBean login(Command cmd) {
		MemberBean member=null;
		System.out.println("$ ID"+cmd.getSearch());
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME,DB.PASSWORD).getConnection().prepareStatement("select * from member where member_id like ?");
			pstmt.setString(1, cmd.getSearch());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				member=new MemberBean();
				member.setId(rs.getString(DB.MEMBER_ID));
				member.setName(rs.getString(DB.NAME));
				member.setPassword(rs.getString(DB.PASS));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
}
