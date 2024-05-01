#define button1 RB0_bit
#define button2 RB1_bit
void main() {
  unsigned short x = 0, y = 0;
  TrisD = 0x00;
  TrisB = 0xFF;
  PortD = 0xFF;
  PortB = 0xFF;
  ADCON1 = 0x0F;
  CMCON = 7;
  RBPU_bit = 0;
  while(1){
    if(button1 == 0){
      x = 1;
      y = 0;
    }
    if(button2 == 0){
      y = 1;
      x = 0;
    }
    if(x == 1){
      RD1_bit = ~RD1_bit;
      RD0_bit = ~RD0_bit;
      delay_us(62500);
      RD1_bit = ~RD1_bit;
      delay_us(62500);
    }
    if(y == 1){
      RD0_bit = ~RD0_bit;
      RD1_bit = ~RD1_bit;
      delay_us(62500);
      RD0_bit = ~RD0_bit;
      delay_us(62500);
    }
  }
}