package com.sell.entity.usermanager;

import java.util.List;

import javax.persistence.*;

import com.sell.entity.Cart;
import com.sell.entity.PersonOrder;

@Entity
@Table(name = "users")
public class Users {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column
	private String username, password;
	@Column
	private int status;
	@OneToOne
	@JoinColumn(name = "id_role")
	private Role id_role;
	@OneToOne(mappedBy = "users")
	Cart cart;
	@OneToOne(mappedBy = "user_id")
	UserProfile userProfile;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "users")
	List<PersonOrder> listPersonOrder;

	public Users(String username, String password) {
		this.username = username;
		this.password = password;
	}

	public Users(String username, String password, Role id_role) {
		this.username = username;
		this.password = password;
		this.id_role = id_role;
	}

	public UserProfile getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(UserProfile userProfile) {
		this.userProfile = userProfile;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "UsersDAO{" + "id=" + id + ", username='" + username + '\'' + ", password='" + password + '\''
				+ ", id_role=" + id_role + '}';
	}

	public Users() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Role getId_role() {
		return id_role;
	}

	public void setId_role(Role id_role) {
		this.id_role = id_role;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public List<PersonOrder> getListPersonOrder() {
		return listPersonOrder;
	}

	public void setListPersonOrder(List<PersonOrder> listPersonOrder) {
		this.listPersonOrder = listPersonOrder;
	}

}
