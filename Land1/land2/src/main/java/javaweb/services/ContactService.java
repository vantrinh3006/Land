package javaweb.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javaweb.daos.ContactDAO;
import javaweb.models.Contact;

@Service
public class ContactService {
	@Autowired
	private ContactDAO contactDAO;
	public List<Contact> selectAll() {
		return contactDAO.selectAll();
	}
	public int countAll() {
		return contactDAO.countAll();
	}
	public int add(Contact t) {
		return contactDAO.add(t);
	}
	public int del(int id) {
		return contactDAO.del(id);
	}
	public List<Contact> getItemsPagination(int offset) {
		return contactDAO.getItemsPagination(offset);
	}
	public List<Contact> search(String search) {
		Contact contact = new Contact();
		contact.setFullname(search);
		contact.setEmail(search);
		contact.setSubject(search);
		contact.setContent(search);
		return contactDAO.search(contact);
	}
	public int countSearch(String search) {
		Contact contact = new Contact();
		contact.setFullname(search);
		contact.setEmail(search);
		contact.setSubject(search);
		contact.setContent(search);
		return contactDAO.countSearch(contact);
	}
}
