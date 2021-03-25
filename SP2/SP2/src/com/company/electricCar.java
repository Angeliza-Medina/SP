package com.company;

public class electricCar extends Car{
   private int batteryCapKWh;
   private float maxKm;
   private float whPrKm;

   public electricCar(String regNum, String brand, String model, int year, int numOfDoors, int batteryCapKWh, float maxKm, float whPrKm) {
      super(regNum, brand, model, year, numOfDoors);
      this.batteryCapKWh = batteryCapKWh;
      this.maxKm = maxKm;
      this.whPrKm = whPrKm;
   }


   public int getBatteryCapKWh() {
      return batteryCapKWh;
   }

   public void setBatteryCapKWh(int batteryCapKWh) {
      this.batteryCapKWh = batteryCapKWh;
   }

   public float getMaxKm() {
      return maxKm;
   }

   public void setMaxKm(float maxKm) {
      this.maxKm = maxKm;
   }

   public float getWhPrKm() {
      return whPrKm;
   }

   public void setWhPrKm(float whPrKm) {
      this.whPrKm = whPrKm;
   }

   @Override
   public String toString(){
      return "\n" + "Reg. num: " + getRegNum() + "\nBrand: " + getBrand() + "\nModel: " + getModel() + "\n";
   }

   public double calculateGreenOwnerTax(){
      double greenOwerTax = 0;
      double kmPrL = 100 / (whPrKm / 91.25);

      if(kmPrL >= 20 && kmPrL < 50 || kmPrL > 50){
         greenOwerTax = 330;
      }else if(kmPrL >= 15 && kmPrL < 20){
         greenOwerTax = 1050;
      }else if(kmPrL >= 10 && kmPrL < 15){
         greenOwerTax = 2340;
      }else if(kmPrL >= 5 && kmPrL < 10){
         greenOwerTax = 5500;
      }else if(kmPrL < 5){
         greenOwerTax = 10470;
      }

      return greenOwerTax;
   }

}
