package com.learning.generate.excel.persistence.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.generate.excel.persistence.entities.Product;
import com.learning.generate.excel.services.entities.custommapping.ProductSpesific;

@Service
public class ProductDaoServiceImpl implements ProductDaoService {
 
	@Autowired
	private ProductRepository repository;
	@Autowired
	private EntityManager em;
	
	@Override
	public List<Product> findProductByFilter(String startDate, String EndDate) {
		return repository.findProductByFilter(startDate, EndDate);
	}

	@Override
	public List<ProductSpesific> findProductByFilter(String startDate, String endDate, String category) {
		String sql = "SELECT p.product_id, p.created_on, p.product_name, p.product_code, c.category_name, p.product_price "
				+ "FROM product p JOIN category c ON p.category_id = c.category_id "
				+ "WHERE c.category_name LIKE :category "
				+ "AND to_char(p.created_on, 'yyyy-MM-dd') >= :startDate "
				+ "AND to_char(p.created_on, 'yyyy-MM-dd') <= :endDate";
		Query query = em.createNativeQuery(sql, ProductSpesific.class);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		query.setParameter("category", category);
		
		return query.getResultList();
	}
	
	
	
}
