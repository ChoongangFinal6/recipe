package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.Recipe;

public interface RecipeService {
	List msearch(String material);
	int insert(Recipe recipe);
	String material(int mLi, HttpServletRequest req);
	String image(int ili, HttpServletRequest req);
	String lastimage(int ili, HttpServletRequest req);	
	Recipe rcpSelect(int no);
	void rcpUpdate(Recipe recipe);
}
