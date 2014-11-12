package com.online.pizzastore.vo.customer.order;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Product implements Serializable {

	private static final long serialVersionUID = -6469941409156730872L;

	private int productId;
	private String productName;
	private int quantity;
	private int productPrice;
	private Set<Topping> topping;

	public Product() {

	}

	public Product(com.online.pizzastore.vo.Product product) {
		this.productId = product.getProductId();
		this.productName = product.getName().trim();
		this.productPrice = product.getPrice();
		this.topping = new HashSet<Topping>();

	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName.trim();
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public Set<Topping> getTopping() {
		return topping;
	}

	public void setTopping(Set<Topping> topping) {
		this.topping = topping;
	}

	public void setToppingCart(Topping objTopping) {

		for (Iterator<Topping> iterator = topping.iterator(); iterator
				.hasNext();) {
			Topping tmpTopping = (Topping) iterator.next();

			if (tmpTopping.getToppingName().equals(objTopping.getToppingName())) {
				topping.remove(tmpTopping);
				break;
			}
		}

		if (objTopping.getToppingOptionPrice() > 0) {
			topping.add(objTopping);
		}
	}

	@Override
	public String toString() {
		return this.productId + ":" + this.productName + ":"
				+ this.productPrice + "\n" + this.topping;
	}

}