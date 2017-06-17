package blog.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_review")
public class Review {
	private Integer r_id;
	private Message leaveMsg;
	private Master master;
	private String content;
	private String adTime;
	
	public Review(){};
	
	public Review(Message leaveMsg, Master master, String content, String adTime) {
		super();
		this.leaveMsg = leaveMsg;
		this.master = master;
		this.content = content;
		this.adTime = adTime;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="r_id")
	public Integer getR_id() {
		return r_id;
	}

	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}
	@ManyToOne(targetEntity=Message.class)
	public Message getLeaveMsg() {
		return leaveMsg;
	}

	public void setLeaveMsg(Message leaveMsg) {
		this.leaveMsg = leaveMsg;
	}

	@ManyToOne
	@JoinColumn(name="masterId")
	public Master getMaster() {
		return master;
	}
	public void setMaster(Master master) {
		this.master = master;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAdTime() {
		return adTime;
	}
	public void setAdTime(String adTime) {
		this.adTime = adTime;
	}
	
}
