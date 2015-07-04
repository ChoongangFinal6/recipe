package dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.Recipe;

public interface RecipeDao {
	List msearch(String material);
	int insert(Recipe recipe);
	String material(int mLi, HttpServletRequest req);
	String image(int ili, HttpServletRequest req);
	Recipe detail(String no);
	String lastimage(int ili, HttpServletRequest req);
	Recipe select(int no);
	void update(Recipe recipe);
}
