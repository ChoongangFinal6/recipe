package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.Recipe;

public interface RecipeService {
	List msearch(String material);
	void insert(Recipe recipe);
	String material(int mLi, HttpServletRequest req);
	String image(int ili, HttpServletRequest req);	
}
