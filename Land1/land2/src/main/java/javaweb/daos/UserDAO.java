package javaweb.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javaweb.constants.Defines;
import javaweb.constants.SQL.ContactSQLConstant;
import javaweb.constants.SQL.UserSQLConstant;
import javaweb.models.Contact;
import javaweb.models.Role;
import javaweb.models.User;
import javaweb.utils.StringUtil;

@Repository
public class UserDAO extends AbstractDao<User> {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private UserDAO userDAO;
	private StringUtil stringUtil = new StringUtil();

	@Override
	public List<User> selectAll() {
		return jdbcTemplate.query(UserSQLConstant.SELECT_ALL, new RowMapper<User>() {
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				Role role = new Role(rs.getInt("r.rid"), rs.getString("rname"));
				User user = new User(rs.getInt("uid"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), role);
				return user;
			}
		});
//		return jdbcTemplate.query(UserSQLConstant.SELECT_ALL, new BeanPropertyRowMapper<User>(User.class));
	}

	public User findByUser(String username) {
		try {
			return jdbcTemplate.queryForObject(UserSQLConstant.FIND_BY_USER, new RowMapper<User>() {
				@Override
				public User mapRow(ResultSet rs, int rowNum) throws SQLException {
					Role role = new Role(rs.getInt("r.rid"), rs.getString("rname"));
					User user = new User(rs.getInt("uid"), rs.getString("username"), rs.getString("password"),
							rs.getString("fullname"), role);
					return user;
				}
			}, username);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public User selectByID(int id) {
		return jdbcTemplate.queryForObject(UserSQLConstant.SELECT_BY_ID, new RowMapper<User>() {
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				Role role = new Role(rs.getInt("r.rid"), rs.getString("rname"));
				User user = new User(rs.getInt("uid"), rs.getString("username"), rs.getString("password"),
						rs.getString("fullname"), role);
				return user;
			}
		}, id);
	}

	@Override
	public int add(User t) {
		return jdbcTemplate.update(UserSQLConstant.ADD_USER, t.getUsername(), t.getPassword(), t.getFullname(),
				t.getRole().getRid());
	}

	@Override
	public int del(int id) {
		return jdbcTemplate.update(UserSQLConstant.DEL_BY_ID, id);
	}

	@Override
	public int edit(User t) {

		return jdbcTemplate.update(UserSQLConstant.UPDATE_USER, t.getUsername(), t.getPassword(), t.getFullname(),
				t.getRole().getRid(), t.getUid());
	}

	@Override
	public List<User> search(String search) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<User> search(User t) {
		return jdbcTemplate.query(UserSQLConstant.SEARCH, new RowMapper<User>() {
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				Role role = new Role(rs.getInt("r.rid"), rs.getString("rname"));
				User user = new User(rs.getInt("uid"), rs.getString("username"), rs.getString("password"),
						rs.getString("fullname"), role);
				return user;
			}
		}, "%" + t.getUsername() + "%", "%" + t.getFullname() + "%");
	}

	public int countSearch(User t) {
		return jdbcTemplate.queryForObject(UserSQLConstant.COUNT_SEARCH, Integer.class, "%" + t.getUsername() + "%",
				"%" + t.getFullname() + "%");
												//		return jdbcTemplate.queryForObject(sql, requiredType, args)
	}

	@Override
	public int countAll() {
		return jdbcTemplate.queryForObject(UserSQLConstant.COUNT_ALL, Integer.class);
	}

	@Override
	public List<User> getItemsPagination(int offset) {
		return jdbcTemplate.query(UserSQLConstant.GET_ITEMS_PAGE, new RowMapper<User>() {
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				Role role = new Role(rs.getInt("r.rid"), rs.getString("rname"));
				User user = new User(rs.getInt("uid"), rs.getString("username"), rs.getString("password"),
						rs.getString("fullname"), role);
				return user;
			}
		}, offset, Defines.ROW_COUNT);
	}

}
