package dao;

import java.util.ArrayList;
import java.util.List;

import model.Content;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class ContentDaoImpl implements ContentDao {
	@Autowired
	private SqlSession session;
	@Override
	public List<Content> detail(String no) {
		
		List<Content> content = new ArrayList<Content>(); 
		content = session.selectList("select", no); 
		return content;
	}

}
