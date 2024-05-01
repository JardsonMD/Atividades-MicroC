#line 1 "C:/Users/jards/OneDrive/Documents/Faculdade/Arquitetura/Em sala/problema2/codigo/problema2.c"
unsigned short palavra[] = {0x00,0x00,0x00,0x00,0x39, 0x06, 0x79, 0x54, 0x39, 0x06, 0x77, 0x00, 0x5E, 0x77, 0x00, 0x39, 0x3F, 0x37, 0x73, 0x3E, 0x78,0x77, 0x39, 0x77, 0x3F, 0x00, 0x00,0x00,0x00};


void mostrar(short i);

void main() {
 unsigned short x = 0, i = 4, cont = 0;
 TrisB = 0xFF;
 TrisA = 0x00;
 TrisE = 0x00;
 TrisD = 0x00;
 PortB = 0xFF;
 PortD = 0x00;
 CMCON = 7;
 ADCON1 = 0x0F;
 RBPU_bit = 0;

 while(1){
 mostrar(i);
 cont++;
 if( INT0_bit  == 0){
 x = !x;
 }
 if(x == 1){
 if(cont >= 13){
 i++;
 cont = 0;
 }
 }
 if(i == 25){
 RA5_bit = 0;
 RA2_bit = 0;
 RE0_bit = 0;
 RE2_bit = 0;
 delay_ms(1000);
 i = 0;
 }
 }
}
void mostrar(short i){
 PortD = palavra[i];
 RA5_bit = 1;
 RA2_bit = 0;
 RE0_bit = 0;
 RE2_bit = 0;
 delay_ms(5);
 PortD = palavra[i + 1];
 RA5_bit = 0;
 RA2_bit = 1;
 RE0_bit = 0;
 RE2_bit = 0;
 delay_ms(5);
 PortD = palavra[i + 2];
 RA5_bit = 0;
 RA2_bit = 0;
 RE0_bit = 1;
 RE2_bit = 0;
 delay_ms(5);
 PortD = palavra[i + 3];
 RA5_bit = 0;
 RA2_bit = 0;
 RE0_bit = 0;
 RE2_bit = 1;
 delay_ms(5);
}

void volta(short i){
 PortD = palavra[i];
 RA5_bit = 1;
 RA2_bit = 0;
 RE0_bit = 0;
 RE2_bit = 0;
 delay_ms(10);
 PortD = palavra[i + 1];
 RA5_bit = 0;
 RA2_bit = 1;
 RE0_bit = 0;
 RE2_bit = 0;
 delay_ms(10);
 PortD = palavra[i + 2];
 RA5_bit = 0;
 RA2_bit = 0;
 RE0_bit = 1;
 RE2_bit = 0;
 delay_ms(10);
 PortD = palavra[i + 3];
 RA5_bit = 0;
 RA2_bit = 0;
 RE0_bit = 0;
 RE2_bit = 1;
 delay_ms(10);
}
