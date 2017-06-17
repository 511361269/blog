package blog.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import blog.domain.Admin;
import blog.domain.Article;

public class UserDao extends HibernateDaoSupport{

	public void regist(Admin admin) {
		this.getHibernateTemplate().save(admin);
	}

	public Admin login(String username, String password) {
		@SuppressWarnings("unchecked")
		List<Admin> list = (List<Admin>) this.getHibernateTemplate().find("from Admin where username = ? and password = ?", username, password);
		if(list.size() != 0){
			Admin admin = list.get(0);
			return admin;
		}
		return null;
	}

}
