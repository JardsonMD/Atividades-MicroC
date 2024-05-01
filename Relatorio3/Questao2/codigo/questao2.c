void interrupt(){
  if(INT1IF_bit){
    unsigned short i = 0;
    INT1IF_bit = 0;
    TrisD = 0xF0;
    while(i < 20){
      PortD = ~PortD;
      delay_ms(250);
      i++;
    }
    TrisD = 0x00;
    PortD = 0xFF;
  }
}
void interrupt_low(){
  if(INT2IF_bit){
    unsigned short i = 0;
    INT2IF_bit = 0;
    TrisD = 0x0F;
    while(i < 20){
      PortD = ~PortD;
      delay_ms(250);
      i++;
    }
    TrisD = 0x00;
    PortD = 0xFF;
  }
}


void main() {
  unsigned short x = 0, y = 0;
  TrisB = 0xFF;
  TrisD = 0x00;
  PortB = 0xFF;
  PortD = 0xFF;
  CMCON = 7;

  GIE_bit = 1;
  PEIE_bit = 1;
  ADCON1 = 0x0F;
  IPEN_bit = 1;
  //RBPU_bit = 0;
  INT1IE_bit = 1;
  INT2IE_bit = 1;
  INT1IP_bit = 1;
  INT2IP_bit = 0;
  INTEDG1_bit = 1;
  INTEDG2_bit = 1;

  while(1){
    PortD = ~PortD;
    delay_ms(250);
  }
  

}