package javaweb.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javaweb.daos.CategoryDAO;
import javaweb.models.Category;

@Service
public class CategoryService {
	@Autowired
	private CategoryDAO categoryDAO;
	public List<Category> selectAll() {
		return categoryDAO.selectAll();
	}
	public List<Category> selectCatHot() {
		return categoryDAO.selectCatHot();
	}
	public int del(int id) {
		return categoryDAO.del(id);
	}
	public int countAll() {
		return categoryDAO.countAll();
	}
	public int add(Category t) {
		return categoryDAO.add(t);
	}
	public Category selectByID(int id) {
		return categoryDAO.selectByID(id);
	}
	public int edit(Category t) {
		return categoryDAO.edit(t);
	}
	public Category findCname(String cname) {
		return categoryDAO.findCname(cname);
	}
	public boolean hasCat(String cname) {
		if (categoryDAO.findCname(cname)!=null) {
			return true;
		} else {
			return false;
		}
	}
	public List<Category> getItemsPagination(int offset){
		return categoryDAO.getItemsPagination(offset);
	}
	public List<Category> search(String search) {
		return categoryDAO.search(search);
	}
	public int countSearch(String search) {
		return categoryDAO.countSearch(search);
	}
}
