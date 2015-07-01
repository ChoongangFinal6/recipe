package dao;

import java.util.List;

import model.Recipe;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDaoImpl implements RecipeDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List msearch(String material) {
		List mlist = session.selectList("msearch", material);
		return mlist;
	}

	@Override
	public void insert(Recipe recipe) {
		// TODO Auto-generated method stub
		session.insert("insert", recipe);
	}
}
