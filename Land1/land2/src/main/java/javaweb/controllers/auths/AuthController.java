package javaweb.controllers.auths;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javaweb.commons.DAOUtil;
import javaweb.constants.MessageConstant;
import javaweb.models.Role;
import javaweb.models.User;
import javaweb.services.UserService;
import javaweb.utils.StringUtil;
import javaweb.validator.RegisterValidator;

@Controller
@RequestMapping("auth")
public class AuthController {
	@Autowired
	private UserService userService;
	private RegisterValidator registerValidator = new RegisterValidator();
	private StringUtil stringUtil = new StringUtil();

	@GetMapping("login")
	public String login(@RequestParam(required = false, name = "redirect") String redirect, Model model) {
		model.addAttribute("redirect", redirect);
		return "auth.login";
	}

	@PostMapping("login")
	public String login(@Valid @ModelAttribute("loginErr") User userErr, BindingResult rs,
			@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("redirect") String redirect, RedirectAttributes re, Model model, HttpSession session) {
		
		registerValidator.validLogin(userErr, rs);
		if (rs.hasErrors()) {
			model.addAttribute("username", username);
			return "auth.login";
		}
		password = stringUtil.md5(password);
		if (userService.itUser(username, password)) {
			User userLogin = userService.findByUser(username);
			if (redirect.equals("admin")) {
				if (userLogin.getRole().getRname().equals("user")) { // User do not access admin
					model.addAttribute("username", username);
					model.addAttribute("err", MessageConstant.ACCESS_ERR);
					model.addAttribute("redirect", redirect);
					return "auth.login";
				} else {
					session.setAttribute("userLogin", userLogin);
					re.addFlashAttribute("msg", MessageConstant.LOGIN_SUCCESS);
					return "redirect:/admin/index";
				}
			} else {
				session.setAttribute("userLogin", userLogin);
				re.addFlashAttribute("msg", MessageConstant.LOGIN_SUCCESS);
				return "redirect:/trang-chu";
			}
		} else {
			model.addAttribute("username", username);
			model.addAttribute("err", MessageConstant.LOGIN_ERR);
			model.addAttribute("redirect", redirect);
			return "auth.login";
		}
	}

	@GetMapping("logout")
	public String logout(HttpSession session, @RequestParam(required = false, name = "redirect") String redirect, Model model) {
		session.invalidate();
		model.addAttribute("redirect", redirect);
		return "auth.login";
	}

	@GetMapping("register")
	public String register() {
		return "auth.register";
	}

	@PostMapping("register")
	public String register(@Valid @ModelAttribute("registerErr") User user, BindingResult rs, Model model,
			RedirectAttributes re) {
		user.setRole(new Role(3, null)); // Register auto rid = 3
		registerValidator.validRegister(user, rs);
		if (rs.hasErrors()) {
			model.addAttribute("user", user);
			return "auth.register";
		}
		if (userService.hasUser(user.getUsername())) {
			user.setPassword(stringUtil.md5(user.getPassword()));
			int add = userService.add(user);
			if (DAOUtil.isSuccess(add)) {
				re.addFlashAttribute("msg", MessageConstant.REGISTER_SUCCESS);
			} else {
				re.addFlashAttribute("err", MessageConstant.REGISTER_ERR);
			}
			return "redirect:/trang-chu";
		} else {
			model.addAttribute("user", user);
			model.addAttribute("err", "Tài khoản đã tồn tại");
			return "auth.register";
		}
	}
}
