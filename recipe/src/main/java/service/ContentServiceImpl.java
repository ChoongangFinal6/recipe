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
	public List<Content> detail(int no) {
		return cd.detail(no);
	}

}
