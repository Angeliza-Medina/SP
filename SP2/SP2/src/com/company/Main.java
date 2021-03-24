package com.company;

public class Main{

   public static void main(String[] args){
      Garage garage = new Garage("Garage1");
      GazolineCar gazolineCar1 = new GazolineCar("ABC12", "Nissan", "Nissan LEAF", 2020,
         4, 92, 16.1f);
      DieselCar dieselCar1 = new DieselCar("DEF34", "Toyota", "Toyota Corolla", 2018,
         4, true, 15.7f);
      electricCar electricCar1 = new electricCar("GHI56", "Subaru", "BRZ tS", 2020, 2,
         80, 216, 159.6f);

      garage.addCar(gazolineCar1);
      garage.addCar(dieselCar1);
      garage.addCar(electricCar1);

      System.out.println(garage.getCarsInGarage());
      System.out.println("Grøn ejerafgift er: " + garage.calculateGreenOwnerTaxForGarage() + " kr.");
   }

}