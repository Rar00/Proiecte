//Once the wiring is completed, you can start programming.
//
//
//How  to work with AT commands.?


//#include <SoftwareSerial.h> 
//
//SoftwareSerial  A6MODULE(2,3);
//
//void setup() {
//  // put your setup code here, to run once:
//  Serial.begin(9600);
//delay(1000);
//  A6MODULE.begin(9600);
//delay(1000);
//}
//
//void  loop() {
// 
// while(A6MODULE.available()){
//  Serial.write(A6MODULE.read());
//  }
//
//  
// while(Serial.available()){
//  A6MODULE.write(Serial.read());
//  }
//
//}
//
//After Uploading codes, run the serial monitor.
//
//Now type  AT and press enter. If all the things are in order, Serial monitor will say “OK”
//
//HOW  TO CALL?
//ATD command is used for dial a phone call.
//
//Eg: Type ATD+123456789  then enter (your phone number)  ATD+40729364858
//
// HOW TO SEND SMS?
//Type AT+CMGF = 1  then  enter “ Answer should be OK”
//
//Then Type AT+CMGS = “+123456786” then enter  (your phone number) 
//
//AT+CMGF = 1
//AT+CMGS ="+40729364858"
//






#include <SoftwareSerial.h>

//Create software serial object to communicate with A6
SoftwareSerial mySerial(3, 2); //A6 Tx & Rx is connected to Arduino #3 & #2

void setup()
{
  //Begin serial communication with Arduino and Arduino IDE (Serial Monitor)
  Serial.begin(9600);
  //Begin serial communication with Arduino and A6
  mySerial.begin(9600);  
  mySerial.println("AT+CFUN=1.1");
  updateSerial();

///////////Testing
//  mySerial.println("AT");//Once the handshake test is successful, it will back to OK
//  updateSerial();
//  delay(1000);
//  mySerial.println("AT+QBAND=7");
//  updateSerial();
//  mySerial.println("AT+CSQ"); //Signal quality test, value range is 0-31 , 31 is the best
//  updateSerial();
//  delay(1000);
//  mySerial.println("AT+CCID"); //Read SIM information to confirm whether the SIM is plugged
//  updateSerial();
//  delay(1000);
//  mySerial.println("AT+CREG?"); //Check whether it has registered in the network
//  updateSerial();
//  delay(1000);
//  mySerial.println("ATI"); // GET the module and revision
//  updateSerial();
//  mySerial.println("AT+COPS?"); // check which network you are connectted to
//  updateSerial();
//  delay(1000);
//  mySerial.println("AT+COPS=?"); // return the list of operators present in the network
//  updateSerial();

  
  //////////////Messaging
  delay(1000);
  mySerial.println("AT+CMGF=1"); // Configuring TEXT mode
  updateSerial();
  delay(1000);
  mySerial.println("AT+CMGS=\"+40763892629\"");//change ZZ with country code and xxxxxxxxxxx with phone number to sms
  updateSerial();
  delay(1000);
  mySerial.println("Mesaj"); //text content
  updateSerial();
  delay(1000);
//////////////////Calling
//  mySerial.println("ATD+40787673020"); //  change ZZ with country code and xxxxxxxxxxx with phone number to dial
//  updateSerial();
//  delay(10000); // wait for 20 seconds...
//  mySerial.println("ATH"); //hang up
//  updateSerial();
    
}

void loop()
{
}

void updateSerial()
{
  delay(500);
  while (Serial.available()) 
  {
    mySerial.write(Serial.read());//Forward what Serial received to Software Serial Port
  }
  while(mySerial.available()) 
  {
    Serial.write(mySerial.read());//Forward what Software Serial received to Serial Port
  }
}
