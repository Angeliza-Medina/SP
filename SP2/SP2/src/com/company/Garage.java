package com.company;
import java.util.ArrayList;

public class Garage {
   private String name;
   private ArrayList<Car> carsInGarage = new ArrayList<Car>();

   Garage(String name){
      this.name = name;
   }

   public String getName(){
      return name;
   }

   public void setName(String name){
      this.name = name;
   }

   public ArrayList<Car> getCarsInGarage(){
      return carsInGarage;
   }

   public void addCar(Car car){
      carsInGarage.add(car);
   }

   public double calculateGreenOwnerTaxForGarage(){
      double greenOwnerTaxForGarage = 0;

      for(Car car : carsInGarage){
         greenOwnerTaxForGarage += car.calculateGreenOwnerTax();
      }

      return greenOwnerTaxForGarage;
   }

   @Override
   public String toString(){
      return carsInGarage.toString();
   }

}
