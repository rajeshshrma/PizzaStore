package com.online.pizzastore.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "topping_options")
public class ToppingOptions implements Comparable<ToppingOptions>{

	@Id
	@GeneratedValue
	@Column(name = "OPTIONID")
	private int optionId;

	@Column(name = "NAME")
	private String name;

	@Column(name = "PRICE")
	private int price;

	@Column(name = "DESCRIPTION")
	private String desc;

	@ManyToOne
	@JoinColumn(name = "toppingId")
	private Topping topping;

	public ToppingOptions() {

	}

	public ToppingOptions(int optionId, String name, int price, String desc,
			Topping topping) {
		this.optionId = optionId;
		this.name = name.trim();
		this.price = price;
		this.desc = desc;
		this.topping = topping;
	}

	public int getOptionId() {
		return optionId;
	}

	public void setOptionId(int optionId) {
		this.optionId = optionId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name.trim();
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Topping getTopping() {
		return topping;
	}

	public void setTopping(Topping topping) {
		this.topping = topping;
	}

	public int compareTo(ToppingOptions objToppingOptions) {
		return this.price - objToppingOptions.price;
	}

}
