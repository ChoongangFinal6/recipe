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
	public List<Content> detail(int no) {
		return cd.detail(no);
	}
	@Override
	public void insert1(Content content) {
		cd.insert1(content);
	}
	
	public void insert2(Content content) {
		cd.insert2(content);
	}	
	@Override
	public void delete(int no) {	
		cd.delete(no);
	}
}
