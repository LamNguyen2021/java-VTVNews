package AdminNewPage.Controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import AdminNewPage.Bean.UploadFile;
import AdminNewPage.Entity.baibao;
import AdminNewPage.Entity.binhluan;
import AdminNewPage.Entity.danhmuc;
import AdminNewPage.Entity.taikhoan;
import AdminNewPage.Entity.timeBB;
import AdminNewPage.Entity.timeBL;

@Controller
@Transactional
public class AdminController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	@Qualifier("uploadFile")
	UploadFile baseUploadFile;
	
	@RequestMapping("admin")
	public String admin(HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession();
		taikhoan admin = (taikhoan) session.getAttribute("users");
		if(admin != null && admin.getVaitro()==1) {
			taikhoan tk = new taikhoan();
			tk.setHoten(admin.getHoten());
			tk.setUsername(admin.getUsername());
			tk.setAnh(admin.getAnh());
			tk.setSdt(admin.getSdt());
			tk.setGioitinh(admin.getGioitinh());
			tk.setPassword(admin.getPassword());
			tk.setVaitro(admin.getVaitro());

			model.addAttribute("TKLogin", tk);
		}
	
		Session session1 = factory.getCurrentSession();
		String hqlTaiKhoan = "FROM taikhoan";
		Query queryTaiKhoan = session1.createQuery(hqlTaiKhoan);
		List<taikhoan> listTaiKhoan = queryTaiKhoan.list();
		model.addAttribute("taikhoan", listTaiKhoan);
		
		String hqlDanhMuc = "FROM danhmuc";
		Query queryDanhMuc = session1.createQuery(hqlDanhMuc);
		List<danhmuc> listDanhMuc = queryDanhMuc.list();
		model.addAttribute("DM", listDanhMuc);
		
		return "admin/admin";
	}
	
	@RequestMapping("setAdmin/{username}")
	public String setAdmin(@PathVariable("username") String username) {
		username = username + ".com";

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		String hqlTaiKhoan = "FROM taikhoan WHERE username='" + username + "'";
		Query queryTaiKhoan = session.createQuery(hqlTaiKhoan);
		taikhoan tk = (taikhoan) queryTaiKhoan.list().get(0);
		
		if(tk.getVaitro() == 0) {
			tk.setVaitro(1);
		}
		
		try {
			session.update(tk);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			System.out.println("Doi vai tro that bai");
		} finally {
			session.close();
		}
		return "redirect:/admin";
	}
	
	@RequestMapping(value = "admin/danhmuc/{madanhmuc}", method = RequestMethod.GET)
	public String dsBaiVietTheoDM(HttpServletRequest request, ModelMap model, @PathVariable("madanhmuc") String maDM) {
		HttpSession session = request.getSession();
		taikhoan admin = (taikhoan) session.getAttribute("users");
		if(admin != null && admin.getVaitro()==1) {
			taikhoan tk = new taikhoan();
			tk.setHoten(admin.getHoten());
			tk.setUsername(admin.getUsername());
			tk.setAnh(admin.getAnh());
			tk.setSdt(admin.getSdt());
			tk.setGioitinh(admin.getGioitinh());
			tk.setPassword(tk.getPassword());
			tk.setVaitro(tk.getVaitro());
			model.addAttribute("TKLogin", tk);
		}
		
		Session session1 = factory.getCurrentSession();
		String hqlTenDanhMuc = "SELECT tendanhmuc FROM danhmuc WHERE madanhmuc = '" + maDM + "'";
		Query queryTenDanhMuc = session1.createQuery(hqlTenDanhMuc);
		String tenDanhMuc = (String) queryTenDanhMuc.list().get(0);
		model.addAttribute("TenDanhMuc", tenDanhMuc);
		
		String hqlBaiBao = "FROM baibao WHERE madanhmuc = '" + maDM + "'";
		Query queryBaiBao = session1.createQuery(hqlBaiBao);
		List<baibao> listBaiBao = queryBaiBao.list();
		
//		for (baibao baibao : listBaiBao) {
//			String noidung = baibao.getNoidung1().substring(0, baibao.getNoidung1().length()/3);
//			baibao.setNoidung1(noidung + "...");
//		}
		
		model.addAttribute("DanhSachBaiBao", listBaiBao);
		
		return "admin/baiBaoTheoDanhMuc";
	}
	
	@ModelAttribute("DanhMuc")
	public List<danhmuc> getDanhMuc() {
		Session session1 = factory.getCurrentSession();
		String hqlDanhMuc = "FROM danhmuc";
		Query queryDanhMuc = session1.createQuery(hqlDanhMuc);
		List<danhmuc> listDanhMuc = queryDanhMuc.list();
		return listDanhMuc;
	}
	
	@RequestMapping(value = "admin/themBaiBao", method = RequestMethod.GET)
	public String themBaiBao(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		taikhoan admin = (taikhoan) session.getAttribute("users");
		if(admin != null && admin.getVaitro()==1) {
			taikhoan tk = new taikhoan();
			tk.setHoten(admin.getHoten());
			tk.setUsername(admin.getUsername());
			tk.setAnh(admin.getAnh());
			tk.setSdt(admin.getSdt());
			tk.setGioitinh(admin.getGioitinh());
			tk.setPassword(tk.getPassword());
			tk.setVaitro(tk.getVaitro());
			model.addAttribute("TKLogin", tk);
		}
		
//		Session session1 = factory.getCurrentSession();
//		String hqlDanhMuc = "FROM danhmuc";
//		Query queryDanhMuc = session1.createQuery(hqlDanhMuc);
//		List<danhmuc> listDanhMuc = queryDanhMuc.list();
//		model.addAttribute("danhmuc", listDanhMuc);
		
		model.addAttribute("baibao", new baibao());
		
		return "admin/themBaiBao";
	}
	
	@RequestMapping(value = "admin/themBaiBao", method = RequestMethod.POST)
	public String themBaiBao(@ModelAttribute("baibao") baibao baibao, BindingResult errors, @RequestParam("anh") MultipartFile anh, HttpServletRequest request) {
		
		if(baibao.getTieude().trim().length() == 0) {
			errors.rejectValue("tieude", "baibao", "Vui lòng nhập tiêu đề");
			return "admin/themBaiBao";
		} else if (baibao.getTomtat().trim().length() == 0) {
			errors.rejectValue("tomtat", "baibao", "Vui lòng nhập tóm tắt");
			return "admin/themBaiBao";
		} else if (baibao.getNoidung1().trim().length() == 0) {
			errors.rejectValue("noidung1", "baibao", "Vui lòng nhập nội dung");
			return "admin/themBaiBao";
		} else if (baibao.getTieude().trim().length() < 10 || baibao.getTieude().trim().length() > 100) {
			errors.rejectValue("tieude", "baibao", "Độ dài tiêu đề từ 10 -> 50 kí tự. Bạn đã nhập được " + baibao.getTieude().trim().length() + " kí tự");
			return "admin/themBaiBao";
		} else if (baibao.getTieude().trim().length() < 30 || baibao.getTieude().trim().length() > 150) {
			errors.rejectValue("tomtat", "baibao", "Độ dài tiêu đề từ 30 -> 150 kí tự. Bạn đã nhập được " + baibao.getTomtat().trim().length() + " kí tự");
			return "admin/themBaiBao";
		}
		
		if(!anh.isEmpty()) {
			try {
				String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMddHHmmss-"));
				String fileName = date + anh.getOriginalFilename(); // đặt tên file
				String photoPath = baseUploadFile.getBasePath() + File.separator + fileName; // đặt đường dẫn hình ảnh
				
				anh.transferTo(new File(photoPath));
				Thread.sleep(2500);
				
				baibao.setHinhanh1(fileName);
			} catch (Exception e) {
				System.out.println("Loi upload hinh anh");
			}
		} else {
			baibao.setHinhanh1("vtvNews.png");
		}
		
		Date date = new Date();
		baibao.setNgaydang(date);
		
		HttpSession session = request.getSession();
		taikhoan admin = (taikhoan) session.getAttribute("users");
		if(admin != null && admin.getVaitro()==1) {
			baibao.setTaikhoan(admin);
		}
		
//		System.out.println("idbb" + baibao.getIdbb());
//		System.out.println("tieu de" + baibao.getTieude());
//		System.out.println("tom tat" + baibao.getTomtat());
//		System.out.println("noi dung" + baibao.getNoidung1());
//		System.out.println("hinh anh" + baibao.getHinhanh1());
//		System.out.println("ngay dang" + baibao.getNgaydang());
//		System.out.println("tai khoan" + baibao.getTaikhoan().getUsername());
//		System.out.println("danh muc" + baibao.getDanhmuc().getMadanhmuc());
		
		Session session1 = factory.openSession();
		Transaction t = session1.beginTransaction();
		
		try {
			session1.save(baibao);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			System.out.println("them bai bao that bai");
		} finally {
			session1.close();
		}
		
		return "redirect:/admin";
	}
	
	@RequestMapping(value = "admin/suaBaiBao/{idbb}", method = RequestMethod.GET)
	public String suaBaiBao(@PathVariable("idbb") int idbb, HttpServletRequest request, ModelMap model, @ModelAttribute("baibao") baibao baibao) {
		HttpSession session = request.getSession();
		taikhoan admin = (taikhoan) session.getAttribute("users");
		if(admin != null && admin.getVaitro()==1) {
			taikhoan tk = new taikhoan();
			tk.setHoten(admin.getHoten());
			tk.setUsername(admin.getUsername());
			tk.setAnh(admin.getAnh());
			tk.setSdt(admin.getSdt());
			tk.setGioitinh(admin.getGioitinh());
			tk.setPassword(tk.getPassword());
			tk.setVaitro(tk.getVaitro());
			model.addAttribute("TKLogin", tk);
		}
		
		Session session1 = factory.getCurrentSession();
		String hqlBaiBao = "FROM baibao WHERE idbb = " + idbb;
		Query queryBaiBao = session1.createQuery(hqlBaiBao);
		baibao BB = (baibao) queryBaiBao.list().get(0);
		model.addAttribute("baibao", BB);
		
		return "admin/suaBaiBao";
	}
	
	@RequestMapping(value = "admin/suaBaiBao/{idbb}", method = RequestMethod.POST)
	public String suaBaiBao(@PathVariable("idbb") int idbb, @ModelAttribute("baibao") baibao baibao, BindingResult errors, @RequestParam("anh") MultipartFile anh, HttpServletRequest request) {
		
		if(baibao.getTieude().trim().length() == 0) {
			errors.rejectValue("tieude", "baibao", "Vui lòng nhập tiêu đề");
			return "admin/themBaiBao";
		} else if (baibao.getTomtat().trim().length() == 0) {
			errors.rejectValue("tomtat", "baibao", "Vui lòng nhập tóm tắt");
			return "admin/themBaiBao";
		} else if (baibao.getNoidung1().trim().length() == 0) {
			errors.rejectValue("noidung1", "baibao", "Vui lòng nhập nội dung");
			return "admin/themBaiBao";
		} else if (baibao.getTieude().trim().length() < 10 || baibao.getTieude().trim().length() > 100) {
			errors.rejectValue("tieude", "baibao", "Độ dài tiêu đề từ 10 -> 50 kí tự. Bạn đã nhập được " + baibao.getTieude().trim().length() + " kí tự");
			return "admin/themBaiBao";
		} else if (baibao.getTieude().trim().length() < 30 || baibao.getTieude().trim().length() > 150) {
			errors.rejectValue("tomtat", "baibao", "Độ dài tiêu đề từ 30 -> 150 kí tự. Bạn đã nhập được " + baibao.getTomtat().trim().length() + " kí tự");
			return "admin/themBaiBao";
		}
		
		if(!anh.isEmpty()) {
			try {
				String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMddHHmmss-"));
				String fileName = date + anh.getOriginalFilename(); // đặt tên file
				String photoPath = baseUploadFile.getBasePath() + File.separator + fileName; // đặt đường dẫn hình ảnh
				
				anh.transferTo(new File(photoPath));
				Thread.sleep(2500);
				
				baibao.setHinhanh1(fileName);
			} catch (Exception e) {
				System.out.println("Loi upload hinh anh");
			}
		} else {
			baibao.setHinhanh1("vtvNews.png");
		}
		
		Date date = new Date();
		baibao.setNgaydang(date);
		
		HttpSession session = request.getSession();
		taikhoan admin = (taikhoan) session.getAttribute("users");
		if(admin != null && admin.getVaitro()==1) {
			baibao.setTaikhoan(admin);
		}
		
		Session session1 = factory.openSession();
		Transaction t = session1.beginTransaction();
		
		try {
			session1.update(baibao);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			System.out.println("cap nhat bai bao that bai");
		} finally {
			session1.close();
		}
		
		return "redirect:/admin";
	}
	
	@RequestMapping("admin/xoaBaiBao/{idbb}")
	public String xoaBaiBao(@PathVariable("idbb") int idbb) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		String hqlBaiBao = "FROM baibao WHERE idbb = " + idbb;
		Query queryBaiBao = session.createQuery(hqlBaiBao);
		baibao BB = (baibao) queryBaiBao.list().get(0);

		try {
			session.delete(BB);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			System.out.println("xoa bai bao that bai");
		} finally {
			session.close();
		}
		return "redirect:/admin";
	}
	
	@RequestMapping(value = "admin/themDanhMuc", method = RequestMethod.GET)
	public String themDanhMuc(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		taikhoan admin = (taikhoan) session.getAttribute("users");
		if(admin != null && admin.getVaitro()==1) {
			taikhoan tk = new taikhoan();
			tk.setHoten(admin.getHoten());
			tk.setUsername(admin.getUsername());
			tk.setAnh(admin.getAnh());
			tk.setSdt(admin.getSdt());
			tk.setGioitinh(admin.getGioitinh());
			tk.setPassword(tk.getPassword());
			tk.setVaitro(tk.getVaitro());
			model.addAttribute("TKLogin", tk);
		}
		
		model.addAttribute("danhmuc", new danhmuc());
		return "admin/themDanhMuc";
	}
	
	public boolean kiemTraDanhMucTonTai(String madanhmuc) {
		boolean trangthai = false;
		Session session = factory.getCurrentSession();
		String hql = "FROM danhmuc WHERE madanhmuc = '" + madanhmuc + "'";
		Query query = session.createQuery(hql);
		List<danhmuc> listDanhMuc = query.list();
		if(listDanhMuc != null && listDanhMuc.size() > 0) {
			trangthai = true;
		}
		return trangthai;
	}
	
	@RequestMapping(value = "admin/themDanhMuc", method = RequestMethod.POST)
	public String themDanhMuc(@ModelAttribute("danhmuc") danhmuc danhmuc, BindingResult errors) {
		String MADANHMUC_REGEX = "([1-9]){1}([A-Z]){2}";
		
		if(danhmuc.getMadanhmuc().trim().length() == 0) {
			errors.rejectValue("madanhmuc", "danhmuc", "Vui lòng nhập mã danh mục");
			return "admin/themDanhMuc";
		} else if (danhmuc.getTendanhmuc().trim().length() == 0) {
			errors.rejectValue("tendanhmuc", "danhmuc", "Vui lòng nhập tên danh mục");
			return "admin/themDanhMuc";
		} else if (!danhmuc.getMadanhmuc().matches(MADANHMUC_REGEX)) {
			errors.rejectValue("madanhmuc", "danhmuc", "Mã danh muc không đúng định dạng. Gồm 3 kí tự, kí tự đầu là số, 2 kí tự còn lại là chữ in hoa");
			return "admin/themDanhMuc";
		}
		
		if(kiemTraDanhMucTonTai(danhmuc.getMadanhmuc())) {
			errors.rejectValue("madanhmuc", "danhmuc", "Mã danh mục đã tồn tại");
			return "admin/themDanhMuc";
		}
		
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(danhmuc);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			System.out.println("them danh muc that bai");
		} finally {
			session.close();
		}
		return "redirect:/admin";
	}
}

















