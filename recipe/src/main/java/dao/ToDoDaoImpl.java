package dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;

import com.ibatis.common.resources.Resources;


public class ToDoDaoImpl implements ToDoDao {
	@Autowired
	private SqlSession getSession() throws IOException {
		String src = "mybatis/configuration.xml";
		Reader reader = Resources.getResourceAsReader(src);
		SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = ssf.openSession(true);
		return session;
	}	
}
