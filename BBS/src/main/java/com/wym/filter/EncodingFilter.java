package com.wym.filter;

import org.apache.catalina.servlet4preview.http.HttpFilter;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EncodingFilter extends HttpFilter {
    private String encoder="";
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
         encoder= filterConfig.getInitParameter("encoder");
    }

    @Override
    protected void doFilter(HttpServletRequest request, HttpServletResponse response,
                            FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding(encoder);
        chain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}
