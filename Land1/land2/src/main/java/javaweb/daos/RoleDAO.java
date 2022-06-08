package javaweb.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javaweb.constants.SQL.RoleSQLConstant;
import javaweb.models.Role;

@Repository
public class RoleDAO extends AbstractDao<Role> {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Role> selectAll() {
		return jdbcTemplate.query(RoleSQLConstant.SELECT_ALL, new BeanPropertyRowMapper<Role>(Role.class));
	}

	@Override
	public Role selectByID(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int add(Role t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int del(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int edit(Role t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Role> search(String search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Role> getItemsPagination(int offset) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
