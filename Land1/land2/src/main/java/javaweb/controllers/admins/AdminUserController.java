package javaweb.controllers.admins;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javaweb.commons.DAOUtil;
import javaweb.constants.Defines;
import javaweb.constants.MessageConstant;
import javaweb.models.Role;
import javaweb.models.User;
import javaweb.services.RoleService;
import javaweb.services.UserService;
import javaweb.utils.StringUtil;
import javaweb.validator.RegisterValidator;

@Controller
@RequestMapping("admin/user")
public class AdminUserController {
	@Autowired
	private RoleService roleService;
	@Autowired
	private UserService userService;
	private RegisterValidator registerValidator = new RegisterValidator();
	private StringUtil stringUtil = new StringUtil();

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
		int numberOfItems = userService.countAll();
		int numberOfPages = (int) Math.ceil(numberOfItems * 1.0 / Defines.ROW_COUNT);
		if (page == null) {
			page = 1;
		} else if (page < 1) {
			return "redirect:/admin/user/index";
		} else if (page > numberOfPages) {
			return "redirect:/admin/user/index?page=" + numberOfPages;
		}
		int offset = (page - 1) * Defines.ROW_COUNT;
		List<User> listUser = userService.getItemsPagination(offset);		
		model.addAttribute("page", page);
		model.addAttribute("numberOfPages", numberOfPages);
		model.addAttribute("listUser", listUser);
		return "admin.user.index";
	}

	@GetMapping("add")
	public String add(Model model, HttpSession session, RedirectAttributes re) {
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
			return "redirect:/admin/user/index";
		}
		model.addAttribute("listRole", roleService.selectAll());
		return "admin.user.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("userErr") User user, BindingResult rs, Model model, RedirectAttributes re,
			@RequestParam("rid") int rid) {
		user.setRole(new Role(rid, null));
		registerValidator.validAdd(user, rs);
		if (rs.hasErrors()) {
			model.addAttribute("user", user);
			model.addAttribute("listRole", roleService.selectAll());
			return "admin.user.add";
		}
		if (userService.hasUser(user.getUsername())) {
			user.setPassword(stringUtil.md5(user.getPassword()));
			int add = userService.add(user); System.out.println("int add = " + add);
			if (DAOUtil.isSuccess(add)) {
				re.addFlashAttribute("msg", MessageConstant.REGISTER_SUCCESS);
			} else {
				re.addFlashAttribute("err", MessageConstant.REGISTER_ERR);
			}
			return "redirect:/admin/user/index";
		} else {
			model.addAttribute("user", user);
			model.addAttribute("err", "Tài khoản đã tồn tại");
			model.addAttribute("listRole", roleService.selectAll());
			return "admin.user.add";
		}
	}

	@GetMapping("del/{uid}")
	public String del(@PathVariable int uid, RedirectAttributes re, HttpSession session, Model model) {
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
			return "redirect:/admin/user/index";
		}
		if (uid == 1) {
			re.addFlashAttribute("msg", MessageConstant.MSG_DEL_ADMIN);
			return "redirect:/admin/user/index";
		} else {
			int del = userService.del(uid);
			if (DAOUtil.isSuccess(del)) {
				re.addFlashAttribute("msg", MessageConstant.MSG_SUCCESS_DEL);
			} else {
				re.addFlashAttribute("msg", MessageConstant.MSG_ERR);
			}
			return "redirect:/admin/user/index";
		}
	}

	@GetMapping("edit/{uid}")
	public String edit(@PathVariable int uid, Model model, HttpSession session, RedirectAttributes re) {
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
			return "redirect:/admin/user/index";
		}
		User user = userService.selectByID(uid);
		model.addAttribute("user", user);
		model.addAttribute("listRole", roleService.selectAll());
		return "admin.user.edit";
	}

	@PostMapping("edit/{uid}")
	public String edit(@PathVariable int uid, RedirectAttributes re, @Valid @ModelAttribute User user, BindingResult rs,
			@RequestParam("rid") int rid) {
		user.setRole(new Role(rid, null));
		registerValidator.validEdit(user, rs);
		if (rs.hasErrors()) {
			re.addFlashAttribute("user", user);
			return "redirect:/admin/user/edit/" + uid;
		}
		int edit = userService.edit(user);
		if (DAOUtil.isSuccess(edit)) {
			re.addFlashAttribute("msg", MessageConstant.MSG_SUCCESS_EDIT);
		} else {
			re.addFlashAttribute("err", MessageConstant.MSG_ERR);
		}
		return "redirect:/admin/user/index";
	}
	@PostMapping("search")
	public String search(@RequestParam String search ,Model model, @RequestParam(required = false, name = "page") Integer page) {
		if (search.equals("")) {
			return "redirect:/admin/user/index";
		}
		int numberOfItems = userService.countSearch(search);
		int numberOfPages = (int) Math.ceil(numberOfItems * 1.0 / Defines.ROW_COUNT);
		if (page == null) {
			page = 1;
		} else if (page < 1) {
			return "redirect:/admin/user/index";
		} else if (page > numberOfPages) {
			return "redirect:/admin/user/index?page="+numberOfPages;
		}
		List<User> listSearch = userService.search(search);
		model.addAttribute("listSearch", listSearch);
		model.addAttribute("page", page);
		model.addAttribute("numberOfPages", numberOfPages);
		return "admin.user.index";
	}
}
