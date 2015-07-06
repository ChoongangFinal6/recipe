package dao;

import java.util.List;

import model.Content;

public interface ContentDao {
	void insert(Content content);
	List<Content> detail(int no);
}
