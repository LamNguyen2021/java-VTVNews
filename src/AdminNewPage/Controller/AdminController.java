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
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String index(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		Session session1 = factory.openSession();
		String hql = "FROM baibao ORDER BY ngaydang DESC";
		Query query = session1.createQuery(hql);
		
		// bài viết trang nhất, cục bự nhất
		baibao topbb = new baibao();
		topbb = (baibao) query.list().get(0);
		model.addAttribute("TOPNEW", topbb);
		
		// top 3 bai viết bên dưới
		List<baibao> list2 = query.list().subList(1, 4);
		model.addAttribute("TOP3", list2);
		
		// top 2 bài viết bên trái
		List<baibao> list45 = query.list().subList(4, 6);
		model.addAttribute("BB45", list45);
		
		// top 4 bài viết bên phải
		List<baibao> listRight = query.list().subList(6, 10);
		model.addAttribute("listRight", listRight);
		
		// 4 bài viết bình thường ở dưới
		List<baibao> listBottom = query.list().subList(10, 14);
		List<timeBB> time1 = new ArrayList<timeBB>();
		for (baibao i : listBottom) {
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			String time = format.format(i.getNgaydang());
			//System.out.println("ngay format: " + time);
			time1.add(new timeBB(time, i));
		}
		model.addAttribute("timeBBFormat", time1);
		model.addAttribute("listBottom", listBottom);
		
		String Onhiem = "FROM baibao WHERE idbb=2";
		Query queryOnhiem = session1.createQuery(Onhiem);
		baibao OnhiemBB = new baibao();
		OnhiemBB = (baibao) queryOnhiem.list().get(0);
		//System.out.println("O nhiem: " + OnhiemBB.getTieude());
		model.addAttribute("oNhiemMT", OnhiemBB);
		
		String tuyenDung = "FROM baibao WHERE idbb=3";
		Query querytuyenDung = session1.createQuery(tuyenDung);
		baibao tuyenDungBB = new baibao();
		tuyenDungBB = (baibao) querytuyenDung.list().get(0);
		model.addAttribute("tuyenDung", tuyenDungBB);
		
		String thuocLa = "FROM baibao WHERE idbb=4";
		Query querythuocLa = session1.createQuery(thuocLa);
		baibao thuocLaBB = new baibao();
		thuocLaBB = (baibao) querythuocLa.list().get(0);
		model.addAttribute("thuocLa", thuocLaBB);
		
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int day = c.get(Calendar.DAY_OF_MONTH);
		int hour = c.get(Calendar.HOUR_OF_DAY);
		int minute = c.get(Calendar.MINUTE);
		
		String date = hour + "g  " + day + "/" + month + "/" + year;
		model.addAttribute("date", date);
		
		String hql3 = "FROM danhmuc";
		Query query3 = session1.createQuery(hql3);
		List<danhmuc> list3 = query3.list();
		model.addAttribute("DM", list3);
		
		if(session.getAttribute("users") != null) {
			//taikhoan currentSSTK = (taikhoan) session.getAttribute("users");
			taikhoan tk = new taikhoan();
			tk.setHoten( ((taikhoan) session.getAttribute("users")).getHoten());
			tk.setUsername( ((taikhoan) session.getAttribute("users")).getUsername());
			tk.setAnh(((taikhoan) session.getAttribute("users")).getAnh());
			tk.setSdt(((taikhoan) session.getAttribute("users")).getSdt());
			tk.setGioitinh(((taikhoan) session.getAttribute("users")).getGioitinh());
			tk.setPassword(((taikhoan) session.getAttribute("users")).getPassword());
			tk.setVaitro(((taikhoan) session.getAttribute("users")).getVaitro());
			model.addAttribute("TKLogin", tk);
		}
		
		
		return "home/home";
	}
	
	@RequestMapping("danh-muc/{madanhmuc}")
	public String BVTheoDM(ModelMap model, @PathVariable("madanhmuc") String maDM, HttpServletRequest request) {
		
		Session session1 = factory.openSession();
		
		String Onhiem = "FROM baibao WHERE idbb=2";
		Query queryOnhiem = session1.createQuery(Onhiem);
		baibao OnhiemBB = new baibao();
		OnhiemBB = (baibao) queryOnhiem.list().get(0);
		//System.out.println("O nhiem: " + OnhiemBB.getTieude());
		model.addAttribute("oNhiemMT", OnhiemBB);
		
		String tuyenDung = "FROM baibao WHERE idbb=3";
		Query querytuyenDung = session1.createQuery(tuyenDung);
		baibao tuyenDungBB = new baibao();
		tuyenDungBB = (baibao) querytuyenDung.list().get(0);
		model.addAttribute("tuyenDung", tuyenDungBB);
		
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int day = c.get(Calendar.DAY_OF_MONTH);
		int hour = c.get(Calendar.HOUR_OF_DAY);
		int minute = c.get(Calendar.MINUTE);
		
		String date = hour + "g  " + day + "/" + month + "/" + year;
		model.addAttribute("date", date);
		
		String hql3 = "FROM danhmuc";
		Query query3 = session1.createQuery(hql3);
		List<danhmuc> list3 = query3.list();
		model.addAttribute("DM", list3);
		
		String bvTheoDM = "FROM baibao WHERE madanhmuc = '" + maDM + "' ORDER BY ngaydang DESC";
		Query querybvTheoDM = session1.createQuery(bvTheoDM);
		List<baibao> bbTDM = querybvTheoDM.list();
		List<timeBB> timebbTDM = new ArrayList<timeBB>();
		for(baibao i : bbTDM) {
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			String time = format.format(i.getNgaydang());
			//System.out.println("ngay format: " + time);
			timebbTDM.add(new timeBB(time, i));
		}
		model.addAttribute("timebbTDM", timebbTDM);
		model.addAttribute("maDM", maDM);
		
		HttpSession sesion2 = request.getSession();
		if(sesion2.getAttribute("users") != null) {
			taikhoan tk = new taikhoan();
			tk.setHoten(((taikhoan) sesion2.getAttribute("users")).getHoten());
			tk.setUsername(((taikhoan) sesion2.getAttribute("users")).getUsername());
			tk.setAnh(((taikhoan) sesion2.getAttribute("users")).getAnh());
			tk.setSdt(((taikhoan) sesion2.getAttribute("users")).getSdt());
			tk.setGioitinh(((taikhoan) sesion2.getAttribute("users")).getGioitinh());
			tk.setPassword(((taikhoan) sesion2.getAttribute("users")).getPassword());
			tk.setVaitro(((taikhoan) sesion2.getAttribute("users")).getVaitro());
			model.addAttribute("TKLogin", tk);
		}
		
		return "home/baiBaoTheoDanhMuc";
	}
	
	@RequestMapping("bai-viet/{idbb}")
	public String baiViet(ModelMap model, @PathVariable("idbb") int idbb, HttpServletRequest request) {
		Session session1 = factory.openSession();
		
		String hql3 = "FROM danhmuc";
		Query query3 = session1.createQuery(hql3);
		List<danhmuc> list3 = query3.list();
		model.addAttribute("DM", list3);
		
		String hql4 = "FROM baibao WHERE idbb = " + idbb;
		Query queryhql4 = session1.createQuery(hql4);
		baibao list4 = (baibao) queryhql4.list().get(0); // lấy được chi tiết bài viết rồi nè
		
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		String time = format.format(list4.getNgaydang());
		timeBB timelist4 = new timeBB(time, list4); // format lại ngày giờ cho bài báo
		
		model.addAttribute("BaiViet", timelist4);
		String danhMuc = list4.getDanhmuc().getMadanhmuc();
		model.addAttribute("danhMuc", danhMuc);
		
		// quảng cáo PC thuốc lá
		String thuocLa = "FROM baibao WHERE idbb=4";
		Query querythuocLa = session1.createQuery(thuocLa);
		baibao thuocLaBB = new baibao();
		thuocLaBB = (baibao) querythuocLa.list().get(0);
		model.addAttribute("thuocLa", thuocLaBB);
		
		// tin liên quan
		String tinLienQuan = "FROM baibao WHERE madanhmuc = '" + danhMuc + "' AND idbb != " + idbb + "ORDER BY ngaydang DESC";
		Query querytinLienQuan = session1.createQuery(tinLienQuan);
		List<baibao> listTinLienQuan = querytinLienQuan.list();
		if(listTinLienQuan.size() > 3) {
			listTinLienQuan = querytinLienQuan.list().subList(0, 3);
		}
		model.addAttribute("tinLienQuan", listTinLienQuan);
		
		// hiển thị tất cả bình luận 
		String binhLuan = "FROM binhluan WHERE idbb = " + idbb + " ORDER BY ngaybl DESC";
		Query querybinhLuan = session1.createQuery(binhLuan);
		List<binhluan> listBinhLuan = querybinhLuan.list();
		List<timeBL> listTimeBL = new ArrayList<timeBL>();
		for(binhluan i : listBinhLuan) {
			SimpleDateFormat formatbl = new SimpleDateFormat("dd/MM/yyyy");
			String timebl = formatbl.format(i.getNgaybl());
			//System.out.println("ngay format binh luan: " + timebl);
			listTimeBL.add(new timeBL(timebl, i));
		}
		model.addAttribute("listTimeBL", listTimeBL);
		
		HttpSession sesion2 = request.getSession();
		if(sesion2.getAttribute("users") != null) {
			taikhoan tk = new taikhoan();
			tk.setHoten(((taikhoan) sesion2.getAttribute("users")).getHoten());
			tk.setUsername(((taikhoan) sesion2.getAttribute("users")).getUsername());
			tk.setAnh(((taikhoan) sesion2.getAttribute("users")).getAnh());
			tk.setSdt(((taikhoan) sesion2.getAttribute("users")).getSdt());
			tk.setGioitinh(((taikhoan) sesion2.getAttribute("users")).getGioitinh());
			tk.setPassword(((taikhoan) sesion2.getAttribute("users")).getPassword());
			tk.setVaitro(((taikhoan) sesion2.getAttribute("users")).getVaitro());
			model.addAttribute("TKLogin", tk);
			model.addAttribute("binhluan", new binhluan());
		}
		
//		model.addAttribute("btnStatus", "btnAdd");

		return "home/article";
	}
	
	@RequestMapping(value = "binh-luan/{idbb}", method = RequestMethod.POST)
	public String binhLuanBB(@PathVariable("idbb") int idbb, @ModelAttribute("binhluan") binhluan binhluan) {
		binhluan.setNgaybl(new Date());
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(binhluan);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			System.out.println("Loi, khong luu duoc binh luan vao DB");
		} finally {
			session.close();
		}
		return "redirect:/bai-viet/{idbb}";
	}
	
	@RequestMapping("xoa-binh-luan/{idbl}/{idbb}")
	public String xoaBinhLuan(@PathVariable("idbl") int idbl, @PathVariable("idbb") int idbb) {
		Session session = factory.openSession();
		String hql = "FROM binhluan WHERE idbl = " + idbl;
		Query query = session.createQuery(hql);
		binhluan binhluancanxoa = (binhluan) query.list().get(0);
		
		Transaction t = session.beginTransaction();
		try {
			session.delete(binhluancanxoa);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			System.out.println("Loi, khong xoa duoc binh luan trong DB");
		} finally {
			session.close();
		}
		
		return "redirect:/bai-viet/{idbb}";
	}
	
