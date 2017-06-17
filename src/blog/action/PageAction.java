package blog.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import blog.domain.Article;
import blog.domain.Master;
import blog.domain.Message;
import blog.domain.Page;
import blog.domain.Review;
import blog.service.ArticleService;
import blog.service.PageService;
import net.sf.json.JSONArray;

public class PageAction extends ActionSupport implements ModelDriven<Article>{
	ArticleService articleService;	
	PageService pageService;
	Message message = new Message();
	Page page = new Page();
	Article article = new Article();
	HttpServletRequest request = ServletActionContext.getRequest();
	String content = request.getParameter("content");
	String list;
	
	public String getList() {
		return list;
	}

	public void setList(String list) {
		this.list = list;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public PageService getPageService() {
		return pageService;
	}

	public void setPageService(PageService pageService) {
		this.pageService = pageService;
	}

	public ArticleService getArticleService() {
		return articleService;
	}

	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	public String list(){
		Page page = new Page();
		page.setEveryPage(5);
		page.setTotalCount(pageService.getCount());
		if(page.getTotalCount() % 5 == 0){
			page.setTotalPage(page.getTotalCount()/5);
		}else{
			page.setTotalPage(page.getTotalCount()/5 + 1);
		}
		String pcurrentPage = request.getParameter("currentPage");
		if(pcurrentPage != null){
			page.setCurrentPage(Integer.parseInt(pcurrentPage));
			page.setBeginIndex((page.getCurrentPage() - 1) * page.getEveryPage());
			if(Integer.parseInt(pcurrentPage) == 1){
				page.setHasLastPage(false);
			} else{
				page.setHasLastPage(true);
			} if(Integer.parseInt(pcurrentPage) == page.getTotalPage()){
				page.setHasNextPage(false);
			} else{
				page.setHasNextPage(true);
			}
		} else{
			page.setBeginIndex(0);
			page.setCurrentPage(1);
			page.setHasLastPage(false);
			if(page.getTotalPage() == 1|| page.getTotalPage() == 0)
			page.setHasNextPage(false);
			else page.setHasNextPage(true);
		}
		request.setAttribute("page", page);
		request.setAttribute("list", pageService.findByPage(page));
		return "index";
	}
	
	public String post(){
		Article articleEx = articleService.findById(article.getId());
		articleService.addCount(article.getId());
		request.getSession().setAttribute("articleEx", articleEx);
		return "post";
	}
	
	public String top(){
		Article topArticle = articleService.selectTop();
		request.getSession().setAttribute("topArticle", topArticle);
		return "top";
	}
	
	public String message(){
		try{
		List<Message> mList = pageService.findMessage();
		list = JSONArray.fromObject(mList).toString();
		}catch(Exception e){
			e.printStackTrace();
		}
		return "message";
	}
	
	public String leaveMsg() throws IOException{
		try{Date currentDate = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = format.format(currentDate);
		message.setAdTime(date);
		Master master= (Master) request.getSession().getAttribute("master");
		message.setMaster(master);
		message.setContent(content);
		message.setReviews(null);
		if(content ==" "||content.length() == 0){}
		else{
			pageService.leaveMsg(message);
		}
		}catch(Exception e){
	    	e.printStackTrace();
	    }
	    return NONE; 
	}
	
	public String review(){
		Master master = (Master)request.getSession().getAttribute("master");
		if(master != null){
		Message message = pageService.findMessageById(request.getParameter("leaveId"));
		String content = request.getParameter("review");
		Date currentDate = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = format.format(currentDate);
		Review review = new Review(message,master,content,date);
		pageService.saveReview(review);
		return "review";
		} else{
			return "info";
		}
	}
	
	@Override
	public Article getModel() {
		return article;
	}
}
