package dao;

import java.util.List;

import model.Reply;

public interface ReplyDao {
	List<Reply> list(int postNo);
	int insert(Reply reply);
	int delete(Reply reply);
	Reply select(int no);

}
