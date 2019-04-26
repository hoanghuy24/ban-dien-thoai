package com.sell.dao;

import com.sell.entity.Item;

public interface BuyProductDAO {

	public void addProductInCart(Item item);

	public void setNumberOfProduct(Item item, int numberOfProduct);

	public void removeProductInItem(Item item);

}
