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
<<<<<<< HEAD
	public List<Content> detail(String no) {		
=======
	public List<Content> detail(int no) {
>>>>>>> 3fc111f8db1bc2d03b5550341c446b7564b9fd53
		List<Content> content = new ArrayList<Content>(); 
		content = session.selectList("Content.select", no); 
		return content;
	}
	@Override
	public void insert(Content content) {
		session.insert("Content.insert", content);
	}
}
