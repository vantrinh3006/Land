package javaweb.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javaweb.constants.Defines;
import javaweb.constants.SQL.CategorySQLConstant;
import javaweb.models.Category;

@Repository
public class CategoryDAO extends AbstractDao<Category> {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Category> selectAll() {
		return jdbcTemplate.query(CategorySQLConstant.SELECT_ALL, new BeanPropertyRowMapper<Category>(Category.class));
	}
	
	public List<Category> selectCatHot() {
		return jdbcTemplate.query(CategorySQLConstant.SELECT_CAT_HOT, new BeanPropertyRowMapper<Category>(Category.class));
	}

	@Override
	public Category selectByID(int id) {
		return jdbcTemplate.queryForObject(CategorySQLConstant.SELECT_BY_ID, new BeanPropertyRowMapper<Category>(Category.class), id);
	}

	@Override
	public int add(Category t) {
		return jdbcTemplate.update(CategorySQLConstant.ADD_CAT, t.getCname());
	}

	@Override
	public int del(int id) {
		return jdbcTemplate.update(CategorySQLConstant.DEL_BY_ID, id);
	}

	@Override
	public int edit(Category t) {
		return jdbcTemplate.update(CategorySQLConstant.UPDATE_CAT, t.getCname(), t.getCid());
	}

	@Override
	public List<Category> search(String search) {
		return jdbcTemplate.query(CategorySQLConstant.SEARCH, new BeanPropertyRowMapper<Category>(Category.class), "%"+search+"%");
	}
	public int countSearch(String search) {
		try {
		return jdbcTemplate.queryForObject(CategorySQLConstant.COUNT_SEARCH, Integer.class, "%"+search+"%");
		
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public int countAll() {
		return jdbcTemplate.queryForObject(CategorySQLConstant.COUNT_ALL, Integer.class);
	}
	
	public Category findCname(String cname) {
		try {
		return jdbcTemplate.queryForObject(CategorySQLConstant.FIND_BY_CNAME, new BeanPropertyRowMapper<Category>(Category.class), cname);
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public List<Category> getItemsPagination(int offset){
		return jdbcTemplate.query(CategorySQLConstant.GET_ITEMS_PAGE, new BeanPropertyRowMapper<Category>(Category.class), offset, Defines.ROW_COUNT);
	}
}
