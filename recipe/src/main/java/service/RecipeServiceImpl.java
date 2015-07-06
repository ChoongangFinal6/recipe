package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.Rating;
import model.Recipe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.RecipeDao;

@Service
public class RecipeServiceImpl implements RecipeService{
	@Autowired
	RecipeDao rd;
	
	@Override
	public List msearch(String material) {		
		return rd.msearch(material);
	}

	@Override
	public int insert(Recipe recipe) {	
		return rd.insert(recipe);
	}

	@Override
	public String material(int mLi, HttpServletRequest req) {
		return rd.material(mLi, req);		
	}

	@Override
	public String image(int ili, HttpServletRequest req) {
		return rd.image(ili, req);
	}

	@Override
	public Recipe rcpSelect(int no) {		
		return rd.select(no);
	}

	@Override
	public void rcpUpdate(Recipe recipe) {
		rd.update(recipe);		
	}

	@Override
	public String lastimage(int ili, HttpServletRequest req) {
		return rd.lastimage(ili, req);
	}

	@Override
	public int delete(Rating rating) {
		return rd.delete(rating);
	}
}
