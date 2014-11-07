package com.online.pizzastore.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Product {

	@Id
	@GeneratedValue
	private int productid;

	@Column(name = "NAME")
	private String name;

	@Column(name = "PRICE")
	private int price;

	@Column(name = "DESCRIPTION")
	private String description;

	public static Product getInstance(int productid, String name, String description,
			int price) {

		Product product = new Product();
		product.setProductid(productid);
		product.setName(name);
		product.setPrice(price);
		product.setDescription(description);

		return product;
	}

	/**
	 * @return the itemid
	 */
	public int getProductid() {
		return productid;
	}

	/**
	 * @param itemid
	 *            the itemid to set
	 */
	public void setProductid(int productid) {
		this.productid = productid;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the price
	 */
	public int getPrice() {
		return price;
	}

	/**
	 * @param price
	 *            the price to set
	 */
	public void setPrice(int price) {
		this.price = price;
	}

}