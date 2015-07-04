package dao;

import java.util.List;

import model.Content;

public interface ContentDao {
	List<Content> detail(String no);
	void insert(Content content);
}
