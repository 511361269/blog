package blog.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import blog.domain.Article;

public class ArticleDao extends HibernateDaoSupport{

	public void deleteById(Integer id) {
		Article article = (Article) this.getHibernateTemplate().find("from Article where id = ?", id).get(0);
		if(article != null){
			this.getHibernateTemplate().delete(article);
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Article> findAll() {
		List<Article> list = (List<Article>) this.getHibernateTemplate().find("from Article a order by a.id desc");
		if(list != null)
		return list;
		return null;
	}

	public Article findById(Integer id) {
		Article article = (Article) this.getHibernateTemplate().find("from Article where id = ?", id).get(0);
		if(article != null){
			return article;
		} else{
			return null;
		}
	}

	public void update(Article article) {
		Article a = this.getHibernateTemplate().get(Article.class, article.getId());
		a.setContent(article.getContent());
		a.setInfo(article.getInfo());
		a.setTitle(article.getTitle());
		this.getHibernateTemplate().save(a);
	}

	public void add(Article article) {
		article.setCount(0);
		this.getHibernateTemplate().save(article);
	}

	public void addCount(Integer id) {
		Article article = this.findById(id);
		int count = article.getCount();
		article.setCount(++count);
		this.update(article);
	}

	public Article selectTop() {
		Article article = (Article) this.getHibernateTemplate().find("from Article a order by a.count desc").get(0);
		if(article != null){
			return article;
		}
		return null;
	}
}
