package com.learning.generate.excel.persistence.services;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.learning.generate.excel.persistence.entities.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

	
	@Query(value = "SELECT * FROM product p JOIN category c ON p.category_id = c.category_id "
			+ "WHERE p.is_deleted = false "
			+ "AND to_char(p.created_on, 'yyyy-MM-dd') >= :startDate "
			+ "AND to_char(p.created_on, 'yyyy-MM-dd') <= :endDate", nativeQuery = true)
	List<Product> findProductByFilter(@Param("startDate")String startDate, @Param("endDate")String endDate);
	
	@Query(value = "SELECT COUNT(1) FROM product p JOIN category c ON p.category_id = c.category_id "
			+ "WHERE c.category_name = :category "
			+ "AND p.is_deleted = false "
			+ "AND to_char(p.created_on, 'yyyy-MM-dd') >= :startDate "
			+ "AND to_char(p.created_on, 'yyyy-MM-dd') <= :endDate", nativeQuery = true)
	String getTotalData(@Param("startDate")String startDate, @Param("endDate")String endDate, 
			@Param("category")String category);
}
