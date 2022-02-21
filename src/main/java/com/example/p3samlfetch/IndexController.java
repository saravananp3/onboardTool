package com.example.p3samlfetch;

import com.example.p3samlfetch.entity.user_data;
import com.example.p3samlfetch.repository.user_repository;
import com.example.p3samlfetch.service.user_service;
import org.opensaml.saml2.core.Attribute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.providers.ExpiringUsernameAuthenticationToken;
import org.springframework.security.saml.SAMLCredential;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.thymeleaf.util.StringUtils;

import java.util.List;
import java.util.Objects;

@Controller
public class IndexController
{
    @Autowired
private user_service s;
    @Autowired

private user_repository repository;
    @RequestMapping("/")
    public String index(ExpiringUsernameAuthenticationToken userToken, Model model)
    {
        SAMLCredential credential=(SAMLCredential) userToken.getCredentials();
        List<Attribute> attributes=credential.getAttributes();
        System.out.println("userToken.getName()"+userToken.getName());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        user_data u=new user_data();
        for(Attribute data:attributes)
        {
            System.out.println(data.getName() + "==" +credential.getAttributeAsString(data.getName()));

            if(!StringUtils.isEmpty(data.getName()))
            {

                switch(data.getName().trim())
                {
                    case "Email" :

                        model.addAttribute(data.getName(),credential.getAttributeAsString(data.getName()));
                    //    u.setUemail(credential.getAttributeAsString(data.getName()));


                        break;

                    case "Firstname" :
                        model.addAttribute(data.getName(),credential.getAttributeAsString(data.getName()));
                        u.setUfname(credential.getAttributeAsString(data.getName()));
                        //s.saveuser_data(u);
                        break;
                    case "Lastname" :
                        model.addAttribute(data.getName(),credential.getAttributeAsString(data.getName()));
                        u.setUlname(credential.getAttributeAsString(data.getName()));
                        break;
                    case "Userlogin" :
                        model.addAttribute(data.getName(),credential.getAttributeAsString(data.getName()));
                        u.setUemail(credential.getAttributeAsString(data.getName()));
                        break;
                    case "Group" :

                   model.addAttribute(data.getName(),credential.getAttributeAsString(data.getName()));
                        u.setUgroup(credential.getAttributeAsString(data.getName()));
                        break;

                    default:
                        break;

                }

            }

        }
        user_data uname=repository.findByUfname(u.getUfname());


if(Objects.isNull(uname))
{
    s.saveuser_data(u);

}

else {
s.updateuserdata(u);
}
        return "/index";
    }
}
