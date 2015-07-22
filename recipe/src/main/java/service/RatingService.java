package service;

import model.Rating;

public interface RatingService {
	int insert(Rating rating);
	Rating cntAvg(int postNo);

}
