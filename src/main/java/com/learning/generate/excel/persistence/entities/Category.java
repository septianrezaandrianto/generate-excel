package com.learning.generate.excel.persistence.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Table(name="category", schema = "public")
@EntityListeners(AuditingEntityListener.class)
public class Category implements Serializable {

	private static final long serialVersionUID = 1L;
	
//	CREATE SEQUENCE IF NOT EXISTS category_id_seq
//	INCREMENT BY 1
//	MINVALUE 1
//	MAXVALUE 987654321
//	START WITH 1
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "generator_category_id_seq")
	@SequenceGenerator(name="generator_category_id_seq", sequenceName = "category_id_seq", schema = "public", allocationSize = 1)
	@Column(name="category_id", unique = true, nullable = false)
	private Long categoryId;
	
	@Column(name="category_name")
	private String categoryName;
	
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
