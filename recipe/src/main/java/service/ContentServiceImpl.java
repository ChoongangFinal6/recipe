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
	
	@Override
	public List<Content> detail(String no) {
		return cd.detail(no);
	}
	@Override
	public void insert(Content content) {
		cd.insert(content);
	}
}
