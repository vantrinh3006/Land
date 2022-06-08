package javaweb.controllers.admins;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javaweb.commons.DAOUtil;
import javaweb.constants.Defines;
import javaweb.constants.MessageConstant;
import javaweb.models.Contact;
import javaweb.models.User;
import javaweb.services.ContactService;

@Controller
@RequestMapping("admin/contact")
public class AdminContactController {
	@Autowired
	private ContactService contactService;

	@GetMapping("index")
	public String index(@RequestParam(required = false, name = "page") Integer page, Model model, HttpSession session) {
		if (session.getAttribute("userLogin") == null) {
			model.addAttribute("redirect", "admin");
			return "auth.login";
		}
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin.getRole().getRname().equals("user")) {
			model.addAttribute("msg", MessageConstant.ACCESS_ERR);
			model.addAttribute("redirect", "admin");
			return "auth.login";
		}
		int numberOfItems = contactService.countAll();
		int numberOfPages = (int) Math.ceil(numberOfItems * 1.0 / Defines.ROW_COUNT);
		if (page == null) {
			page = 1;
		} else if (page < 1) {
			return "redirect:/admin/contact/index";
		} else if (page > numberOfPages) {
			return "redirect:/admin/contact/index?page=" + numberOfPages;
		}
		int offset = (page - 1) * Defines.ROW_COUNT;
		List<Contact> listContact = contactService.getItemsPagination(offset);
		model.addAttribute("page", page);
		model.addAttribute("numberOfPages", numberOfPages);
		model.addAttribute("listContact", listContact);
		return "admin.contact.index";
	}

	@GetMapping("del/{cid}")
	public String del(@PathVariable int cid, RedirectAttributes re, HttpSession session, Model model) {
		if (session.getAttribute("userLogin") == null) {
			model.addAttribute("redirect", "admin");
			return "auth.login";
		}
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin.getRole().getRname().equals("user")) {
			model.addAttribute("msg", MessageConstant.ACCESS_ERR);
			model.addAttribute("redirect", "admin");
			return "auth.login";
		}
		if (userLogin.getRole().getRname().equals("editor")) {
			re.addFlashAttribute("msg", MessageConstant.MSG_USER_ERR);
			return "redirect:/admin/contact/index";
		}
		int del = contactService.del(cid);
		if (DAOUtil.isSuccess(del)) {
			re.addFlashAttribute("msg", MessageConstant.MSG_SUCCESS_DEL);
		} else {
			re.addFlashAttribute("err", MessageConstant.MSG_ERR);
		}
		return "redirect:/admin/contact/index";
	}
	
	@PostMapping("search")
	public String search(@RequestParam String search ,Model model, @RequestParam(required = false, name = "page") Integer page) {
		if (search.equals("")) {
			return "redirect:/admin/contact/index";
		}
		int numberOfItems = contactService.countSearch(search);
		int numberOfPages = (int) Math.ceil(numberOfItems * 1.0 / Defines.ROW_COUNT);
		if (page == null) {
			page = 1;
		} else if (page < 1) {
			return "redirect:/admin/contact/index";
		} else if (page > numberOfPages) {
			return "redirect:/admin/contact/index?page="+numberOfPages;
		}
		List<Contact> listSearch = contactService.search(search);
		model.addAttribute("listSearch", listSearch);
		model.addAttribute("page", page);
		model.addAttribute("numberOfPages", numberOfPages);
		return "admin.contact.index";
	}
}
