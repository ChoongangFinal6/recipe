package service;

import java.util.List;

import model.Content;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ContentDao;

@Service
public class ContentServiceImpl implements ContentService {
	@Autowired
	ContentDao cd;
<<<<<<< HEAD
	
	@Override
	public List<Content> detail(String no) {
=======
	public List<Content> detail(int no) {
>>>>>>> 3fc111f8db1bc2d03b5550341c446b7564b9fd53
		return cd.detail(no);
	}
	@Override
	public void insert(Content content) {
		cd.insert(content);
	}
}
