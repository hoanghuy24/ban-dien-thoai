package com.sell.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sell.entity.usermanager.Users;

@Entity
@Table(name = "person_order")
public class PersonOrder {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "sex")
	private int sex;
	@Column(name = "full_name")
	private String fullName;
	
	@Column
	private String phone;
	@Column(name = "address_order")
	private String addressOrder;
	@Column(name = "other_information")
	private String otherInformation;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="id_item")
	private Item item;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="id_user")
	private Users users;

	public PersonOrder(int sex, String fullName, String phone, String addressOrder, String otherInformation, Item item,
			Users users) {
		super();
		this.sex = sex;
		this.fullName = fullName;
		this.phone = phone;
		this.addressOrder = addressOrder;
		this.otherInformation = otherInformation;
		this.item = item;
		this.users = users;
	}

	public PersonOrder() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddressOrder() {
		return addressOrder;
	}

	public void setAddressOrder(String addressOrder) {
		this.addressOrder = addressOrder;
	}

	public String getOtherInformation() {
		return otherInformation;
	}

	public void setOtherInformation(String otherInformation) {
		this.otherInformation = otherInformation;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

}
