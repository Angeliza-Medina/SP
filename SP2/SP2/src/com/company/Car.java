package com.company;

public abstract class Car {
   private String regNum;
   private String brand;
   private String model;
   private int year;
   private int numOfDoors;

   public Car(String regNum, String brand, String model, int year, int numOfDoors) {
      this.regNum = regNum;
      this.brand = brand;
      this.model = model;
      this.year = year;
      this.numOfDoors = numOfDoors;
   }

   public String getRegNum() {
      return regNum;
   }

   public void setRegNum(String regNum) {
      this.regNum = regNum;
   }

   public String getBrand() {
      return brand;
   }

   public void setBrand(String brand) {
      this.brand = brand;
   }

   public String getModel() {
      return model;
   }

   public void setModel(String model) {
      this.model = model;
   }

   public int getYear() {
      return year;
   }

   public void setYear(int year) {
      this.year = year;
   }

   public int getNumOfDoors() {
      return numOfDoors;
   }

   public void setNumOfDoors(int numOfDoors) {
      this.numOfDoors = numOfDoors;
   }

   public abstract double calculateGreenOwnerTax();
}
