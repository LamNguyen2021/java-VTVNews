package AdminNewPage.Controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import AdminNewPage.Entity.taikhoan;

@Transactional
@Controller
public class taikhoanController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("login")
	public String login(ModelMap model) {
		model.addAttribute("TaiKhoan", new taikhoan());
		return "home/login";
	}
	
	@RequestMapping(value = "checkLogin", method = RequestMethod.POST)
	public String checkLogin(@ModelAttribute("TaiKhoan") taikhoan taikhoan, ModelMap model,HttpServletRequest request, BindingResult errors) {

		Session session = factory.getCurrentSession();
		taikhoan tk = (taikhoan) session.get(taikhoan.class, taikhoan.getUsername());
		System.out.println("session tk: " + tk);
		
		
		try {
			if (taikhoan.getUsername().equals("")) {
				errors.rejectValue("username", "taikhoan", "Bạn chưa nhập email ");
				return "home/login";
			} else if (taikhoan.getPassword().equals("")) {
				errors.rejectValue("password", "taikhoan", "Bạn chưa nhập pasword");
				return "home/login";
			}
			if (taikhoan.getUsername().equals(tk.getUsername())) {
				System.out.println("tai khoan ton tai");
				if (taikhoan.getPassword().equals(tk.getPassword())) {

					HttpSession session2 = request.getSession();
					session2.setAttribute("users", tk);
					return "redirect:home";
				} else {

					errors.rejectValue("password", "taikhoan", "Sai mật khẩu");
					return "home/login";
				}
			}
			System.out.print("tai khoan k ton tai");
			errors.rejectValue("username", "taikhoan", "Email chưa đăng kí tài khoản");
			return "home/login";
		} catch (Exception ex) {
			System.out.print("Lỗi kiểm tra login: " + ex);
			errors.rejectValue("username", "taikhoan", "Email chưa đăng kí tài khoản");
		}
		return "home/login";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate(); // hủy tắt cả các sesion
		return "redirect:home";
	}
	
	@RequestMapping("register")
	public String register(ModelMap model) {
		model.addAttribute("taikhoan", new taikhoan());
		return "home/register";
	}
	
	public boolean kiemTraTaiKhoanTonTai(String gtri) {
		boolean trangthai = false;
		Session session = factory.getCurrentSession();
		String hql = "FROM taikhoan WHERE username = '" + gtri + "'";
		Query query = session.createQuery(hql);
		List<taikhoan> list = query.list();
		if(list != null && list.size() > 0) {
			trangthai = true;
		}
		return trangthai;
	}
	
	@Autowired
	ServletContext context;
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(ModelMap model,HttpServletRequest request, @RequestParam("anh") MultipartFile anh, 
			@ModelAttribute("taikhoan") taikhoan taikhoan, BindingResult errors) {
		System.out.println("vao dang ki, duma");
		if(taikhoan.getHoten().trim().length() == 0 
				&& taikhoan.getUsername().trim().length() == 0
				&& taikhoan.getPassword().trim().length() == 0) {
			errors.rejectValue("hoten", "taikhoan", "Bạn chưa nhập họ tên");
			errors.rejectValue("username", "taikhoan", "Bạn chưa nhập email");
			errors.rejectValue("password", "taikhoan", "Bạn chưa nhập mật khẩu");
			return "home/register";
		} else if(taikhoan.getUsername().trim().length() == 0
				&& taikhoan.getPassword().trim().length() == 0) {
			errors.rejectValue("username", "taikhoan", "Bạn chưa nhập email");
			errors.rejectValue("password", "taikhoan", "Bạn chưa nhập mật khẩu");
			return "home/register";
		} else if(taikhoan.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "taikhoan", "Bạn chưa nhập mật khẩu");
			return "home/register";
		}
		
		if(kiemTraTaiKhoanTonTai(taikhoan.getUsername())) {
			errors.rejectValue("username", "taikhoan", "Email này đã đăng kí. Vui lòng nhập email khác");
			return "home/register";
		}
		
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Date date = new Date();
		
		try {
			String fileNameImage = date.getTime() + anh.getOriginalFilename().toString().trim();
			// model.addAttribute("anh", anh.getOriginalFilename());
			String photoPath = context.getRealPath("./assets/images/" + fileNameImage);
			try {
				if (!anh.isEmpty()) {
					System.out.println("vao anh khac null");
					anh.transferTo(new File(photoPath));
					taikhoan.setAnh(fileNameImage);
				} else if (taikhoan.getGioitinh().equalsIgnoreCase("Nam")) {
					System.out.println("gan bang anh khac");
					taikhoan.setAnh("nam.png");
				} else if (taikhoan.getGioitinh().equalsIgnoreCase("Ná»¯")) {
					System.out.println("gan bang anh khac");
					taikhoan.setAnh("nu.jpg");
				}

			} catch (IllegalStateException | IOException e1) {
				// TODO Auto-generated catch block
				System.out.println("loi hinh anh 1 " + e1);
				e1.printStackTrace();
			}
			HttpSession session2 = request.getSession();
			session2.setAttribute("users", taikhoan);
			session.saveOrUpdate(taikhoan);
			t.commit();
			model.addAttribute("message", "Them thanh cong");
			return "redirect:home";
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Them that bai");
		} finally {
			session.close();
		}
		
		// có hình ảnh
//		if(!anh.isEmpty()) {
//			System.out.println("Co hinh anh");
//			try {
//				String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMddHHmmss-"));
//				String fileName = date + anh.getOriginalFilename(); // đặt tên file
//				String photoPath = baseUploadFile.getBasePath() + File.separator + fileName; // đặt đường dẫn hình ảnh
//				
//				anh.transferTo(new File(photoPath));
//				Thread.sleep(2500);
//				
//				taikhoan.setAnh(fileName);
//			} catch (Exception e) {
//				System.out.println("Lỗi upload hình ảnh");
//			}
//		} else {
//			if(taikhoan.getGioitinh().equalsIgnoreCase("Nam")) {
//				taikhoan.setAnh("nam.png");
//			} else if(taikhoan.getGioitinh().equalsIgnoreCase("Nữ")) {
//				taikhoan.setAnh("nu.jpg");
//			}
//		}
		
		return "home/register";
	}
}



















