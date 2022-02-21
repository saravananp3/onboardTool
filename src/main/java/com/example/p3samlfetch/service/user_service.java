package com.example.p3samlfetch.service;

import com.example.p3samlfetch.entity.user_data;
import com.example.p3samlfetch.repository.user_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service

public class user_service {
@Autowired
private user_repository repository;
public user_data saveuser_data(user_data u)
{
return repository.save(u);
}

    public user_data updateuserdata(user_data u){

        user_data existinguser=repository.findByUfname(u.getUfname());
        if(existinguser.equals(null))
        {
            return null;
        }
        else
        {
        existinguser.setUfname(u.getUfname());
        existinguser.setUlname(u.getUlname());
        existinguser.setUemail(u.getUemail());
        existinguser.setUgroup(u.getUgroup());
        return repository.save(existinguser);
        }
    }

}
