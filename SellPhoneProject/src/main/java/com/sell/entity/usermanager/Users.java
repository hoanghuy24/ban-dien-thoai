package com.sell.entity.usermanager;

import com.sell.entity.Cart;
import com.sell.entity.PersonOrder;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
@Table(name = "users")
public class Users {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Length(max = 20, min = 5, message = "TĂªn tĂ i khoáº£n  pháº£i lá»›n hÆ¡n 5 kĂ½ tá»± vĂ  nhá»� hÆ¡n 20 kĂ½ tá»±")
	@Column
	private String username;
	@NotNull(message = "KhĂ´ng Ä‘Æ°á»£c rá»—ng")
	@NotEmpty(message = "KhĂ´ng Ä‘Æ°á»£c Ä‘á»ƒ trá»‘ng")
	@Column
	private String password;
	@Column
	private int status;
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_role")
	private Role id_role;
	@OneToOne(mappedBy = "users", fetch = FetchType.LAZY)
	Cart cart;
	@OneToOne(mappedBy = "user_id")
	private UserProfile userProfile;
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name="id_user")
	List<PersonOrder> listPersonOrder;

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
		return "Users{" + "id=" + id + ", username='" + username + '\'' + ", password='" + password + '\'' + ", status="
				+ status + ", id_role=" + id_role + ", cart=" + cart + ", userProfile=" + userProfile
				+ ", listPersonOrder=" + listPersonOrder + '}';
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

	public Users() {
	}

	public Users(String username, String password) {
		this.username = username;
		this.password = password;
	}

	public Users(String username, String password, Role id_role) {
		this.username = username;
		this.password = password;
		this.id_role = id_role;
	}

	public Users(UserProfile userProfile) {
		this.userProfile = userProfile;
	}
}
