package com.gms.web.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gms.web.daoImpl.ArticleDAOImpl;
import com.gms.web.domain.ArticleBean;
import com.gms.web.service.ArticleService;

public class ArticleServiceImpl implements ArticleService{
	ArticleBean bean;
	public static ArticleServiceImpl instance = new ArticleServiceImpl();
	public static ArticleServiceImpl getInstance() {
		return instance;
	}
	List<ArticleBean> list;
	Map<String, ArticleBean> map;
	int count;
	private ArticleServiceImpl() {
		bean = new ArticleBean();
		list = new ArrayList<>();
		map = new HashMap<>();
		count = 0;
	}
	@Override
	public String write(ArticleBean bean) {
		return ArticleDAOImpl.getInstance().insert(bean);
	}
	@Override
	public List<ArticleBean> list() {
		return ArticleDAOImpl.getInstance().selectAll();
	}
	@Override
	public List<ArticleBean> findById(String id) {
		return ArticleDAOImpl.getInstance().selectById(id);
	}
	@Override
	public String count() {
		return String.valueOf(ArticleDAOImpl.getInstance().count());
	}
	@Override
	public String modify(ArticleBean bean) {
		return ArticleDAOImpl.getInstance().update(bean);
	}

	@Override
	public String remove(String id) {
		return ArticleDAOImpl.getInstance().delete(id);
	}
	@Override
	public ArticleBean findBySeq(String seq) {
		return ArticleDAOImpl.getInstance().selectBySeq(seq);
	}

}
