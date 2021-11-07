package AdminNewPage.Controller;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import AdminNewPage.Entity.baibao;

@Controller
@Transactional
public class AdminController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String index() {
		Session session = factory.getCurrentSession();
		String hql = "FROM baibao";
		Query query = session.createQuery(hql);
		baibao topbb = new baibao();
		topbb = (baibao) query.list().get(0);
		System.out.println("lay theo ngay moi nhat " + topbb.getTieude());
		return "home/home";
	}
}
