package dao;

import java.util.List;

import model.Content;

public interface ContentDao {
	List<Content> detail(int no);
	void insert1(Content content);
	void insert2(Content content);
	void delete(int no);
}
