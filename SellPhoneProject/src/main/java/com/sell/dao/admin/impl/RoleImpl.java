package com.sell.dao.admin.impl;

import com.sell.dao.admin.RoleDAO;
import com.sell.entity.usermanager.Role;
import com.sell.hibernate.HibernateUI;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

@Component
public class RoleImpl  implements RoleDAO {
    SessionFactory factory = HibernateUI.getSessionFactory();
    public Role getRole(int id) {
        Session session = factory.openSession();
        return  session.find(Role.class, id);
    }
}
