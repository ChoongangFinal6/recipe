package service;

import java.util.List;

import model.Content;

public interface ContentService {
	void insert(Content content);
	List<Content> detail(int no);

}
