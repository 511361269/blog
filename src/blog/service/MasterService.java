package blog.service;

import org.springframework.transaction.annotation.Transactional;

import blog.dao.MasterDao;
import blog.domain.Master;
@Transactional
public class MasterService {
	MasterDao masterDao;
	public void setMasterDao(MasterDao masterDao) {
		this.masterDao = masterDao;
	}

	public Master login(String username, String password) {
		return masterDao.login(username,password);
	}

	public Master regist(Master master) {
		return masterDao.regist(master);
	}
	
}
