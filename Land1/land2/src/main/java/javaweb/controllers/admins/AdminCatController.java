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
import javaweb.models.Category;
import javaweb.models.User;
import javaweb.services.CategoryService;
import javaweb.services.LandService;

@Controller
@RequestMapping("admin/cat")
public class AdminCatController {
	@Autowired
	private CategoryService categoryServices;
	@Autowired
	private LandService landService;

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
		int numberOfItems = categoryServices.countAll();
		int numberOfPages = (int) Math.ceil(numberOfItems * 1.0 / Defines.ROW_COUNT);
		if (page == null) {
			page = 1;
		} else if (page < 1) {
			return "redirect:/admin/cat/index";
		} else if (page > numberOfPages) {
			return "redirect:/admin/cat/index?page=" + numberOfPages;
		}
		int offset = (page - 1) * Defines.ROW_COUNT;
		List<Category> listCat = categoryServices.getItemsPagination(offset);
		model.addAttribute("listCat", listCat);
		model.addAttribute("page", page);
		model.addAttribute("numberOfPages", numberOfPages);
		return "admin.cat.index";
	}

	@GetMapping("add")
	public String add(HttpSession session, RedirectAttributes re, Model model) {
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
		return "admin.cat.add";
	}

	@PostMapping("add")
	public String add(Model model, @Valid @ModelAttribute("catErr") Category category, BindingResult rs,
			RedirectAttributes re) {
		if (rs.hasErrors()) {
			return "admin.cat.add";
		}
		if (categoryServices.hasCat(category.getCname())) {
			model.addAttribute("cname", category.getCname());
			model.addAttribute("err", MessageConstant.MSG_CAT_ADD_ERR);
			return "admin.cat.add";
		} else {
			int add = categoryServices.add(category);
			if (DAOUtil.isSuccess(add)) {
				re.addFlashAttribute("msg", MessageConstant.MSG_SUCCESS_ADD);
			} else {
				re.addFlashAttribute("err", MessageConstant.MSG_ERR);
			}
			return "redirect:/admin/cat/index";
		}
	}

	@GetMapping("edit/{cid}")
	public String edit(@PathVariable int cid, Model model, HttpSession session, RedirectAttributes re) {
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
		Category itemCat = categoryServices.selectByID(cid);
		model.addAttribute("itemCat", itemCat);
		return "admin.cat.edit";
	}

	@PostMapping("edit/{cid}")
	public String edit(@PathVariable int cid, @Valid @ModelAttribute("catErr") Category category, BindingResult rs,
			Model model, RedirectAttributes re) {
		if (rs.hasErrors()) {
			return "redirect:/admin/cat/edit/" + cid;
		}
		int edit = categoryServices.edit(category);
		if (DAOUtil.isSuccess(edit)) {
			re.addFlashAttribute("msg", MessageConstant.MSG_SUCCESS_EDIT);
		} else {
			re.addFlashAttribute("err", MessageConstant.MSG_ERR);
		}
		return "redirect:/admin/cat/index";
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
		int del = categoryServices.del(cid);
		if (DAOUtil.isSuccess(del)) {
			int delLand = landService.delByCid(cid);
			if (DAOUtil.isSuccess(delLand)) {
				re.addFlashAttribute("msg", MessageConstant.MSG_SUCCESS_DEL);
			} else {
			//	re.addFlashAttribute("msg", MessageConstant.MSG_ERR);
			}

		} else {
			re.addFlashAttribute("msg", MessageConstant.MSG_ERR);
		}
		return "redirect:/admin/cat/index";
	}

	@PostMapping("search")
	public String search(@RequestParam String search, Model model,
			@RequestParam(required = false, name = "page") Integer page) {
		if (search.equals("")) {
			return "redirect:/admin/cat/index";
		}
		int numberOfItems = categoryServices.countSearch(search);
		int numberOfPages = (int) Math.ceil(numberOfItems * 1.0 / Defines.ROW_COUNT);
		if (page == null) {
			page = 1;
		} else if (page < 1) {
			return "redirect:/admin/cat/index";
		} else if (page > numberOfPages) {
			return "redirect:/admin/cat/index?page=" + numberOfPages;
		}
		List<Category> listSearch = categoryServices.search(search);
		model.addAttribute("listSearch", listSearch);
		model.addAttribute("page", page);
		model.addAttribute("numberOfPages", numberOfPages);
		return "admin.cat.index";
	}
}