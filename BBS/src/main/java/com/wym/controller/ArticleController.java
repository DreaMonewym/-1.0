package com.wym.controller;

import com.alibaba.fastjson.JSON;
import com.wym.config.FreemarkUtils;
import com.wym.po.Article;
import com.wym.po.Bbsuser;
import com.wym.service.ArticleServiceImpl;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;


@WebServlet(name="/a1",urlPatterns = {"/article"},
        initParams = {
                @WebInitParam(name="show",value = "show.ftl"),
                @WebInitParam(name="welcome",value = "/welcome"),
                @WebInitParam(name="showreply",value = "/article?action=queryid&id=")
            })
public class ArticleController extends HttpServlet {
    private Map<String,String> map=new HashMap<>();
    @Autowired
    private ArticleServiceImpl service;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         String action=req.getParameter("action");
         switch(action){
             case "queryall":
                 String curpage=req.getParameter("cur");
                 Map vmap=new HashMap<String,Object>();
                 HashMap vmp=(HashMap) req.getAttribute("vmp");
                 int pagesize=0;
                 Bbsuser user= (Bbsuser) req.getSession().getAttribute("user");
                 if(user!=null) {
                     pagesize=user.getPagenum();
                     vmap.put("msg", "恭喜" + user.getUsername() + "，登录成功！");
                     vmap.put("user", user);
                 }else{
                     pagesize=5;
                 }
                 if(vmp!=null){
                     vmap.put("msg",vmp.get("msg"));
                 }
                 Sort sort=new Sort(Sort.Direction.DESC,"id");
                 PageRequest pb= new PageRequest(Integer.parseInt(curpage),pagesize,sort);
                 Page<Article> p=service.queryAll(pb,0);
                 vmap.put("page", p);
                 FreemarkUtils.forword(resp,map.get("show"),vmap);
                 break;
             case "del":
                 String id=req.getParameter("id");
                 service.delete(Integer.parseInt(id));
                 RequestDispatcher dispatcher=req.getRequestDispatcher(map.get("welcome"));
                 dispatcher.forward(req,resp);
                 break;
             case "queryid"://查从贴
                 String rid=req.getParameter("id");
                 Map<String,Object> map1=service.findArticleByid(Integer.parseInt(rid));
                 resp.setContentType("text/html");
                 resp.setCharacterEncoding("utf-8");
                 PrintWriter out=resp.getWriter();

                 String json= JSON.toJSONString(map1,true);
                 out.print(json);
                 out.flush();
                 out.close();
                 break;
             case "add":
                 Article article=new Article();
                 article.setRootid(0);
                 article.setTitle(req.getParameter("title"));
                 article.setContent(req.getParameter("content"));
                 article.setDatetime(new Date(System.currentTimeMillis()));
                 Bbsuser buser= (Bbsuser) req.getSession().getAttribute("user");
                 article.setUser(buser);
                 service.save(article);//增加主贴
                 dispatcher=req.getRequestDispatcher(map.get("welcome"));
                 dispatcher.forward(req,resp);
                 break;
             case "reply":
                 article=new Article();
                 int rootid=Integer.parseInt(req.getParameter("rootid"));
                 article.setRootid(rootid);
                 article.setTitle(req.getParameter("title"));
                 article.setContent(req.getParameter("content"));
                 article.setDatetime(new Date(System.currentTimeMillis()));
                 buser= (Bbsuser) req.getSession().getAttribute("user");
                 article.setUser(buser);
                 service.save(article);//增加cong贴
                 dispatcher=req.getRequestDispatcher(map.get("showreply")+rootid);
                 dispatcher.forward(req,resp);
                 break;
             case "delc"://删从贴
                 String cid=req.getParameter("id");
                 String crootid=req.getParameter("rootid");
                 service.deletec(Integer.parseInt(cid),Integer.parseInt(crootid));
                 dispatcher=req.getRequestDispatcher(map.get("showreply")+crootid);
                 dispatcher.forward(req,resp);
                 break;
         }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        map.put("show",config.getInitParameter("show"));
        map.put("welcome",config.getInitParameter("welcome"));
        map.put("showreply",config.getInitParameter("showreply"));
    }
}
