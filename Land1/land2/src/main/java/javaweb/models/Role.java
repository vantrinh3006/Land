package javaweb.models;

import lombok.Data;

@Data
public class Role {
	private int rid;
	private String rname;
	
	public Role() {
		// TODO Auto-generated constructor stub
	}
	
	public Role(int rid, String rname) {
		super();
		this.rid = rid;
		this.rname = rname;
	}
	
}
