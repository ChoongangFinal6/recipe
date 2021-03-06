package dao;

import java.util.ArrayList;
import java.util.List;

import model.Content;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ContentDaoImpl implements ContentDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Content> detail(int no) {
		List<Content> content = new ArrayList<Content>(); 
		content = session.selectList("Content.select", no); 
		return content;
	}
	@Override
	public void insert1(Content content) {
		session.insert("Content.insert1", content);
	}
	
	public void insert2(Content content) {
		session.insert("Content.insert2", content);
	}
	@Override
	public void delete(int no) {
		session.delete("Content.delete", no);
	}
}