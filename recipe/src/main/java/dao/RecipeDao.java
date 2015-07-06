package dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.Rating;
import model.Recipe;

public interface RecipeDao {
	List msearch(String material);
	int insert(Recipe recipe);
	String material(int mLi, HttpServletRequest req);
	String image(int ili, HttpServletRequest req);
	String lastimage(int ili, HttpServletRequest req);
	Recipe select(int no);
	Recipe detail(int no);
	void update(Recipe recipe);
<<<<<<< HEAD
	int selectCount();
	List<Recipe> selectRow(Recipe recipe);
=======
	int delete(Rating rating);
>>>>>>> c36d5b3dbddf5ce88fe65bed9248ab56b316501f
}
