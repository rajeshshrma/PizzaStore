package com.online.pizzastore.vo;

public class Cart {
	private int productid;
	private String name;
	private int quantity;
	private int price;
	
	public Cart(int productid, String name,int quantity, int price)
	{
		//Commented by Amit Kumar Kaushik on 11/12.
		this.productid=productid;
		this.name=name;
		this.quantity=quantity;
		this.price=price *this.quantity;
	}
	
	public Cart(Product product,int quantity)
	{
		this.productid=product.getProductId();
		this.name=product.getName();
		this.quantity=quantity;
		this.price=product.getPrice()* this.quantity;
	}

	public int getProductid() {
		return productid;
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