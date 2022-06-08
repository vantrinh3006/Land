package javaweb.constants.SQL;

import javaweb.constants.Defines;

public class LandSQLConstant {
	public static final String SELECT_ALL = "SELECT * FROM lands ORDER BY lid DESC";
	
	public static final String SELECT_DATE_NEW = "SELECT * FROM lands ORDER BY date_create DESC LIMIT "+ Defines.SELECT_LIMIT;
	
	public static final String SELECT_COUNT_VIEW = "SELECT * FROM lands ORDER BY count_views DESC LIMIT "+ Defines.SELECT_LIMIT;
	
	public static final String SELECT_BY_CID = "SELECT * FROM lands WHERE cid = ?";
	
	public static final String GET_ITEM_RELATE = "SELECT * FROM lands WHERE cid = ? LIMIT "+Defines.SELECT_SLIDER;
	
	public static final String SELECT_SLIDER = "SELECT * FROM lands ORDER BY RAND() LIMIT "+ Defines.SELECT_SLIDER;
	
	public static final String COUNT_ALL = "SELECT COUNT(*) FROM lands";
	
	public static final String ADD_LAND = "INSERT INTO lands(lname,description,date_create,cid,picture,area,address,detail,uid) VALUES(?,?,?,?,?,?,?,?,?)";
	
	public static final String DEL_LAND = "DELETE FROM lands WHERE lid = ?";
	
	public static final String DEL_BY_CID = "DELETE FROM lands WHERE cid = ?";
	
	public static final String SELECT_BY_LID = "SELECT * FROM lands WHERE lid = ?";
	
	public static final String UPDATE_LAND = "UPDATE lands SET lname = ?, description = ?, date_create = ?, cid = ?, picture = ?, area = ?, address = ?, detail = ?  WHERE lid = ?";
	
	public static final String COUNT_BY_CID = "SELECT COUNT(*) FROM lands WHERE cid = ?";
	
	public static final String GET_ITEMS_PAGE = "SELECT * FROM lands ORDER BY lid DESC LIMIT ?, ?";
	
	public static final String INCRIACE_VIEWS = "UPDATE lands SET count_views = count_views + 1 WHERE lid = ?";
	
	public static final String SEARCH = "SELECT * FROM lands WHERE lname LIKE ? OR description LIKE ? OR detail LIKE ? OR address LIKE ?";
	
	public static final String COUNT_SEARCH = "SELECT COUNT(*) FROM lands WHERE lname LIKE ? OR description LIKE ? OR detail LIKE ? OR address LIKE ?";
	
	public static final String SELECT_BY_USER = "SELECT * FROM lands WHERE uid = ?";
	
}
