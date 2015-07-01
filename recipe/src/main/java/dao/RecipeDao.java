package dao;

import java.util.List;

import model.Recipe;

public interface RecipeDao {

	List msearch(String material);
	void insert(Recipe recipe);
}
