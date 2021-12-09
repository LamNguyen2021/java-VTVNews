package AdminNewPage.Intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import AdminNewPage.Entity.taikhoan;

public class AdminIntercepter extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//System.out.println("AdminIntercepter.preHandle");
		HttpSession session = request.getSession();
		taikhoan currentUser = (taikhoan) session.getAttribute("users");
		if(currentUser.getVaitro() == 0 || currentUser == null) {
			String path = request.getContextPath();
			response.sendRedirect(path + "/access-forbidden"); 
			return false;
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}
}
