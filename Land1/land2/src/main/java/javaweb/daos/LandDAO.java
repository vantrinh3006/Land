package javaweb.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javaweb.constants.Defines;
import javaweb.constants.SQL.LandSQLConstant;
import javaweb.models.Land;

@Repository
public class LandDAO extends AbstractDao<Land> {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public List<Land> selectAll() {
		return jdbcTemplate.query(LandSQLConstant.SELECT_ALL, new BeanPropertyRowMapper<Land>(Land.class));
	}
	
	public List<Land> selectSlider() {
		return jdbcTemplate.query(LandSQLConstant.SELECT_SLIDER, new BeanPropertyRowMapper<Land>(Land.class));
	}
	
	public List<Land> selectAllDateNew() {
		return jdbcTemplate.query(LandSQLConstant.SELECT_DATE_NEW, new BeanPropertyRowMapper<Land>(Land.class));
	}
	
	public List<Land> selectAllCountView() {
		return jdbcTemplate.query(LandSQLConstant.SELECT_COUNT_VIEW, new BeanPropertyRowMapper<Land>(Land.class));
	}
	
	public List<Land> getRelateItems(int cid){
		return jdbcTemplate.query(LandSQLConstant.GET_ITEM_RELATE, new BeanPropertyRowMapper<Land>(Land.class), cid);
	}
	
	public List<Land> selectByCid(int cid){
		return jdbcTemplate.query(LandSQLConstant.SELECT_BY_CID, new BeanPropertyRowMapper<Land>(Land.class), cid);
	}

	@Override
	public Land selectByID(int id) {
		try {
		return jdbcTemplate.queryForObject(LandSQLConstant.SELECT_BY_LID, new BeanPropertyRowMapper<Land>(Land.class), id);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public int add(Land t) {
		return jdbcTemplate.update(LandSQLConstant.ADD_LAND, t.getLname(), t.getDescription(), t.getDate_create(), t.getCid(), t.getPicture(), t.getArea(), t.getAddress(), t.getDetail(), t.getUid());
	}

	@Override
	public int del(int id) {
		return jdbcTemplate.update(LandSQLConstant.DEL_LAND, id);
	}

	@Override
	public int edit(Land t) {
		return jdbcTemplate.update(LandSQLConstant.UPDATE_LAND, t.getLname(), t.getDescription(), t.getDate_create(), t.getCid(), t.getPicture(), t.getArea(), t.getAddress(), t.getDetail(), t.getLid());
	}

	@Override
	public List<Land> search(String search) {
		return null;
	}
	
	public List<Land> search(Land t) {
		return jdbcTemplate.query(LandSQLConstant.SEARCH, new BeanPropertyRowMapper<Land>(Land.class), "%"+t.getLname()+"%", "%"+t.getDescription()+"%", "%"+t.getDetail()+"%", "%"+t.getAddress()+"%");
	}
	public int countSearch(Land t) {
		try {
		return jdbcTemplate.queryForObject(LandSQLConstant.COUNT_SEARCH, Integer.class, "%"+t.getLname()+"%", "%"+t.getDescription()+"%", "%"+t.getDetail()+"%", "%"+t.getAddress()+"%");
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public int countAll() {
		return jdbcTemplate.queryForObject(LandSQLConstant.COUNT_ALL, Integer.class);
	}
	
	public int countItemsByCid(int id) {
		return jdbcTemplate.queryForObject(LandSQLConstant.COUNT_BY_CID , Integer.class, new Object[] {id});
	}

	@Override
	public List<Land> getItemsPagination(int offset) {
		return jdbcTemplate.query(LandSQLConstant.GET_ITEMS_PAGE, new BeanPropertyRowMapper<Land>(Land.class), offset, Defines.ROW_COUNT);
	}
	
	public int increaseViews(int lid) {
		return jdbcTemplate.update(LandSQLConstant.INCRIACE_VIEWS, lid);
	}
	
	public List<Land> selectByUser(int uid) {
		return jdbcTemplate.query(LandSQLConstant.SELECT_BY_USER, new BeanPropertyRowMapper<Land>(Land.class), uid);
	}
	
	public int delByCid(int cid) {
		return jdbcTemplate.update(LandSQLConstant.DEL_BY_CID, cid);
	}

	
}
