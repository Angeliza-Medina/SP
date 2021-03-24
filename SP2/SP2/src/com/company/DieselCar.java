package com.company;

public class DieselCar extends Car{
   private boolean hasParticleFilter;
   private float kmPrL;

   public DieselCar(String regNum, String brand, String model, int year, int numOfDoors, boolean hasParticleFilter, float kmPrL) {
      super(regNum, brand, model, year, numOfDoors);
      this.hasParticleFilter = hasParticleFilter;
      this.kmPrL = kmPrL;
   }

   public boolean getHasParticleFilter() {
      return hasParticleFilter;
   }

   public void setHasParticleFilter(boolean hasParticleFilter) {
      this.hasParticleFilter = hasParticleFilter;
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
         greenOwnerTax = 330 + 130;
      }else if(kmPrL >= 15 && kmPrL < 20){
         greenOwnerTax = 1050 + 1390;
      }else if(kmPrL >= 10 && kmPrL < 15){
         greenOwnerTax = 2340 + 1850;
      }else if(kmPrL >= 5 && kmPrL < 10){
         greenOwnerTax = 5500 + 2770;
      }else if(kmPrL < 5){
         greenOwnerTax = 10470 + 15260;
      }

      if(!hasParticleFilter){
         greenOwnerTax += 1000;
      }

      return greenOwnerTax;
   }

}
