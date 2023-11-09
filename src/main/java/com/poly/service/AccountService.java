package com.poly.service;

import java.util.List;

import com.poly.entity.Account;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;



public interface 	AccountService {
	Account findById(String username);


	List<Account> findAll();

	List<Account> getAdministrators();

	Account create(Account account);

	Account update(Account account);

	void delete(String username);

	void loginFromOAuth2(OAuth2AuthenticationToken oauth2);

	void updateToken(String token, String email) throws Exception;

	Account getByToken(String token);

	void updatePassword(Account entity, String newPassword);

	void changePassword(Account entity, String newPassword);
}
