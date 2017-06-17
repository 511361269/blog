package blog.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import blog.domain.Article;
import blog.domain.Message;
import blog.domain.Page;
import blog.domain.Review;

public class PageDao extends HibernateDaoSupport{

	public int getCount() {
		long count = (long) this.getHibernateTemplate().find("select count(*) from Article").get(0);
		int i = new Long(count).intValue();
		return i;
	}

	@SuppressWarnings("unchecked")
	public List<Article> findByPage(Page page) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Article.class);
		criteria.addOrder(Order.desc("id"));
		List<Article> list = (List<Article>) this.getHibernateTemplate().findByCriteria(criteria, page.getBeginIndex(), page.getEveryPage());
		return list;
	}

	public List<Message> findMessageByPage(Page page) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Message.class);
		criteria.addOrder(Order.desc("id"));
		@SuppressWarnings("unchecked")
		List<Message> list = (List<Message>) this.getHibernateTemplate().findByCriteria(criteria, page.getBeginIndex(),page.getEveryPage());
		return list;
	}
	
	public int getMessageCount() {
		long count = (long) this.getHibernateTemplate().find("select count(*) from Message").get(0);
		int i = new Long(count).intValue();
		return i;
	}

	public void leaveMsg(Message message) {
		this.getHibernateTemplate().save(message);
	}

	public List<Message> findMessage() {
		List<Message> list = (List<Message>) this.getHibernateTemplate().find("from Message m order by m.id desc");
		if(list.size() != 0){
			return list;
		}
		return null;
	}

	public Message findMessageById(String id) {
		@SuppressWarnings("unchecked")
		List<Message> list = (List<Message>) this.getHibernateTemplate().find("from Message m where m.id = ?", id);
		if(list.size() != 0){
			return list.get(0);
		}
		return null;
	}

	public void saveReview(Review review) {
		this.getHibernateTemplate().save(review);
	}
}
