package blog.action;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import blog.domain.Admin;
import blog.domain.Article;
import blog.service.ArticleService;

public class ArticleAction extends ActionSupport implements ModelDriven<Article>{
	ArticleService articleService;
	Article article = new Article();
	HttpServletRequest request = ServletActionContext.getRequest();
	List<Article> list;

	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public String list(){
		list = articleService.findAll();
		request.setAttribute("list", list);
		return "list";
	}
	
	public String show(){
		Article artEx = articleService.findById(article.getId());
		request.getSession().setAttribute("artEx", artEx);
		return "show";
	}
	
	public String update(){
		try {
			request.setCharacterEncoding("utf8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		try{
			articleService.update(article);
		} catch(Exception e){
			e.printStackTrace();
			return "fault";
		}
		return "updateSuccess";
	}
	
	public String add(){
		try {
			request.setCharacterEncoding("utf8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		try{
			Date currentDate = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = format.format(currentDate);
			article.setAdTime(date);
			Admin admin = (Admin) request.getSession().getAttribute("adminEx");
			article.setAdmin(admin);
			articleService.add(article);
		} catch(Exception e){
			e.printStackTrace();
			return "fault";
		}
		return "addSuccess";
	}
	
	public String delete(){
		try{
			articleService.deleteById(article.getId());
		} catch(Exception e){
			e.printStackTrace();
			return "fault";
		}
		return "deleteSuccess";
	}
	
	public String toAdd(){
		return "toAdd";
	}
	
	@Override
	public Article getModel() {
		return article;
	}
}
