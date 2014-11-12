package com.online.pizzastore.vo.customer.order;

import java.io.Serializable;
import java.util.Iterator;

import com.online.pizzastore.vo.ToppingOptions;

public class Topping implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1411669598090666969L;
	
	
	private int toppingId;
	private String toppingName;
	private int toppingOptionId;
	private String toppingOptionName;
	private int toppingOptionPrice;

	public Topping() {

	}

	public Topping(com.online.pizzastore.vo.Topping topping, int optionId) {
		this.toppingId = topping.getToppingId();
		this.toppingName = topping.getName();

		for (Iterator<ToppingOptions> iterator = topping.getToppingOptions()
				.iterator(); iterator.hasNext();) {
			ToppingOptions toppingOption = (ToppingOptions) iterator.next();
			if (toppingOption.getOptionId() == optionId) {
				this.toppingOptionId = toppingOption.getOptionId();
				this.toppingOptionName = toppingOption.getName();
				this.toppingOptionPrice = toppingOption.getPrice();
				break;
			}
		}

	}

	public Topping(int toppingId, String toppingName, int toppingOptionId,
			String toppingOptionName, int toppingOptionPrice) {
		this.toppingId = toppingId;
		this.toppingName = toppingName;
		this.toppingOptionId = toppingOptionId;
		this.toppingOptionName = toppingOptionName;
		this.toppingOptionPrice = toppingOptionPrice;
	}

	public int getToppingId() {
		return toppingId;
	}

	public void setToppingId(int toppingId) {
		this.toppingId = toppingId;
	}

	public String getToppingName() {
		return toppingName;
	}

	public void setToppingName(String toppingName) {
		this.toppingName = toppingName;
	}

	public int getToppingOptionId() {
		return toppingOptionId;
	}

	public void setToppingOptionId(int toppingOptionId) {
		this.toppingOptionId = toppingOptionId;
	}

	public String getToppingOptionName() {
		return toppingOptionName;
	}

	public void setToppingOptionName(String toppingOptionName) {
		this.toppingOptionName = toppingOptionName;
	}

	public int getToppingOptionPrice() {
		return toppingOptionPrice;
	}

	public void setToppingOptionPrice(int toppingOptionPrice) {
		this.toppingOptionPrice = toppingOptionPrice;
	}

	@Override
	public String toString() {
		return this.toppingId + ":" + this.toppingName + ":"
				+ this.toppingOptionId + ":" + this.toppingOptionName + ":"
				+ this.toppingOptionPrice;
	}
/*
	@Override
	public boolean equals(Object o) {
		if (o instanceof Topping) {
			Topping other = (Topping) o;
			return this.toppingName.equals(other.toppingName);
		}
		return false;
	}*/

}