package com.learning.generate.excel.persistence.entities;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity(name = "Product")
@Table(name= "product", schema = "public")
public class Product implements Serializable {

	private static final long serialVersionUID = 1L;
	
//	CREATE SEQUENCE IF NOT EXISTS product_id_seq
//	INCREMENT BY 1
//	MINVALUE 1
//	MAXVALUE 987654321
//	START WITH 1
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "generator_product_id_seq")
	@SequenceGenerator(name="generator_product_id_seq", sequenceName = "product_id_seq", schema = "public", allocationSize = 1)
	@Column(name="product_id", unique = true, nullable = false)
	private Long productId;
	
	@Column(name="product_name")
	private String productName;
	
	@Column(name="product_photo")
	private String productPhoto;
	
	@Column(name="product_code")
	private String productCode;
	
	@Column(name="product_price")
	private BigDecimal productPrice;
	
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id", nullable = false)
    private Category category;
	
	@Column(name="created_by")
	@CreatedBy
	private Long createdBy;
	
	@Column(name="created_on", columnDefinition = "DATE")
	@CreatedDate
	private Date createdOn;
	
	@Column(name="last_modified_by")
	@LastModifiedBy
	private Long lastModifiedBy;
	
	@Column(name="last_modified_on", columnDefinition = "DATE")
	@LastModifiedDate
	private Date lastModifiedOn;
	
	@Column(name="is_deleted")
	private Boolean isDeleted;
}
