package com.sell.phone.controller.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager")
public class ManagerController {
    @RequestMapping("/user")
    public String user(){
        return "view/admin/manager/user";
    }
}
