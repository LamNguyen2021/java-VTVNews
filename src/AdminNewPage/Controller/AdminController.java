package AdminNewPage.Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import AdminNewPage.Entity.baibao;
import AdminNewPage.Entity.danhmuc;
import AdminNewPage.Entity.timeBB;

@Controller
@Transactional
public class AdminController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String index(ModelMap model) {
		
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
		
		
		return "home/home";
	}
	
	@RequestMapping("danh-muc/{madanhmuc}")
	public String BVTheoDM(ModelMap model, @PathVariable("madanhmuc") String maDM) {
		
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
		
		return "home/baiBaoTheoDanhMuc";
	}
	
	@RequestMapping("bai-viet/{idbb}")
	public String baiViet(ModelMap model) {
		return "home/article";
	}
	
}
















