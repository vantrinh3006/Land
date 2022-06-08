package javaweb.controllers.publics;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javaweb.commons.DAOUtil;
import javaweb.constants.Defines;
import javaweb.constants.MessageConstant;
import javaweb.models.Category;
import javaweb.models.Contact;
import javaweb.models.Land;
import javaweb.models.User;
import javaweb.services.CategoryService;
import javaweb.services.ContactService;
import javaweb.services.LandService;
import javaweb.validator.PictureValidate;

@Controller
public class PublicController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private LandService landService;
	@Autowired
	private ContactService contactService;
	@Autowired
	private PictureValidate pictureValidate;

	@ModelAttribute
	public void setCat(Model model) {
		List<Category> listCat = categoryService.selectAll();
		model.addAttribute("listCat", listCat);
		List<Category> listCatHot = categoryService.selectCatHot();
		model.addAttribute("landService", landService);
		model.addAttribute("listCatHot", listCatHot);
		List<Land> listLandNew = landService.selectAllDateNew();
		model.addAttribute("listLandNew", listLandNew);
		List<Land> listLandCountView = landService.selectAllCountView();
		model.addAttribute("listLandCountView", listLandCountView);
	}

	@GetMapping("trang-chu")
	public String index(@RequestParam(required = false, name = "page") Integer page, Model model) {
		int numberOfItems = landService.countAll();
		int numberOfPages = (int) Math.ceil(numberOfItems * 1.0 / Defines.ROW_COUNT);
		if (page == null) {
			page = 1;
		} else if (page < 1) {
			return "redirect:/trang-chu";
		} else if (page > numberOfPages) {
			return "redirect:/trang-chu?page=" + numberOfPages;
		}
		int offset = (page - 1) * Defines.ROW_COUNT;
		List<Land> listLand = landService.getItemsPagination(offset);
		model.addAttribute("listLand", listLand);
		model.addAttribute("page", page);
		model.addAttribute("numberOfPages", numberOfPages);
		List<Land> listSlider = landService.selectSlider();
		model.addAttribute("listSlider", listSlider);
		return "cland.index";
	}

	@GetMapping("{itemCat}-{cid}")
	public String cat(@PathVariable int cid, Model model) {
		List<Land> listLandByCid = landService.selectByCid(cid);
		model.addAttribute("listLandByCid", listLandByCid);
		model.addAttribute("cid", cid);
		return "cland.cat";
	}

	@GetMapping("lien-he")
	public String contact() {
		return "cland.contact";
	}

	@PostMapping("lien-he")
	public String contact(@Valid @ModelAttribute("contactErr") Contact contact, BindingResult rs, Model model,
			RedirectAttributes re) {
		if (rs.hasErrors()) {
			model.addAttribute("contactErr", contact);
			return "cland.contact";
		}
		int add = contactService.add(contact);
		if (DAOUtil.isSuccess(add)) {
			re.addFlashAttribute("msg", MessageConstant.MSG_CONTACT_ADD);
		} else {
			re.addFlashAttribute("err", MessageConstant.MSG_ERR);
		}
		return "redirect:/lien-he";
	}

	@GetMapping("{itemLand}-{lid}.html")
	public String detail(@PathVariable int lid, Model model, HttpSession session) {
		Land itemLand = landService.selectByID(lid);
		landService.increaseViews(lid, session); // Increase View
		model.addAttribute("itemLand", itemLand);
		model.addAttribute("listByCid", landService.getRelateItems(itemLand.getCid()));
		return "cland.detail";
	}

	@PostMapping("search")
	public String search(@RequestParam String search, Model model,
			@RequestParam(required = false, name = "page") Integer page) {
		if (search.equals("")) {
			return "redirect:/trang-chu";
		}
		int numberOfItems = landService.countSearch(search);
		int numberOfPages = (int) Math.ceil(numberOfItems * 1.0 / Defines.ROW_COUNT);
		if (page == null) {
			page = 1;
		} else if (page < 1) {
			return "redirect:/trang-chu";
		} else if (page > numberOfPages) {
			return "redirect:/trang-chu?page=" + numberOfPages;
		}
		List<Land> listSearch = landService.search(search);
		model.addAttribute("listSearch", listSearch);
		model.addAttribute("page", page);
		model.addAttribute("numberOfPages", numberOfPages);
		List<Land> listSlider = landService.selectSlider();
		model.addAttribute("listSlider", listSlider);
		return "cland.index";
	}

	@GetMapping("{username}/{uid}")
	public String manage(@PathVariable int uid, Model model) {
		List<Land> listLandByUser = landService.selectByUser(uid);
		model.addAttribute("listLandByUser", listLandByUser);
		return "cland.manage";
	}

	@GetMapping("dang-tin")
	public String add(HttpSession session, Model model) {
		if (session.getAttribute("userLogin") == null) {
			model.addAttribute("msg", MessageConstant.LOGIN);
			return "auth.login";
		}
		return "cland.add";
	}

	@PostMapping("dang-tin")
	public String add(@Valid @ModelAttribute("landErr") Land land, BindingResult rs,
			@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request, Model model,
			RedirectAttributes re, HttpSession session) throws IllegalStateException, IOException {
		pictureValidate.PicValidate(multipartFile, rs);
		if (rs.hasErrors()) {
			model.addAttribute("itemLand", land);
			return "cland.add";
		}
		int add = landService.add(land, multipartFile, request, session);
		if (DAOUtil.isSuccess(add)) {
			re.addFlashAttribute("msg", MessageConstant.MSG_SUCCESS_ADD);
		} else {
			re.addFlashAttribute("err", MessageConstant.MSG_ERR);
		}
		return "redirect:/trang-chu";
	}

	@GetMapping("del/{lid}")
	public String del(@PathVariable int lid, RedirectAttributes re, HttpServletRequest request, HttpSession session,
			Model model) {
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin.getUid() != landService.selectByID(lid).getUid()) {
			re.addFlashAttribute("msg", MessageConstant.MSG_EDITOR_ERR);
			return "redirect:/" + userLogin.getUsername() + "/" + userLogin.getUid();
		}
		int del = landService.del(lid, request);
		if (DAOUtil.isSuccess(del)) {
			re.addFlashAttribute("msg", MessageConstant.MSG_SUCCESS_DEL);
		} else {
			re.addFlashAttribute("err", MessageConstant.MSG_ERR);
		}
		return "redirect:/" + userLogin.getUsername() + "/" + userLogin.getUid();
	}
	
	@GetMapping("edit-{lname}/{lid}")
	public String edit(@PathVariable int lid, Model model, HttpSession session, RedirectAttributes re) {
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin.getUid() != landService.selectByID(lid).getUid()) {
			re.addFlashAttribute("msg", MessageConstant.MSG_EDITOR_ERR);
			return "redirect:/" + userLogin.getUsername() + "/" + userLogin.getUid();
		}
		Land itemLand = landService.selectByID(lid);
		model.addAttribute("itemLand", itemLand);
		return "cland.edit";
	}
	
	@PostMapping("edit-{lname}/{lid}")
	public String edit(@PathVariable String lname ,@PathVariable int lid ,
			@Valid @ModelAttribute("landErr") Land land, BindingResult rs, 
			@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request, 
			Model model, RedirectAttributes re, HttpSession session) throws IllegalStateException, IOException {
		if (rs.hasErrors()) {
			return "redirect:/edit-"+lname+"/"+lid;
		}
		User userLogin = (User) session.getAttribute("userLogin");
		int edit = landService.edit(land, multipartFile, request);
		if (DAOUtil.isSuccess(edit)) {
			re.addFlashAttribute("msg", MessageConstant.MSG_SUCCESS_EDIT);
		} else {
			re.addFlashAttribute("err", MessageConstant.MSG_ERR);
		}
		return "redirect:/" + userLogin.getUsername() + "/" + userLogin.getUid();
	}
}
