package cn.edu.bzu.entity;

public class Commodity {
	/**
　　　　*下面这四个属性为数据库表中的四个属性
　　　　*/
     private int id;   
     private String name;
     private int amounts;
     private double prices;
     
     public int getId() {
         return id;
     }
     public void setId(int id) {
         this.id = id;
     }
     public String getName() {
         return name;
     }
     public void setName(String name) {
         this.name = name;
     }
     public int getAmounts() {
         return amounts;
     }
     public void setAmounts(int amounts) {
         this.amounts = amounts;
     }
     public double getPrices() {
         return prices;
     }
     public void setPrices(double prices) {
         this.prices = prices;
     }
     public Commodity(int id, String name, int amounts, double prices) {
         super();
         this.id = id;
         this.name = name;
         this.amounts = amounts;
         this.prices = prices;
     }
}
