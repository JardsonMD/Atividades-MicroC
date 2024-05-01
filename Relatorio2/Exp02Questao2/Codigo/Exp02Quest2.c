unsigned short display[] = {0x38, 0x77, 0x7c, 0x5c, 0x50, 0x77, 0x78, 0x5c, 0x50, 0x04, 0x5c};
#define BOT1 INT0_bit
#define BOT2 INT1_bit
void main() {
     unsigned short x = 0, i = 0;
     TrisB = 0xFF;
     TrisA = 0x00;
     TrisD = 0x00;
     PortB = 0xFF;
     PortB = 0x00;
     CMCON = 7;
     ADCON1 = 0x0F;
     RBPU_bit = 0;
     RA5_bit = 1;
     
     while(1){
     if(BOT1 == 0){
        x = 1;
     }
     if(BOT2 == 0){
        x = 0;
     }
     if(x == 1){
        if(i > 10){
           RA5_bit = 0;
           delay_ms(2000);
           i = 0;
           RA5_bit = 1;
        }
        PortD = display[i];
        delay_ms(500);
        i++;
     }

     }
     
     
}