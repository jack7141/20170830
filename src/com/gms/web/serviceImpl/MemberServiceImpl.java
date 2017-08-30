package com.gms.web.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gms.web.command.Command;
import com.gms.web.daoImpl.MemberDAOImpl;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;
import com.gms.web.service.MemberService;

public class MemberServiceImpl implements MemberService {
	public static MemberServiceImpl instance = new MemberServiceImpl();
	
	public static MemberServiceImpl getInstance() {
		return instance;
	}
	private MemberServiceImpl() {}

	@Override
	public String add(Map<String, Object> map) {
		System.out.println("member service impl진입");
		MemberBean member=(MemberBean)map.get("member");
		System.out.println("넘어온 회원의 이름:" + member.toString());
		@SuppressWarnings("unchecked")
		List<MajorBean> list=(List<MajorBean>)map.get("major");
		System.out.println("넘어온 수강과목:"+list);
		MemberDAOImpl.getInstance().insert(map);
		return  null;
	}

	@Override
	public String count(Command cmd) {
		return String.valueOf(MemberDAOImpl.getInstance().count(cmd));
	}

	@Override
	public List<?> list(Command cmd) {
		return MemberDAOImpl.getInstance().selectAll(cmd);
	}

	@Override
	public StudentBean findById(Command cmd) {
		return MemberDAOImpl.getInstance().selectById(cmd);
	}

	@Override
	public List<?> findByName(Command cmd) {
		System.out.println("findByName("+cmd.getSearch()+")");
		return MemberDAOImpl.getInstance().selectByName(cmd);
	}

	@Override
	public String modify(MemberBean bean) {
		return MemberDAOImpl.getInstance().update(bean);
	}

	@Override
	public String remove(Command cmd) {
		return MemberDAOImpl.getInstance().delete(cmd);
	}
	@Override
	public Map<String, Object> login(MemberBean bean) {
		System.out.println("memberserviceimple LOGIN 진입!!!!");
		System.out.println("넘겨진 아이디와 비밀번호::"+bean.getId()+"////"+bean.getPassword());
		Map<String,Object> map=new HashMap<>();
		Command cmd=new Command();
		cmd.setSearch(bean.getId());
		MemberBean m=MemberDAOImpl.getInstance().login(cmd);
		String page=
		 (m!=null)?
				(bean.getPassword().equals(m.getPassword()))?
						"main":"login_fail":"join";
		map.put("page", page);
		map.put("user", m);
		return map;
		
	}
	
	
}