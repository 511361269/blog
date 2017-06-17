package blog.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import blog.domain.Master;
import blog.service.MasterService;
public class MasterAction extends ActionSupport implements ModelDriven<Master> {
	MasterService masterService;
	Master master = new Master();
	HttpServletRequest request = ServletActionContext.getRequest();
	public Master getMaster() {
		return master;
	}
	public void setMaster(Master master) {
		this.master = master;
	}
	public void setMasterService(MasterService masterService) {
		this.masterService = masterService;
	}
	
	public String login(){
		try{
			Master masterEx = masterService.login(master.getUsername(),master.getPassword());
			if(masterEx != null){
				request.getSession().setAttribute("master", masterEx);
				return "loginSuccess";
			} else{
				return "loginFault";
			}
		} catch(Exception e){
			e.printStackTrace();
			return "loginFault";
		}
	}
	
	public String regist(){
		try{
			Master rmaster = masterService.regist(master);
			request.getSession().setAttribute("master", rmaster);
			return "registSuccess";
		} catch(Exception e){
			e.printStackTrace();
			return "fault";
		}
	}
	
	@Override
	public Master getModel() {
		return master;
	}
}
