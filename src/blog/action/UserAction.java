package blog.action;


import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import blog.domain.Admin;
import blog.service.UserService;

public class UserAction extends ActionSupport implements ModelDriven<Admin>{
	UserService userService;
	HttpServletRequest request = ServletActionContext.getRequest();

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	Admin admin = new Admin();
	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	
	public String login(){
		if("login".equals(request.getParameter("mode"))){
		try{
			Admin adminEx = userService.login(admin.getUsername(),admin.getPassword());
			if(adminEx != null)
			request.getSession().setAttribute("adminEx", adminEx);
			else{
				return "login";
			}
		}catch(Exception e){
			e.printStackTrace();
			return "login";
		}
		return "loginSuccess";
		} else{
			return "login";
		}
	}
	
	public String regist(){
		if("regist".equals(request.getParameter("mode"))){
		try{
			userService.regist(admin);
			request.getSession().setAttribute("admin", admin);
		} catch(Exception e){
			e.printStackTrace();
			return "regist";
		}
		return "registSuccess";
		} else{
			return "regist";
		}
	}

	@Override
	public Admin getModel() {
		return admin;
	}
}
