package blog.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import blog.domain.Master;

public class MasterDao extends HibernateDaoSupport{

	public Master login(String username, String password) {
		@SuppressWarnings("unchecked")
		List<Master> list = (List<Master>) this.getHibernateTemplate().find("from Master where username=? and password=?", username, password);
		if(list.size() != 0){
			return list.get(0);
		}
		return null;
	}

	public Master regist(Master master) {
		this.getHibernateTemplate().save(master);
		return master;
	}
	
}
