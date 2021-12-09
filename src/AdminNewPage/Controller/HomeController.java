package AdminNewPage.Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import AdminNewPage.Bean.UploadFile;
import AdminNewPage.Entity.baibao;
import AdminNewPage.Entity.binhluan;
import AdminNewPage.Entity.danhmuc;
import AdminNewPage.Entity.taikhoan;
import AdminNewPage.Entity.timeBB;
import AdminNewPage.Entity.timeBL;

@Controller
@Transactional
public class HomeController {
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
	
	public List<baibao> timKiemBaiBao(String tenBaiBao) {
		Session session = factory.getCurrentSession();
		String hql = "FROM baibao where tieude LIKE :tenBaiBao";
		Query query = session.createQuery(hql);
		query.setParameter("tenBaiBao", "%" + tenBaiBao + "%");
		List<baibao> list = query.list();
		return list;
	}
	
	@RequestMapping(value = "timKiem", params = "btnSearch")
	public String timKiemBaiBao(HttpServletRequest request, ModelMap model) {
		String tuKhoaTim = request.getParameter("searchInput");
		model.addAttribute("tuKhoaTim", tuKhoaTim);
		
		List<baibao> listBaiBao = this.timKiemBaiBao(tuKhoaTim);
		
		Session session1 = factory.getCurrentSession();
		
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
		
		List<timeBB> timebbTK = new ArrayList<timeBB>();
		for(baibao i : listBaiBao) {
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			String time = format.format(i.getNgaydang());
			timebbTK.add(new timeBB(time, i));
		}
		model.addAttribute("timebbTK", timebbTK);
		
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
		
		return "home/baiBaoTimKiem";
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
	
	@RequestMapping("access-forbidden")
	public String accessForbidden() {
		return "access-forbidden";
	}
	
	@RequestMapping("*")
	public String pageNotFound() {
		return "page-not-found";
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
	
	
}
