package com.sell.entity.usermanager;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.sell.entity.Cart;
import com.sell.entity.Item;
import com.sell.entity.Product;
import com.sun.xml.fastinfoset.algorithm.IEEE754FloatingPointEncodingAlgorithm;

public class Main {
    public static void main(String[] args) {
        SessionFactory factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();
       Users users = session.get(Users.class, 2);
       
       System.out.println(users.getUsername());
       for(Cart cart: users.getListCart()) {
    	   System.out.println("\t"+cart.getStatus());
    	   for(Item item :cart.getListItem()) {
    		   if(item.getId() == 1) {
    			   System.out.println("Da vao day");
    			   Item item2 = session.get(Item.class, 1);
    			   int count = item2.getNumberOfProduct();
    			   System.out.println(count);
    			   item2.setNumberOfProduct(++count);
    			   session.update(item2);
    			   session.beginTransaction().commit();
    		   }
    		   System.out.println("\t\tID: " + item.getId());
    		   System.out.println("\t\tTen san Pham: " +item.getProduct().getName());
    		   System.out.println("\t\tSo luong: "+item.getNumberOfProduct());
    		   System.out.println("\t\t-----------------");
    	   }
       }
       
    }
}
