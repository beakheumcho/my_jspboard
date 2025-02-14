package org.iclass.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings("serial")
@WebFilter(urlPatterns = {"*.jsp"})
public class EncodingFilter extends HttpFilter implements Filter{
	private static final Logger logger = LoggerFactory.getLogger(EncodingFilter.class);

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse)resp;
		//로그 출력의 {} 기호는 printf 의 %s 와 같은 역할이므로 대입될 데이터 개수를 맞춰서 전달합니다.
		logger.info(":::::  요청 전 setEncoding filter : {} {}", request.getServletPath(),"테스트");

		request.setCharacterEncoding("UTF-8");
		chain.doFilter(req, resp);
	}

}
