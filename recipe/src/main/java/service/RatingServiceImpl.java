package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.RatingDao;
import model.Rating;

@Service
public class RatingServiceImpl implements RatingService{
	@Autowired
	RatingDao rtd;
	@Override
	public int insert(Rating rating) {
		return rtd.insert(rating);
	}
//postNo로 평가한 사람 수,평균 불러옴
	@Override
	public Rating cntAvg(int postNo) {
		return rtd.cntAvg(postNo);
	}

}
