package com.example.p3samlfetch;

import org.apache.catalina.Group;
import org.opensaml.saml2.core.Attribute;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.providers.ExpiringUsernameAuthenticationToken;
import org.springframework.security.saml.SAMLCredential;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.thymeleaf.util.StringUtils;

import java.util.List;

@Controller
public class IndexController
{
    @RequestMapping("/")
    public String index(ExpiringUsernameAuthenticationToken userToken, Model model)
    {
        SAMLCredential credential=(SAMLCredential) userToken.getCredentials();
        List<Attribute> attributes=credential.getAttributes();
        System.out.println("userToken.getName()"+userToken.getName());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        for(Attribute data:attributes)
        {
            System.out.println(data.getName() + "==" +credential.getAttributeAsString(data.getName()));

            if(!StringUtils.isEmpty(data.getName()))
            {
                switch(data.getName().trim())
                {
                    case "Email" :
                        model.addAttribute(data.getName(),credential.getAttributeAsString(data.getName()));
                        break;

                    case "Firstname" :
                        model.addAttribute(data.getName(),credential.getAttributeAsString(data.getName()));
                        break;
                    case "Lastname" :
                        model.addAttribute(data.getName(),credential.getAttributeAsString(data.getName()));
                        break;
                    case "Userlogin" :
                        model.addAttribute(data.getName(),credential.getAttributeAsString(data.getName()));
                        break;
                    case "Group" :

                   model.addAttribute(data.getName(),credential.getAttributeAsString(data.getName()));
                        break;
                    default:
                        break;
                }
            }
        }
        return "/index";
    }
}
