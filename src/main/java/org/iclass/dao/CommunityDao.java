package org.iclass.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.iclass.dto.CommunityComments;
import org.iclass.dto.Community;

import mybatis.SqlSessionBean;

public class CommunityDao {
	private static CommunityDao dao = new CommunityDao();
	private CommunityDao() {}
	public static CommunityDao getInstance() {
		return dao;
	}

	public List<Community> list() {
		SqlSession mapper = SqlSessionBean.getSession();
		List<Community> list = mapper.selectList("community.list");
		mapper.close();
		return list;
	}
	
	//메인글 목록 가져오기 - 할일 : 한번에(즉 한페이지에) 글 10개씩 가져오도록 변경  
	public List<Community> pagelist(Map<String,Integer> map) {
		SqlSession mapper = SqlSessionBean.getSession();
		List<Community> list = mapper.selectList("community.pagelist",map);
		mapper.close();
		return list;
	}

	//전체 글 갯수
	public int count() {
			SqlSession mapper = SqlSessionBean.getSession();
			int result = mapper.selectOne("community.count");
			mapper.close();
			return result;
	}
		
	public Community selectByIdx(long idx) {
		SqlSession mapper = SqlSessionBean.getSession();
		Community vo = mapper.selectOne("community.selectByIdx",idx);
		mapper.close();
		return vo;
	}
	
	//읽은 메인글 조회수 증가
	public int setReadCount(long idx) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.update("community.setReadCount", idx);
		session.commit();
		session.close();
		return result;
	}
	
	public int update(Community vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.update("community.update",vo);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	public int delete(long idx) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.delete("community.delete",idx);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	public long insert(Community vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		mapper.insert("community.insert",vo);
	//insert 메소드 실행 후 파라미터로 전달한 vo 객체의 idx 프로퍼티값에 시퀀스 nextval 저정(SelectKey)
		mapper.commit();
		mapper.close();

	// vo객체에 저장된 idx 리턴합니다.
		return vo.getIdx();			
	}
	
	
	
}
