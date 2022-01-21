package com.learning.generate.excel.persistence.services;

import java.util.List;

import com.learning.generate.excel.persistence.entities.Product;
import com.learning.generate.excel.services.entities.custommapping.ProductSpesific;

public interface ProductDaoService {

	List<Product> findProductByFilter(String startDate, String EndDate);
	List<ProductSpesific> findProductByFilter(String startDate, String endDate, String category);
}
