package dao;

import model.Rating;

public interface RatingDao {
	int select(int no);
	int insert(Rating rating);
	Rating cntAvg(int postNo);

}
