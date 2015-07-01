package service;

import java.util.List;

import model.Recipe;

public interface RecipeService {
	List msearch(String material);
	void insert(Recipe recipe);	
}
