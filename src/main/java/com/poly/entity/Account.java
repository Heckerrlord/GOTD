package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Accounts")
public class Account implements Serializable {

	@Id
	@NotBlank(message = "Không được để trống")
	String username;
	@NotBlank(message = "Không được để trống")
	@Size(min = 6, max = 100, message = "Mật khẩu phải nhiều hơn 6 kí tự")
	String password;
	@NotBlank(message = "Không được để trống")
	String fullname;
	@NotBlank(message = "Không được để trống")
	@Email(message = "Email không đúng định dạng")
	String email;
	String SoDienThoai;
	String photo;
	String token;
	int TrangThai;
//	@JsonIgnore
//	@OneToMany(mappedBy = "account")
//	List<Order> orders;

	@JsonIgnore
	@OneToMany(mappedBy = "account", fetch = FetchType.EAGER)
	List<Authority> authorities;
}