package javaweb.services;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javaweb.daos.LandDAO;
import javaweb.models.Land;
import javaweb.models.User;

@Service
public class LandService {
	@Autowired
	private LandDAO landDAO;

	public List<Land> selectAll() {
		return landDAO.selectAll();
	}

	public List<Land> selectSlider() { // Slider in public.index
		return landDAO.selectSlider();
	}

	public int countAll() {
		return landDAO.countAll();
	}

	public List<Land> selectAllDateNew() {
		return landDAO.selectAllDateNew();
	}

	public List<Land> selectAllCountView() {
		return landDAO.selectAllCountView();
	}

	public List<Land> getRelateItems(int cid) {
		return landDAO.getRelateItems(cid);
	}

	public Land selectByID(int id) {
		return landDAO.selectByID(id);
	}

	public int add(Land t, MultipartFile multipartFile, HttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {
		User user = (User) session.getAttribute("userLogin");
		t.setUid(user.getUid());
		Timestamp date_create = new Timestamp(new Date().getTime());
		t.setDate_create(date_create);
		String dirUpload = request.getServletContext().getRealPath("/WEB-INF/resources/upload");
		String fileName = multipartFile.getOriginalFilename();
		// Rename file
		fileName = FilenameUtils.getBaseName(fileName) + "-" + System.nanoTime() + "."
				+ FilenameUtils.getExtension(fileName);
		File dir = new File(dirUpload);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		String filePath = dirUpload + File.separator + fileName;
		multipartFile.transferTo(new File(filePath));
		t.setPicture(fileName);
		System.out.println(dirUpload);
		return landDAO.add(t);
	}

	public int del(int id, HttpServletRequest request) {
		String dirUpload = request.getServletContext().getRealPath("/WEB-INF/resources/upload");
		if (landDAO.selectByID(id) != null) {
			if (!landDAO.selectByID(id).getPicture().isEmpty()) {
				String filePath = dirUpload + File.separator + landDAO.selectByID(id).getPicture();
				File file = new File(filePath);
				if (file.exists()) {
					file.delete();
				}
			}
			return landDAO.del(id);
		} else { // land not fount
			return landDAO.del(id);
		}
	}

	public int edit(Land t, MultipartFile multipartFile, HttpServletRequest request)
			throws IllegalStateException, IOException {
		Timestamp date_create = new Timestamp(new Date().getTime());
		t.setDate_create(date_create);
		String dirUpload = request.getServletContext().getRealPath("/WEB-INF/resources/upload");
		String fileName = multipartFile.getOriginalFilename();
		Land land2 = landDAO.selectByID(t.getLid());
		if (fileName.isEmpty()) {
			t.setPicture(land2.getPicture());
		} else {
			String oldFile = dirUpload + File.separator + land2.getPicture(); // Lấy đường dẫn file cũ
			File oldDir = new File(oldFile);
			if (oldDir.exists()) {
				oldDir.delete(); // Delete file
			}
			File dir = new File(dirUpload);
			if (!dir.exists()) {
				dir.mkdirs(); // Ghi file
			}
			// Rename file
			fileName = FilenameUtils.getBaseName(fileName) + "-" + System.nanoTime() + "."
					+ FilenameUtils.getExtension(fileName);
			String filePath = dirUpload + File.separator + fileName; //Lấy đường dẫn file mới
			multipartFile.transferTo(new File(filePath)); // Chuyển file
			t.setPicture(fileName);
		}
		System.out.println(dirUpload);
		return landDAO.edit(t);
	}
	public int countItemsByCid(int id) {
		return landDAO.countItemsByCid(id);
	}
	public List<Land> getItemsPagination(int offset) {
		return landDAO.getItemsPagination(offset);
	}

	public List<Land> selectByCid(int cid) {
		return landDAO.selectByCid(cid);
	}
	public int increaseViews(int lid, HttpSession session) {
		String hasVisited = (String) session.getAttribute("hasVisited: "+lid);
		if (hasVisited==null) {
			session.setAttribute("hasVisited: "+lid, "Up");
			session.setMaxInactiveInterval(3600);
			return landDAO.increaseViews(lid);
		} else {
			return 0;
		}
	}
	public List<Land> search(String search) {
		Land land = new Land();
		land.setLname(search);
		land.setDescription(search);
		land.setDetail(search);
		land.setAddress(search);
		return landDAO.search(land);
	}
	public int countSearch(String search) {
		Land land = new Land();
		land.setLname(search);
		land.setDescription(search);
		land.setDetail(search);
		land.setAddress(search);
		return landDAO.countSearch(land);
	}
	
	public List<Land> selectByUser(int uid) {
		return landDAO.selectByUser(uid);
	}
	public int delByCid(int cid) {		
		return landDAO.delByCid(cid);
	}
	
}
