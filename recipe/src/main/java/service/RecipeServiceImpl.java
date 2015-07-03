package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public void insert(Recipe recipe) {
		// TODO Auto-generated method stub
		rd.insert(recipe);
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
	public Recipe detail(String no) {
		// TODO Auto-generated method stub
		return rd.detail(no);
	}
}
