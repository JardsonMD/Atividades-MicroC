void main() {
  unsigned short x;
  int y = 0;
  TrisD = 0x00;
  PortD = 0xFF;
  ADCON1 = 0x0F;
  CMCON = 7;
  RBPU_bit = 0;
   x = ~PortD;
  while(1){
    if(PortD == 0x00){
      y = 1;
    }else if(PortD == 0xFF){
      y = 0;
    }
    if(y == 0){
      if(PortD == 0xFF){
        x = 0x00;
      }
      delay_ms(300);
      x += 0x80;
      PortD = ~x;
      x = x >> 1;
    }
    if(y == 1){
      delay_ms(300);
      if(PortD == 0x00){
        x = 0x00;
      }
      x += 1;
      PortD = x;
      x = x << 1;
      y = 1;
    }

  }
}