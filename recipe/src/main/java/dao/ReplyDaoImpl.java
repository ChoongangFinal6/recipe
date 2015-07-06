package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao {
	@Autowired
	SqlSession session;

	@Override
	public List<Reply> list(int postNo) {
		List<Reply> list = new ArrayList<Reply>();
		list = session.selectList("Reply.list", postNo);
		return list;
	}

	@Override
	public int insert(Reply reply) {
		return session.insert("Reply.insert",reply);
	}

	@Override
	public int delete(Reply reply) {
		return session.delete("Reply.delete",reply);
	}

	@Override
	public Reply select(int no) {
		return session.selectOne("Reply.select",no);
	}

}
