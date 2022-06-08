package javaweb.constants.SQL;

public class UserSQLConstant {
	public static final String SELECT_ALL = "SELECT * FROM users AS u INNER JOIN roles AS r ON u.rid = r.rid ORDER BY uid DESC ";
	
	public static final String FIND_BY_USER = "SELECT * FROM users AS u INNER JOIN roles AS r ON u.rid = r.rid WHERE username LIKE ?";
	
	public static final String COUNT_ALL = "SELECT COUNT(*) FROM users";
	
	public static final String ADD_USER = "INSERT INTO users(username,password,fullname,rid) VALUES(?,?,?,?)";
	
	public static final String DEL_BY_ID = "DELETE FROM users WHERE uid = ?";
	
	public static final String SELECT_BY_ID = "SELECT * FROM users AS u INNER JOIN roles AS r ON u.rid = r.rid WHERE uid = ? ";
	
	public static final String UPDATE_USER = "UPDATE users SET username = ?, password = ?, fullname = ?, rid = ? WHERE uid = ?";
	
	public static final String GET_ITEMS_PAGE = "SELECT * FROM users AS u INNER JOIN roles AS r ON u.rid = r.rid ORDER BY uid DESC LIMIT ?, ?";
	
	public static final String SEARCH = "SELECT * FROM users AS u INNER JOIN roles AS r ON u.rid = r.rid WHERE username LIKE ? OR fullname LIKE ?";
	
	public static final String COUNT_SEARCH = "SELECT COUNT(*) FROM users AS u INNER JOIN roles AS r ON u.rid = r.rid WHERE username LIKE ? OR fullname LIKE ?";
}
