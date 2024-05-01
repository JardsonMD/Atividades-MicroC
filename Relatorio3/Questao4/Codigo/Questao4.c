unsigned short int cont2Hz = 0, cont10Hz = 0;

void interrupt(){
   if(TMR0IF_bit == 1){
      TMR0IF_bit = 0;
      cont2Hz++;
      cont10Hz++;
      if(cont2Hz == 250){
        cont2Hz = 0;
        RD0_bit = !RD0_bit;
      }
      if(cont10Hz == 50){
        cont10Hz = 0;
        RD1_bit = !RD1_bit;
      }
      TMR0H = 0xF6;
      TMR0L = 0x3C;
   }
}

void main() {
   TrisB = 0xFF;
   TrisD = 0x00;
   PortB = 0xFF;
   PortD = 0xFF;
   ADCON1 = 0x0F;
   CMCON = 7;
   RBPU_bit = 0;
   GIE_bit = 1;
   PEIE_bit = 1;
   TMR0IE_bit = 1;
   T0CON = 0x80;
   TMR0H = 0xF6;
   TMR0L = 0x3C;
   while(1);

}