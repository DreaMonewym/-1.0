package com.wym.controller;

import com.wym.config.FreemarkUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "w1",urlPatterns = {"/welcome"},
        initParams ={@WebInitParam(name="index",value = "article?action=queryall&cur=0")} )
public class WelcomeController extends HttpServlet {
    private Map<String,String> map=new HashMap<String,String>();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher=req.getRequestDispatcher(map.get("index"));
        dispatcher.forward(req,resp);
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        map.put("index",config.getInitParameter("index"));
    }
}
