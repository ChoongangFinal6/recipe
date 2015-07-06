package service;

import java.util.List;

import model.Content;

public interface ContentService {
	void insert1(Content content);
	void insert2(Content content);
	List<Content> detail(int no);
}
