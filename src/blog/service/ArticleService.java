package blog.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import blog.dao.ArticleDao;
import blog.domain.Article;
@Transactional
public class ArticleService {
	ArticleDao articleDao;
	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
	public void deleteById(Integer id) {
		articleDao.deleteById(id);
	}
	public List<Article> findAll() {
		return articleDao.findAll();
	}
	public Article findById(Integer id) {
		return articleDao.findById(id);
	}
	public void update(Article article) {
		articleDao.update(article);
	}
	public void add(Article article) {
		articleDao.add(article);
	}
	public void addCount(Integer id) {
		articleDao.addCount(id);
	}
	public Article selectTop() {
		return articleDao.selectTop();
	}
	
}
