#line 1 "C:/Users/jards/OneDrive/Documents/Faculdade/Arquitetura/Relatorio2/Exp02Questao4/Codigo/Questao4.c"
unsigned short cont[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};




void mostrar(short i, short j);

void main() {
 unsigned short x = 0, i = 0, j = 0, y = 0, cont1 = 0;
 TrisB = 0xFF;
 TrisE = 0x00;
 TrisD = 0x00;
 PortB = 0xFF;
 PortD = 0x00;
 CMCON = 7;
 ADCON1 = 0x0F;
 RBPU_bit = 0;
 RE0_bit = 1;
 RE2_bit = 1;

 while(1){
 mostrar(i, j);
 cont1++;
 if( INT0_bit  == 0){
 y = 1;
 }
 if( INT1_bit  == 0){
 y = 2;
 }
 if( INT2_bit  == 0){
 y = 3;
 }
 if(i == 10){
 j++;
 i = 0;
 }
 if(j == 10){
 j = 0;
 }
 if(y == 1){
 if(cont1 == 50){
 i++;
 cont1 = 0;
 }
 }else if(y == 2){
 if(cont1 == 25){
 i++;
 cont1 = 0;
 }
 }else if(y == 3){
 if(cont1 == 12){
 i++;
 cont1 = 0;
 }
 }
 }

}

void mostrar(short i, short j){
 PortD = cont[j];
 RE0_bit = 1;
 RE2_bit = 0;
 delay_ms(10);
 PortD = cont[i];
 RE0_bit = 0;
 RE2_bit = 1;
 delay_ms(10);
}
