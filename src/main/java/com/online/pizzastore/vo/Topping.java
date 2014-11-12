package com.online.pizzastore.vo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

@Entity
@Table(name = "topping")
public class Topping{

	@Id
	@GeneratedValue
	@Column(name = "TOPPINGID")
	private int toppingId;

	@Column(name = "NAME")
	private String name;

	@Column(name = "DESCRIPTION")
	private String desc;
	
	@ManyToMany(mappedBy = "toppings")
    private Set<Product> products = new HashSet<Product>();

	@OneToMany(mappedBy = "topping")
	@OrderBy("price")
	private Set<ToppingOptions> toppingOptions;

	public Topping() {

	}

	public Topping(int toppingId, String name, String desc,
			Set<ToppingOptions> toppingOptions) {
		this.toppingId = toppingId;
		this.name = name.trim();
		this.desc = desc;
		this.toppingOptions =  toppingOptions;
	}

	public int getToppingId() {
		return toppingId;
	}

	public void setToppingId(int toppingId) {
		this.toppingId = toppingId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name.trim();
	}

	
	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Set<ToppingOptions> getToppingOptions() {
		return toppingOptions;
	}

	public void setToppingOptions(Set<ToppingOptions> toppingOptions) {
		this.toppingOptions = toppingOptions;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

}
