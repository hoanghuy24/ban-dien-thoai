package com.sell.dao;

import com.sell.entity.Cart;
import com.sell.entity.Product;

public interface ItemDAO {

	public boolean addProduct(Product product, Cart cart, int quentity);
	public void deleteProduct(Product product, Cart cart);
	public boolean updateQuentity(Product product, Cart cart, int quentity);
	
}
