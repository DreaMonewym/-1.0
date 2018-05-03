package com.wym.controller;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

//在static/editor/image/image.js的第17行左右和multiimage.js文件201行 加上要上传的地址
@WebServlet(name="/file",urlPatterns = {"/kindupload"})
public class KindController extends HttpServlet {

    private Map<String,String> types=new HashMap<String,String>();
    private  long maxSize = 1000000;
    public KindController(){
        types.put("image/jpeg", ".jpg");
        types.put("image/gif", ".gif");
        types.put("image/x-ms-bmp", ".bmp");
        types.put("image/png", ".png");

    }
    public String uploadPic(HttpServletRequest req) {
        CommonsMultipartResolver commonsMultipartResolver = new
                CommonsMultipartResolver(req.getSession().getServletContext());

        if (commonsMultipartResolver.isMultipart(req)) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("UTF-8");
            List items = null;
            try {

                FileItemIterator fileItems = upload.getItemIterator(req);
                while (fileItems.hasNext()) {
                    FileItemStream fileItemStream = fileItems.next();
                    String name = fileItemStream.getFieldName();//
                    InputStream stream = fileItemStream.openStream();
                    if (!fileItemStream.isFormField() &&
                            fileItemStream.getName().length() > 0) {
                        String contenttype=fileItemStream.getContentType();

                        if(!types.containsKey(contenttype)){
                            return  "文件上传错误，请重新上传！";
                        }
                        String s3=this.getClass().getClassLoader().getResource( "").toString();
                        //取得文件上传的目的目录
                        String dir=req.getParameter("dir");//

                        String id= UUID.randomUUID().toString(); //得到上传后的文件名称，唯一名称

                        String newFileName= s3+ "static/editor/upload/" +dir+"/"+ id+types.get(contenttype);

                        BufferedInputStream in = new BufferedInputStream(stream);

                        newFileName=newFileName.substring(6);//从file://后开始，否则上不去
                        BufferedOutputStream out = new BufferedOutputStream(
                                new FileOutputStream(new File(newFileName)));
                        String tpath=req.getRequestURL().toString() ;
                        tpath=tpath.substring(0,tpath.lastIndexOf("/"));
                        String path=tpath+"/editor/upload/"+dir+"/";//最终显示在编辑器中图片路径

                        Streams.copy(in, out, true);
                        JSONObject obj = new JSONObject();
                        obj.put("error", 0);//无错误
                        obj.put("url", path+ id+types.get(contenttype));//使用json格式把上传文件信息传递到前端

                        return obj.toJSONString();
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        return "";

    }




    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    /**
     * 单个文件上传具体实现方法;
     *
     * @return
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String s =uploadPic(req);
        PrintWriter out=resp.getWriter();

        out.print(s);
        out.flush();
        out.close();


    }


}
