package org.iclass.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.iclass.dto.BookUser;

import mybatis.SqlSessionBean;


public class BookUserDao {		
	
	public BookUser login(Map<String,String> map)  {
		SqlSession mapperSession = SqlSessionBean.getSession();
		BookUser vo = mapperSession.selectOne("bookuser.login",map);
		mapperSession.close();
		return vo;
	}
}
