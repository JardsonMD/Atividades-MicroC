#line 1 "C:/Users/jards/OneDrive/Documents/Faculdade/Arquitetura/Relatorio2/Exp02Questao1/Codigo/questao1.c"
unsigned short caracter[] = {0x3F, 0x30, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};


void main(){
 unsigned short atual = 0, antiga = 0;
 TrisB = 0x0F;
 TrisE = 0x00;
 TrisD = 0x00;
 PortB = 0xFF;
 PortD = 0xFF;
 CMCON = 7;
 ADCON1 = 0x0F;
 RBPU_bit = 0;
 RE2_bit = 1;
 while(1){
 atual = ~PortB;
 if(atual != antiga){
 antiga = atual;
 PortD = caracter[antiga];
 delay_ms(50);
 }
 }
}
