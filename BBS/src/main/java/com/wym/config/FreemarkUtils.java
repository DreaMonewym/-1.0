package com.wym.config;


import freemarker.template.Configuration;
import freemarker.template.Template;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

public class FreemarkUtils {
    private static Configuration configuration;
    private static Configuration builtConfiguration(){
        if(null==configuration) {
            configuration = new Configuration(Configuration.VERSION_2_3_26);
            String path=FreemarkUtils.class.getResource("/").getPath();
            File file =new File(path+File.separator+"templates");
            try {
                configuration.setDirectoryForTemplateLoading(file);
                configuration.setDefaultEncoding("utf-8");

            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        return   configuration;
    }

    /**
     *
     * @param response  相应对象
     * @param targetView  目标页的名字
     * @param vmp  传给目标页的键值对
     */
    public static void forword(HttpServletResponse response, String targetView,
                               Map<String,Object> vmp){
        try {
            Template temp=builtConfiguration().getTemplate(targetView);
            response.setCharacterEncoding("utf-8");
            response.setContentType("text/html");
            PrintWriter out =response.getWriter();
            temp.process(vmp,out);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
