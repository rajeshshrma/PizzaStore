package com.online.pizzastore.domain;

public class Cart {
	private int itemid;
	private String name;
	private int quantity;
	private int price;
	
	public Cart(int itemid, String name,int quantity, int price)
	{
		this.itemid=itemid;
		this.name=name;
		this.quantity=quantity;
		this.price=price *this.quantity;
	}
	
	public Cart(Item item,int quantity)
	{
		this.itemid=item.getItemid();
		this.name=item.getName();
		this.quantity=quantity;
		this.price=item.getPrice()* this.quantity;
	}

	public int getItemid() {
		return itemid;
	}

	public String getName() {
		return name;
	}

	public int getQuantity() {
		return quantity;
	}

	public int getPrice() {
		return price;
	}

}