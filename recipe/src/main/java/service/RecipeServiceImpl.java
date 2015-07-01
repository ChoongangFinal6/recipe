package service;

import java.util.List;

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
}
