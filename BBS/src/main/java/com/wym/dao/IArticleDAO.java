package com.wym.dao;

import com.wym.po.Article;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

//import com.weikun.vo.PageBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import javax.persistence.ManyToOne;

public interface IArticleDAO extends CrudRepository<Article,Integer> {

    @Query("select c from Article  c where rootid =:rid ")
    Page<Article> queryAll(Pageable pageable, @Param("rid") Integer id);
    @Modifying//删除主贴
    @Query("delete from Article where id=:id or rootid=:rid")
    public int delete(@Param("id") Integer id,@Param("rid") Integer rid);

    @Modifying//删除从贴
    @Query("delete from Article where id=:id and rootid=:rid")
    public int deletec(@Param("id") Integer id,@Param("rid") Integer rid);
    Article save(Article article);

}
