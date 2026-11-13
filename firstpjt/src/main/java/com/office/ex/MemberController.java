package com.office.ex;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("*.mem")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberController() {
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
//		String RequestURL = request.getRequestURL().toString();
//		System.out.println("RequestURL: " + RequestURL);
	
		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI: " + RequestURI);
		
		/*
		 /firstpjt/signup.mem     -->  /signup.mem
		 /firstpjt/signin.mem	  -->  /signin.mem
		 */
		
		String contextPath = request.getContextPath();
		System.out.println("contextPath: " + contextPath);
		
		/*
		 *  /firstpjt
		 */
//		                 /signin.mem
		String command = RequestURI.substring(contextPath.length());
		System.out.println("command: " + command);
	
	
	/*
	 * 필요한건 3줄이다.
	 */
	
	MemberService memberService = null;
	String nextPage = null;
	
	switch (command) {
	case  "/signup.mem" :
		nextPage = "view/member/signup_form.jsp";
		
		break;
	case  "/signup_confirm.mem" :
		memberService = new MemberService();
		
		int resultForSignUp = memberService.signupConfirm(request, response);
		
		if(resultForSignUp == 1) {
			nextPage = "view/member/signup_ok.jsp";
		}else {
			nextPage = "view/member/signup_ng.jsp";
		}
		break;
	case  "/signin.mem" :
		
		break;
	}
	RequestDispatcher requestDispatcher = request.getRequestDispatcher(nextPage);
	requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
