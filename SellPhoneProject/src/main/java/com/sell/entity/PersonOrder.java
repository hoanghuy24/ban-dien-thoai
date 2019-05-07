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
	private String status;
	@Column
	private String phone;
	@Column(name = "address_order")
	private String addressOrder;
	@Column(name = "other_information")
	private String otherInformation;
	@Column(name = "numberOfProduct")
	private int numberOfProduct;
	@Column
	private int price;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_product")
	private Product product;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_user")
	private Users users;

	public PersonOrder(int sex, String fullName, String status, String phone, String addressOrder,
			String otherInformation, int numberOfProduct, int price, Product product, Users users) {
		super();
		this.sex = sex;
		this.fullName = fullName;
		this.status = status;
		this.phone = phone;
		this.addressOrder = addressOrder;
		this.otherInformation = otherInformation;
		this.numberOfProduct = numberOfProduct;
		this.price = price;
		this.product = product;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public int getNumberOfProduct() {
		return numberOfProduct;
	}

	public void setNumberOfProduct(int numberOfProduct) {
		this.numberOfProduct = numberOfProduct;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