//	@RequestMapping("chinh-sua-binh-luan/{idbl}/{idbb}")
//	public String chinhSuaBinhLuan(@PathVariable("idbl") int idbl, @PathVariable("idbb") int idbb, @ModelAttribute("binhluan") binhluan binhluan, ModelMap model) {
//		System.out.println("Vao ham chinh sua binh luan: " + idbl);
//		Session session = factory.getCurrentSession();
//		String hql = "FROM binhluan WHERE idbl = " + idbl;
//		Query query = session.createQuery(hql);
//		binhluan binhluanchinhsua = (binhluan) query.list().get(0);
//		
//		model.addAttribute("binhluan", binhluanchinhsua);
//		model.addAttribute("btnStatus", "btnEdit");
//		
//		
////		System.out.println("=====Binh luan can chinh sua: =======");
////		System.out.println(binhluanchinhsua.getIdbl());
////		System.out.println(binhluanchinhsua.getNoidung());
////		System.out.println(binhluanchinhsua.getBaibao().getIdbb());
////		System.out.println(binhluanchinhsua.getNgaybl());
////		System.out.println(binhluanchinhsua.getTaikhoan().getUsername());
//		
//		
//		return "redirect:/bai-viet/{idbb}";
//	}
	
	
	//============= ADMIN =============//
	
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
	public String themBaiBao(@ModelAttribute("baibao") baibao baibao, @RequestParam("anh") MultipartFile anh, HttpServletRequest request) {
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
	public String suaBaiBao(@PathVariable("idbb") int idbb, @ModelAttribute("baibao") baibao baibao, @RequestParam("anh") MultipartFile anh, HttpServletRequest request) {
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
	public String themDanhMuc(@ModelAttribute("danhmuc") danhmuc danhmuc) {
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

















