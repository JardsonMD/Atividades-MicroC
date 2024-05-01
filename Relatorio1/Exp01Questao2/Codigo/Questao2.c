void main() {
  unsigned short int x;
  float y;
  TrisD = 0x00;
  TrisB = 0x0F;
  PortD = 0xFF;
  PortB = 0xFF;
  ADCON1 = 0x0F;
  CMCON = 7;
  RBPU_bit = 0;
  while(1){
     x = ~PortB;
     y = -4.2 * x + 31;
     PortD = ~(int)y;
  }
  
}