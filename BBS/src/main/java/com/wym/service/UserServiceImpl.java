package com.wym.service;

import com.wym.dao.IUserDAO;
import com.wym.po.Bbsuser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

@Service
@Transactional
public class UserServiceImpl {

    private Map<String,String> types=new HashMap<String,String>();
    public UserServiceImpl(){
        //允许上传的文件类型
        types.put("image/jpeg", ".jpg");
        types.put("image/gif", ".gif");
        types.put("image/x-ms-bmp", ".bmp");
        types.put("image/png", ".png");
    }

    @Autowired
    private IUserDAO dao;
    public Bbsuser upload(HttpServletRequest req){
        //作用于所以application
        CommonsMultipartResolver commonsMultipartResolver = new
                CommonsMultipartResolver(req.getSession().getServletContext());
        //图片名字可以用中文
        commonsMultipartResolver.setDefaultEncoding("utf-8");
        commonsMultipartResolver.setResolveLazily(true);//延迟
        commonsMultipartResolver.setMaxInMemorySize(4096*1024);//缓存
        commonsMultipartResolver.setMaxUploadSizePerFile(1204*1024);//每个文件大小
        commonsMultipartResolver.setMaxUploadSize(2*1024*1024);//整个大小
        //将req转成流的request
        MultipartHttpServletRequest mreq=commonsMultipartResolver.resolveMultipart(req);
        MultipartFile  mfile=mreq.getFile("file0");
        String filename=mfile.getOriginalFilename();
        String filepath="upload"+File.separator+filename;
        File file=new File(filepath);

        try {
            mfile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Bbsuser user=new Bbsuser();
        user.setUsername(mreq.getParameter("reusername"));
        user.setPassword(mreq.getParameter("repassword"));
        user.setPicPath(filepath);
        user.setPagenum(10);
        //往Pic送字节
        try( InputStream fis=new FileInputStream(file)) {
            byte[] buffer=new byte[fis.available()];
            fis.read(buffer);
            user.setPic(buffer);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    public Bbsuser save(Bbsuser bbsuser){
        return dao.save(bbsuser);
    }
    public Bbsuser login(Bbsuser bbsuser){
        return dao.login(bbsuser.getUsername(),bbsuser.getPassword());
    }
    public Bbsuser getPic(@Param("id")String id){
        return dao.getPic(Integer.parseInt(id));
    }
}
