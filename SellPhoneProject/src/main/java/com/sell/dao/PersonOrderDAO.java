package com.sell.dao;

import java.util.List;

import com.sell.entity.PersonOrder;

public interface PersonOrderDAO {

	public List<PersonOrder> getListPersonOrder();
	public List<PersonOrder> getListPersonOrderCancel();
	
}
