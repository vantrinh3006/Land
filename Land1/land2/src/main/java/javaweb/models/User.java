package javaweb.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class User {
	private int uid;
	@NotEmpty(message = "Vui lòng nhập username")
	private String username;
	private String password;
	private String repassword;
	private String fullname;
	private Role role;
	public User(int uid, String username, String password,
			String fullname, Role role) {
		super();
		this.uid = uid;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.role = role;
	}
	public User() {
	}
	
}
