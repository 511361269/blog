package blog.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import blog.dao.UserDao;
import blog.domain.Admin;
import blog.domain.Article;
@Transactional
public class UserService {
	UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public void regist(Admin admin) {
		userDao.regist(admin);
	}
	public Admin login(String username, String password) {
		return userDao.login(username,password);
	}
}
