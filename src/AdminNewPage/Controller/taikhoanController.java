package AdminNewPage.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		if(errors.hasErrors()) {
			System.out.println("Có lỗi validate login thì vào đây cho tao");
		}

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
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(@ModelAttribute("taikhoan") taikhoan taikhoan) {
		return "home/register";
	}
}



















