package com.wym.controller;

import com.wym.config.FreemarkUtils;
import com.wym.po.Bbsuser;
import com.wym.service.UserServiceImpl;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name="u1",urlPatterns = {"/user"},
          initParams ={
          @WebInitParam(name="welcome",value = "/welcome")
          })
public class UserController extends HttpServlet {
    @Autowired
    private UserServiceImpl service;

    Map<String,String> map=new HashMap<String,String>();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String,Object> vmap=null;
       if(ServletFileUpload.isMultipartContent(req)){
             Bbsuser user=service.upload(req);
             vmap=new HashMap<String,Object>();
             user=service.save(user);
             if(user!=null){
                 vmap.put("msg","恭喜"+user.getUsername()+"，注册成功！");
             }
            req.setAttribute("vmp",vmap);
            RequestDispatcher dispatcher=req.getRequestDispatcher(map.get("welcome"));
            dispatcher.forward(req,resp);
       }else{
           vmap=new HashMap<String,Object>();
           String action=req.getParameter("action");
           Bbsuser user=null;
           switch (action) {
               case "login":
                   user = login(req, resp);
//                   vmap.put("msg", "恭喜" + user.getUsername() + "，登录成功！");
//                   vmap.put("user", user);
                   req.getSession().setAttribute("user",user);
                   RequestDispatcher dispatcher=req.getRequestDispatcher(map.get("welcome"));
                   dispatcher.forward(req,resp);
                   break;
               case "out":
                   req.getSession().invalidate();
                   dispatcher=req.getRequestDispatcher(map.get("welcome").toString());
                   dispatcher.forward(req,resp);
                   break;
               case "pic":
                   pic(req,resp);
                   break;
           }
       }
    }

    private void pic(HttpServletRequest req, HttpServletResponse resp) {
        String id =req.getParameter("id");
        Bbsuser user=service.getPic(id);
        try {
            resp.setContentType("image/jpeg");
            OutputStream out=resp.getOutputStream();
            out.write(user.getPic());
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void out(HttpServletRequest req,HttpServletResponse resp) {
        req.getSession().invalidate();
        //FreemarkUtils.forword(resp,map.get("show"),null);
    }

    private Bbsuser login(HttpServletRequest req,HttpServletResponse resp) {
        String username=req.getParameter("username");
        String passwprd=req.getParameter("password");
        Bbsuser bbsuser=new Bbsuser();
        bbsuser.setUsername(username);
        bbsuser.setPassword(passwprd);
        bbsuser=service.login(bbsuser);
        if(bbsuser!=null){//处理Cookie
            String sun=req.getParameter("sun");
            if(sun!=null){
                Cookie uc=new Cookie("papaoku",username);
                uc.setMaxAge(3600*24*7);
                resp.addCookie(uc);
                Cookie pc=new Cookie("papaokp",passwprd);
                pc.setMaxAge(3600*24*7);
                resp.addCookie(pc);
            }

            return bbsuser;
        }
        return  null;
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        map.put("welcome",config.getInitParameter("welcome"));
    }
}
