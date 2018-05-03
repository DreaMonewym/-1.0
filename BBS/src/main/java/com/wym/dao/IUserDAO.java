package com.wym.dao;

import com.wym.po.Bbsuser;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface IUserDAO extends CrudRepository<Bbsuser,Integer> {
    @Query("select c from Bbsuser c where username=:u and password=:p")
    Bbsuser login(@Param("u")String username,@Param("p") String password);

    Bbsuser save(Bbsuser user);

    @Query("select c from Bbsuser c where userid=:id")
    Bbsuser getPic(@Param("id")Integer id);

}

