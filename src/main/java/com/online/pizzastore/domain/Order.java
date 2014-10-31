package com.online.pizzastore.domain;


import java.io.Serializable;

public class Order implements Serializable
{
    static final long serialVersionUID = 7103954158550675528L;
    
	private String name;
	private String address;
	private String phone;
	private boolean mushrooms;
	private boolean beef;
	private boolean sausage;
	private String size;

	public double getPrice()
	{
		// calculate the price
		  double price = 18.95;
		  if ( getSize().equalsIgnoreCase ( "Small" ) )
			  price = 10.95;
		  else if ( getSize().equalsIgnoreCase ( "Medium" ) )
			  price = 14.95;
			
		  if ( isBeef() )
			  price += 1;
			
		  if ( isMushrooms() )
			  price += 1;
			
		  if ( isSausage() )
			  price += 1;
		
		return price;
	}

	public boolean isBeef()
	{
		return beef;
	}

	public boolean isMushrooms()
	{
		return mushrooms;
	}

	public boolean isSausage()
	{
		return sausage;
	}

	public String getSize()
	{
		return size;
	}

	public void setBeef(boolean b)
	{
		beef = b;
	}

	public void setMushrooms(boolean b)
	{
		mushrooms = b;
	}

	public void setSausage(boolean b)
	{
		sausage = b;
	}

	public void setSize(String string)
	{
		size = string;
	}

	public String getAddress()
	{
		return address;
	}

	public String getName()
	{
		return name;
	}

	public String getPhone()
	{
		return phone;
	}

	public void setAddress(String string)
	{
		address = string;
	}

	public void setName(String string)
	{
		name = string;
	}

	public void setPhone(String string)
	{
		phone = string;
	}	
}
