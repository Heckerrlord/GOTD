package com.poly.dao;

import java.util.List;

import com.poly.entity.Account;

import com.poly.entity.phu.DiaChi;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



public interface AccountDAO extends JpaRepository<Account, String> {
	@Query("SELECT DISTINCT ar.account FROM Authority  ar WHERE ar.role.id IN('STAF','DRIF')")
	List<Account> getAdministrators();

	@Query("SELECT a FROM Account a WHERE a.username =?1 and a.password=?2")
	Account getAccount(String username, String password);


	// Phuc vu viec gui mail
	@Query("SELECT a FROM Account a WHERE a.email=?1")
	public Account findByEmail(String email);

	@Query("SELECT a FROM Account a WHERE a.token=?1")
	public Account findByToken(String token);

	@Query("SELECT a FROM Account a WHERE a.username=?1")
	Account findByUsername(String username);
//	@Query(value = "SELECT count(a.username) FROM Accounts a", nativeQuery = true)
//	Integer countAllAccount();


}
