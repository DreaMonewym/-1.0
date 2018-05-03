package com.wym.dao;

import com.wym.po.Article;
import com.wym.po.Bbsuser;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.criteria.CriteriaBuilder;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ArticleDAOImpl {
    @PersistenceContext
    private EntityManager entityManager;
    public Map<String,Object> findArticleByid(Integer id){
        Map<String,Object> map=new HashMap<>();
        StoredProcedureQuery sp=entityManager.createStoredProcedureQuery("p_3");
        sp.registerStoredProcedureParameter(1,Integer.class, ParameterMode.IN);
        sp.registerStoredProcedureParameter(2,String.class,ParameterMode.OUT);

        sp.setParameter(1,id);
        sp.execute();//执行sql

        List<Object[]> List=sp.getResultList();
        List<Article> articleList=new ArrayList<>();
        for(Object[] o :List){
            Article article=new Article();
            article.setId(Integer.parseInt(o[0].toString()));
            article.setRootid(Integer.parseInt(o[1].toString()));
            article.setTitle(o[2].toString());
            article.setContent(o[3].toString());
            Bbsuser bbsuser=new Bbsuser();
            bbsuser.setUserid(Integer.parseInt(o[4].toString()));
            article.setUser(bbsuser);
            try {
                java.util.Date date=new SimpleDateFormat("yyyy-MM-dd").parse(o[5].toString());
                article.setDatetime(new Date(date.getTime()));//sql的Date
            } catch (ParseException e) {
                e.printStackTrace();
            }

            articleList.add(article);
        }

        map.put("list",articleList);
        map.put("title",sp.getOutputParameterValue(2));
        return map;
    }
}
