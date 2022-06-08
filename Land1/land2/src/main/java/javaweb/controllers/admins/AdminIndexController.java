package javaweb.controllers.admins;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javaweb.constants.MessageConstant;
import javaweb.models.User;
import javaweb.services.CategoryService;
import javaweb.services.ContactService;
import javaweb.services.LandService;
import javaweb.services.UserService;

@Controller
@RequestMapping("admin") 
public class AdminIndexController {
	@Autowired 
	private CategoryService categoryService;
	@Autowired 
	private ContactService contactService;
	@Autowired 
	private LandService landService;
	@Autowired 
	private UserService userService;
	@GetMapping("index")
	public String index(Model model, HttpSession session) {
//		if (session.getAttribute("userLogin")==null) {
//			model.addAttribute("redirect", "admin");
//			return "auth.login";
//		}
//		User userLogin = (User) session.getAttribute("userLogin");
//		if (userLogin.getRole().getRname().equals("user")) {
//			model.addAttribute("msg", MessageConstant.ACCESS_ERR);
//			model.addAttribute("redirect", "admin");
//			return "auth.login";
//		}
		int countCat = categoryService.countAll();
		int countUser = userService.countAll();
		int countLand = landService.countAll();
		int countContact = contactService.countAll();
		model.addAttribute("countCat", countCat);
		model.addAttribute("countUser", countUser);
		model.addAttribute("countLand", countLand);
		model.addAttribute("countContact", countContact);
		return "admin.index";
	}
}
