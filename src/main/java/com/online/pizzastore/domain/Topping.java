package com.online.pizzastore.domain;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "topping")
public class Topping {

	@Id
	@GeneratedValue
	@Column(name = "TOPPINGID")
	private int toppingId;

	@Column(name = "NAME")
	private String name;

	@Column(name = "PRODUCTID")
	private int productid;

	@Column(name = "DESCRIPTION")
	private String desc;

	@OneToMany(mappedBy = "topping")
	private Set<ToppingOptions> toppingOptions;

	public Topping() {

	}

	public Topping(int toppingId, String name, int productid, String desc,
			Set<ToppingOptions> toppingOptions) {
		this.toppingId = toppingId;
		this.name = name;
		this.productid = productid;
		this.desc = desc;
		this.toppingOptions = toppingOptions;
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
		this.name = name;
	}

	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
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

}
