package javaweb.controllers.admins;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javaweb.commons.DAOUtil;
import javaweb.constants.Defines;
import javaweb.constants.MessageConstant;
import javaweb.models.Category;
import javaweb.models.Land;
import javaweb.models.User;
import javaweb.services.CategoryService;
import javaweb.services.LandService;
import javaweb.services.UserService;
import javaweb.validator.PictureValidate;

@Controller
@RequestMapping("admin/land")
public class AdminLandController {
	@Autowired
	private LandService landService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private UserService userService;
	@Autowired
	private PictureValidate pictureValidate;
	
	@GetMapping("index")
	public String index(@RequestParam(required = false, name = "page") Integer page, Model model,
			HttpSession session) {
		if (session.getAttribute("userLogin")==null) {
			model.addAttribute("redirect", "admin");
			return "auth.login";
		}
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin.getRole().getRname().equals("user")) {
			model.addAttribute("msg", MessageConstant.ACCESS_ERR);
			model.addAttribute("redirect", "admin");
			return "auth.login";
		}

		int numberOfItems = landService.countAll();
		int numberOfPages = (int) Math.ceil(numberOfItems * 1.0 / Defines.ROW_COUNT);
		if (page == null) {
			page = 1;
		} else if (page < 1) {
			return "redirect:/admin/land/index";
		} else if (page > numberOfPages) {
			return "redirect:/admin/land/index?page="+numberOfPages;
		}
		int offset = (page - 1) * Defines.ROW_COUNT;
		List<Category> listCat = categoryService.selectAll();
		model.addAttribute("listCat", listCat);
		List<User> listUser = userService.selectAll();
		model.addAttribute("listUser", listUser);
		List<Land> listLand = landService.getItemsPagination(offset);
		model.addAttribute("listLands", listLand);
		model.addAttribute("page", page);
		model.addAttribute("numberOfPages", numberOfPages);
		return "admin.land.index";
	}
	
	@GetMapping("add")
	public String add(Model model, HttpSession session, RedirectAttributes re) {
		if (session.getAttribute("userLogin")==null) {
			model.addAttribute("redirect", "admin");
			return "auth.login";
		}
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin.getRole().getRname().equals("user")) {
			model.addAttribute("msg", MessageConstant.ACCESS_ERR);
			model.addAttribute("redirect", "admin");
			return "auth.login";
		}
		List<Category> listCat = categoryService.selectAll();
		model.addAttribute("listCat", listCat);
		return "admin.land.add";
	}
	
	@PostMapping("add")
	public String add(@Valid @ModelAttribute("landErr") Land land, BindingResult rs, 
			@RequestParam("file") MultipartFile multipartFile, 
			HttpServletRequest request, Model model, RedirectAttributes re,  HttpSession session) throws IllegalStateException, IOException{
		pictureValidate.PicValidate(multipartFile, rs);
		if (rs.hasErrors()) {
			List<Category> listCat = categoryService.selectAll();
			model.addAttribute("listCat", listCat);
			model.addAttribute("itemLand", land);
			return "admin.land.add";
		}
		int add = landService.add(land, multipartFile, request, session);
		if (DAOUtil.isSuccess(add)) {
			re.addFlashAttribute("msg", MessageConstant.MSG_SUCCESS_ADD);
		} else {
			re.addFlashAttribute("err", MessageConstant.MSG_ERR);
		}
		return "redirect:/admin/land/index";
	}
	
	@GetMapping("del/{lid}")
	public String del(@PathVariable int lid, RedirectAttributes re, HttpServletRequest request, HttpSession session, Model model) {
		if (session.getAttribute("userLogin")==null) {
			model.addAttribute("redirect", "admin");
			return "auth.login";
		}
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin.getRole().getRname().equals("user")) {
			model.addAttribute("msg", MessageConstant.ACCESS_ERR);
			model.addAttribute("redirect", "admin");
			return "auth.login";
		}
		int del = landService.del(lid, request);
		if (DAOUtil.isSuccess(del)) {
			re.addFlashAttribute("msg", MessageConstant.MSG_SUCCESS_DEL);
		} else {
			re.addFlashAttribute("err", MessageConstant.MSG_ERR);
		}
		return "redirect:/admin/land/index";
	}
	
	@GetMapping("edit/{lid}")
	public String edit(@PathVariable int lid, Model model, HttpSession session, RedirectAttributes re) {
		if (session.getAttribute("userLogin")==null) {
			model.addAttribute("redirect", "admin");
			return "auth.login";
		}
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin.getRole().getRname().equals("user")) {
			model.addAttribute("msg", MessageConstant.ACCESS_ERR);
			model.addAttribute("redirect", "admin");
			return "auth.login";
		}
		List<Category> listCat = categoryService.selectAll();
		model.addAttribute("listCat", listCat);
		Land itemLand = landService.selectByID(lid);
		model.addAttribute("itemLand", itemLand);
		return "admin.land.edit";
	}
	
	@PostMapping("edit/{lid}")
	public String edit(@PathVariable int lid ,@Valid @ModelAttribute("landErr") Land land, BindingResult rs, 
			@RequestParam("file") MultipartFile multipartFile, 
			HttpServletRequest request, Model model, RedirectAttributes re) throws IllegalStateException, IOException {
		if (rs.hasErrors()) {
			return "redirect:/admin/land/edit/"+lid;
		}
		int edit = landService.edit(land, multipartFile, request);
		if (DAOUtil.isSuccess(edit)) {
			re.addFlashAttribute("msg", MessageConstant.MSG_SUCCESS_EDIT);
		} else {
			re.addFlashAttribute("err", MessageConstant.MSG_ERR);
		}
		return "redirect:/admin/land/index";
	}
	

	@PostMapping("search")
	public String search(@RequestParam String search ,Model model, @RequestParam(required = false, name = "page") Integer page) {
		if (search.equals("")) {
			return "redirect:/admin/land/index";
		}
		int numberOfItems = landService.countSearch(search);
		int numberOfPages = (int) Math.ceil(numberOfItems * 1.0 / Defines.ROW_COUNT);
		if (page == null) {
			page = 1;
		} else if (page < 1) {
			return "redirect:/admin/land/index";
		} else if (page > numberOfPages) {
			return "redirect:/admin/land/index?page="+numberOfPages;
		}
		List<Category> listCat = categoryService.selectAll();
		model.addAttribute("listCat", listCat);
		List<User> listUser = userService.selectAll();
		model.addAttribute("listUser", listUser);
		List<Land> listSearch = landService.search(search);
		model.addAttribute("listSearch", listSearch);
		model.addAttribute("page", page);
		model.addAttribute("numberOfPages", numberOfPages);
		return "admin.land.index";
	}
}
