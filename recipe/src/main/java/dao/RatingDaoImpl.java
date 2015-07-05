package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Rating;

@Repository
public class RatingDaoImpl implements RatingDao {
	@Autowired
	private SqlSession session;

	@Override
	public int select(int no) {
		return 0;
	}

	@Override
	public int insert(Rating rating) {
		int result = session.insert("Rating.insert", rating);
		session.update("Rating.rating", rating.getPostNo());
		return result;
	}

	//postNo(no)로 평가한 사람 수,평점 구하는 method 
	@Override
	public Rating cntAvg(int postNo) {
		return session.selectOne("Rating.cntAvg", postNo);
	}

}
