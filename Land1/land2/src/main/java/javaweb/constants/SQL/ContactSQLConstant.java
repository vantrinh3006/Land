package javaweb.constants.SQL;

public class ContactSQLConstant {
	public static final String SELECT_ALL = "SELECT * FROM contacts ORDER BY cid DESC";
	
	public static final String COUNT_ALL = "SELECT COUNT(*) FROM contacts";
	
	public static final String ADD_CONTACT = "INSERT INTO contacts(fullname, email, subject, content) VALUES(?,?,?,?)";
	
	public static final String DEL_CONTACT = "DELETE FROM contacts WHERE cid = ?";
	
	public static final String GET_ITEMS_PAGE = "SELECT * FROM contacts ORDER BY cid DESC LIMIT ?,?";
	
	public static final String SEARCH = "SELECT * FROM contacts WHERE fullname LIKE ? OR email LIKE ? OR subject LIKE ? OR content LIKE ?";
	
	public static final String COUNT_SEARCH = "SELECT * FROM contacts WHERE fullname LIKE ? OR email LIKE ? OR subject LIKE ? OR content LIKE ?";
}
