package dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.Rating;
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
	public int insert(Recipe recipe) {
		session.insert("Recipe.insert", recipe);
		return recipe.getNo();
	}

	@Override
	public String material(int mLi, HttpServletRequest req) {
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
	public Recipe detail(int no) {
		return session.selectOne("Recipe.detail", no);
	}

	public Recipe select(int no) {		
		Recipe recipe = (Recipe) session.selectOne("Recipe.select", no);		
		return recipe;
	}

	@Override
	public void update(Recipe recipe) {
		session.update("Recipe.update", recipe);		
	}

	@Override
	public String lastimage(int ili, HttpServletRequest req) {
		String lastimage="";
		
		for (int i=0; i<ili; i++) {			
			if(i==ili-1) {
				lastimage += req.getParameter("image"+i);				
			}
		}
		
		return lastimage;
	}

	@Override
	public int selectCount() {		
		return session.selectOne("Recipe.selectCount");
	}

	@Override
	public List<Recipe> selectRow(Recipe recipe) {	
		return session.selectList("Recipe.selectRow", recipe);
	}
	/* delete수행대신 update로 no 음수화
	 */
	@Override
	public int delete(Rating rating) {
		return session.update("Recipe.del", rating);
	}
}
