#include<SPI.h>                             //Library for SPI 

void setup (void){

  Serial.begin(115200);                   //Starts Serial Communication at Baud Rate 115200 
  

  SPI.begin();                            //Begins the SPI commnuication

  SPI.setClockDivider(SPI_CLOCK_DIV8);    //Sets clock for SPI communication at 8 (16/8=2Mhz)

  digitalWrite(SS,HIGH);                  // Setting SlaveSelect as HIGH (So master doesnt connnect with slave)

}

void loop(void){

  byte Mastersend,Mastereceive;          

  digitalWrite(SS, LOW);                  //Starts communication with Slave connected to master

  `

  Mastersend = 0b11011101;                            

  Mastereceive=SPI.transfer(Mastersend); //Send the mastersend value to slave also receives value from slave
  delay(1);

}