#line 1 "C:/Users/jards/OneDrive/Documents/Faculdade/Arquitetura/Relatorio1/Exp01Questao3/Codigo/Questao3.c"


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
 if( RB0_bit  == 0){
 x = 1;
 y = 0;
 }
 if( RB1_bit  == 0){
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
