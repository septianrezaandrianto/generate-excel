package com.learning.generate.excel.services.entities.custommapping;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EntityResult;
import javax.persistence.FieldResult;
import javax.persistence.Id;
import javax.persistence.SqlResultSetMapping;

import lombok.Data;

@Data
@Entity
@SqlResultSetMapping(name= "ProductSpesific", entities = {
		@EntityResult(entityClass = ProductSpesific.class, fields = {
				@FieldResult(name="productId", column = "product_id"),
				@FieldResult(name="createdOn", column = "created_on"),
				@FieldResult(name="productName", column = "product_name"),
				@FieldResult(name="categoryName", column = "category_name"),
				@FieldResult(name="productPrice", column = "product_price"),
		})
})
public class ProductSpesific {
	
	@Id
	private String productId;
	private Date createdOn;
	private String productName;
	private String productCode;
	private String categoryName;
	private BigDecimal productPrice;

}
