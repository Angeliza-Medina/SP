package com.company;

public class GazolineCar extends Car{
   private float octaneRating;
   private float kmPrL;

   public GazolineCar(String regNum, String brand, String model, int year, int numOfDoors, float octaneRating, float kmPrL) {
      super(regNum, brand, model, year, numOfDoors);
      this.octaneRating = octaneRating;
      this.kmPrL = kmPrL;
   }

   public float getOctaneRating() {
      return octaneRating;
   }

   public void setOctaneRating(float octaneRating) {
      this.octaneRating = octaneRating;
   }

   public float getKmPrL() {
      return kmPrL;
   }

   public void setKmPrL(float kmPrL) {
      this.kmPrL = kmPrL;
   }

   @Override
   public String toString(){
      return "\n" + "Reg. num: " + getRegNum() + "\nBrand: " + getBrand() + "\nModel: " + getModel() + "\n";
   }

   public double calculateGreenOwnerTax(){
      double greenOwnerTax = 0;

      if(kmPrL >= 20 && kmPrL < 50){
         greenOwnerTax = 330;
      }else if(kmPrL >= 15 && kmPrL < 20){
         greenOwnerTax = 1050;
      }else if(kmPrL >= 10 && kmPrL < 15){
         greenOwnerTax = 2340;
      }else if(kmPrL >= 5 && kmPrL < 10){
         greenOwnerTax = 5500;
      }else if(kmPrL < 5){
         greenOwnerTax = 10470;
      }

      return greenOwnerTax;
   }

}

