package com.wym.service;

import com.wym.dao.ArticleDAOImpl;
import com.wym.dao.IArticleDAO;
import com.wym.po.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.PersistenceContext;
import java.util.Map;

@Service
@Transactional
public class ArticleServiceImpl {
    @Autowired
    private IArticleDAO dao;
    @Autowired
    private ArticleDAOImpl adao;

    public Page<Article> queryAll(Pageable pageable, Integer id){
        return dao.queryAll(pageable,id);
    }
    public void delete(Integer id){
        dao.delete(id,id);//删主贴
    }
    public void deletec(Integer id,Integer rootid){
        dao.deletec(id,rootid);//删从贴
    }
    public Map<String,Object> findArticleByid(Integer id){
        return adao.findArticleByid(id);
    }
    public void save(Article article){
        dao.save(article);
    }
}


