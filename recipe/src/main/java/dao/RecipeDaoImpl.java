package dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

	@Override
	public String material(int mLi, HttpServletRequest req) {
		// TODO Auto-generated method stub
		String material = "";		
		
		String[] Mmain = new String[mLi];
		String[] Munit = new String[mLi];
		String[] Mamount = new String[mLi];
		
		for (int i=0; i<mLi; i++) {
			Mmain[i] = req.getParameter("Mmain"+i);			
			Munit[i] = req.getParameter("Munit"+i);
			Mamount[i] = req.getParameter("Mamount"+i);				
			
			if(i==mLi-1) {
				material += Mmain[i]+"," + Munit[i]+"," + Mamount[i];
			} else {
				material += Mmain[i]+"," + Munit[i]+"," + Mamount[i]+ ",";
			}
		}
		return material;
	}

	@Override
	public String image(int ili, HttpServletRequest req) {
		// TODO Auto-generated method stub
		String image="";				
		
		for (int i=0; i<ili; i++) {			
			if(i==ili-1) {
				image += req.getParameter("image"+i);				
			} else {
				image += req.getParameter("image"+i) + ",";
			}
		}		
		return image;
	}

	@Override
	public Recipe select(int no) {
		// TODO Auto-generated method stub		
		Recipe recipe = (Recipe) session.selectOne("recipe", no);		
		return recipe;
	}
}
