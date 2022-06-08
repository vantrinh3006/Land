package javaweb.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javaweb.daos.RoleDAO;
import javaweb.models.Role;

@Service
public class RoleService {
	
	@Autowired
	private RoleDAO roleDAO;
	
	public List<Role> selectAll() {
		return roleDAO.selectAll();
	}
}
