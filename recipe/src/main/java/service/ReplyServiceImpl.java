package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReplyDao;
import model.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	ReplyDao rpld;
	@Override
	public List<Reply> list(int postNo) {
		return rpld.list(postNo);
	}
	@Override
	public int insert(Reply reply) {
		return rpld.insert(reply);
	}
	@Override
	public int delete(Reply reply) {
		return rpld.delete(reply);
	}
	@Override
	public Reply select(int no) {
		return rpld.select(no);
	}

}
