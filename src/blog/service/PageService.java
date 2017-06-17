package blog.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import blog.dao.PageDao;
import blog.domain.Article;
import blog.domain.Message;
import blog.domain.Page;
import blog.domain.Review;
@Transactional
public class PageService {
	PageDao pageDao;
	public PageDao getPageDao() {
		return pageDao;
	}

	public void setPageDao(PageDao pageDao) {
		this.pageDao = pageDao;
	}
	
	public int getCount(){
		return pageDao.getCount();
	}
	
	public List<Article> findByPage(Page page){
		return pageDao.findByPage(page);
	}

	public List<Message> findMessageByPage(Page page) {
		return pageDao.findMessageByPage(page);
	}

	public int getMessageCount() {
		return pageDao.getMessageCount();
	}

	public void leaveMsg(Message message) {
		pageDao.leaveMsg(message);
		
	}

	public List<Message> findMessage() {
		return pageDao.findMessage();
	}

	public Message findMessageById(String id) {
		return pageDao.findMessageById(id);
	}

	public void saveReview(Review review) {
		pageDao.saveReview(review);
	}
}
