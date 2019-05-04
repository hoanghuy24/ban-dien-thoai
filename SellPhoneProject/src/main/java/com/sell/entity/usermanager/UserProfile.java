package com.sell.entity.usermanager;

import javax.persistence.*;

@Entity
@Table(name = "user_profile")
public class UserProfile {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;
	@Column(name = "date")
	private String date;
	@Column(name = "other_detail")
	private String otherDetail;
	@Column
	private String avatar;
	@OneToOne
	@JoinColumn(name = "id_user")
	private Users user_id;
	@Column
	private String email;
	@Column
	private String address;
	@Column
	private String city;
	@Column
	private String country;
	@Column(name = "zip_code")
	private String zipCode;
	@Column(name = "about_me")
	private String aboutMe;

	public Users getUser_id() {
		return user_id;
	}

	public void setUser_id(Users user_id) {
		this.user_id = user_id;
	}

	public String getAvatar() {
		return avatar;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}


	@Override
	public String toString() {
		return "UserProfile{" + "id=" + id + ", firstName='" + firstName + '\'' + ", lastName='" + lastName + '\''
				+ ", date='" + date + '\'' + ", otherDetail='" + otherDetail + '\'' + ", avatar='" + avatar + '\''
				+ ", user_id=" + user_id + ", email='" + email + '\'' + ", address='" + address + '\'' + ", city='" + city
				+ '\'' + ", country='" + country + '\'' + ", zipCode='" + zipCode + '\'' + ", aboutMe='" + aboutMe
				+ '\'' + '}';
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getOtherDetail() {
		return otherDetail;
	}

	public void setOtherDetail(String otherDetail) {
		this.otherDetail = otherDetail;
	}

	public UserProfile() {
	}

	public UserProfile(String firstName, String lastName, String date, String otherDetail, Users user_id) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.date = date;
		this.otherDetail = otherDetail;
		this.user_id = user_id;
	}

}
