/*******************************************************************************
 Explorer 16 Demo Main File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    Explorer 16 Demo Main File.

  Description: 
    This is the main file for the Explorer 16 Demo. It contains the main demo
    flow and calls processor specific files for processor specific
    implementations.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2013 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
 *******************************************************************************/
// DOM-IGNORE-END


// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdbool.h>

#include "app.h"

#define ONE_VOLT 310
#define ONE_TENTH_VOLT 31
#define ONE_HUNDREDTH_VOLT 3

// *****************************************************************************
// *****************************************************************************
// Section: File Scope Variables and Functions
// *****************************************************************************
// *****************************************************************************


void Update_LCD ( void ) ;
void SYS_Initialize ( void ) ;
extern void ConvertADCVoltage ( unsigned int  ) ;
extern void Hex2Dec ( unsigned char ) ;


APP_DATA appData = {
                    .messageLine1 = "Explorer 16 Demo" ,
                    .messageLine2 = "Press S3 to cont" ,
                    .messageTime = "Time 00: 00: 00 " ,
                    .messageADC = " Pot = 0.00 Vdc "
} ;


void delay(unsigned int ms)
{
    unsigned int i;
    unsigned char j;

    for (i = 0; i < ms; i++) {

        for (j = 0; j < 200; j++) {
            Nop();
            Nop();
            Nop();
            Nop();
            Nop();
        }
    }
}

void Z1(){
    for (int i=0; i<256; i++){
        if(BUTTON_IsPressed(BUTTON_S6) || BUTTON_IsPressed(BUTTON_S3)){
            break;
        }
        
        LATA = i;
        delay(300);
    }
}
void Z2(){
    for (int i=255; i>=0; i--){
        if(BUTTON_IsPressed(BUTTON_S6) || BUTTON_IsPressed(BUTTON_S3)){
            break;
        }
        
        LATA = i;
        delay(300);
    }
}
void Z3(){
    int n = 0;
    for (int i=0; i<256; i++){
        n = i ^ (i >> 1);
        LATA = n;
        delay(1000);
        if(BUTTON_IsPressed(BUTTON_S6) || BUTTON_IsPressed(BUTTON_S3)){
            break;
        }
    }
}
void Z4(){
    int n = 0;
    for (int i=255; i>=0; i--){
        n = i ^ (i >> 1);
        LATA = n;
        delay(1000);
        if(BUTTON_IsPressed(BUTTON_S6) || BUTTON_IsPressed(BUTTON_S3)){
            break;
        }
    }
}

void Z5()
{
    for(int i=0; i<=99; i++)
    {
        LATA = ((i / 10) << 4) | (i % 10);
        delay(450);
        if(BUTTON_IsPressed(BUTTON_S6) || BUTTON_IsPressed(BUTTON_S3)){
            break;
        }
    }
}

void Z6()
{
    for(int i=99; i>=0; i--)
    {
        LATA = ((i / 10) << 4) | (i % 10);
        delay(450);
        if(BUTTON_IsPressed(BUTTON_S6) || BUTTON_IsPressed(BUTTON_S3)){
            break;
        }
    }
}

void Z7(){
    int snake = 7;
    while(1){
        if(BUTTON_IsPressed(BUTTON_S6) || BUTTON_IsPressed(BUTTON_S3)){
            break;
        }
        for (int i=0; i<5; i++){
            snake=snake<<=1;
            LATA = snake;
            delay(300);
            if(BUTTON_IsPressed(BUTTON_S6) || BUTTON_IsPressed(BUTTON_S3)){
                break;
            }
        }

        for (int i=5; i>0; i--){
            snake=snake>>=1;
            LATA = snake;
            delay(300);
            if(BUTTON_IsPressed(BUTTON_S6) || BUTTON_IsPressed(BUTTON_S3)){
                break;
            }
        }

    }
}

void Z8()
{
    int count = 7;
    int number = 1;
    int temp = 0;
    while(true){
        for(int i = 0; i < count; i++){
            delay(200);
            LATA = number + temp;
            number <<= 1;
            if(BUTTON_IsPressed(BUTTON_S6) || BUTTON_IsPressed(BUTTON_S3)){
                break;
            }
        }
        temp += number;
        delay(200);
        LATA = temp;
        number = 1;
        count--;

        if(count == -1){ 
            count = 7;
            temp = 0;
        }
        
        if(BUTTON_IsPressed(BUTTON_S6) || BUTTON_IsPressed(BUTTON_S3)){
            break;
        }
    }
}


void Z9(){
    int key = 115;
        int generated_code = 1;
        int value = 0;
        int first_compare = 1;
        int j = 7;
        while(true){
            if(BUTTON_IsPressed(BUTTON_S6) || BUTTON_IsPressed(BUTTON_S3)){
                   break;
            }
            delay(1000);
            while(j>=-1){ 
                if(BUTTON_IsPressed(BUTTON_S6) || BUTTON_IsPressed(BUTTON_S3)){
                   break;
                }
                
                if(((key >> j) & 1) == 1){
                    if(first_compare==1){
                        value = ((generated_code>> j) & 1);
                        first_compare = 0;
                    }
                    else{
                        value ^= ((generated_code>> j) & 1);
                    }
                }
                j--;
                
            }
            
            
            value <<=5;//przesuwamy wynik XOR na odpowiedni bit
            generated_code >>=1;// przesuwamy kod wyjsciowy o jeden bit
            generated_code |= value; // dodajemy bit do kodu
            LATA = generated_code; // wy?wietlanie wygenerowanej liczby
            first_compare = 1;
            value = 0; //reset zmiennej
            j=7;
        }
}

void manager(int mode){
    LCD_PutChar ( 'P' ) ;
    LCD_PutChar ( 'r' ) ;
    LCD_PutChar ( 'o' ) ;
    LCD_PutChar ( 'g' ) ;
    LCD_PutChar ( 'r' ) ;
    LCD_PutChar ( 'a' ) ;
    LCD_PutChar ( 'm' ) ;
    switch(mode){
        case 0:
            LCD_PutChar ( '1' ) ;
            Z1();
            break;                      
        case 1:
            LCD_PutChar ( '2' ) ;
            Z2();
            break;           
        case 2:
            LCD_PutChar ( '3' ) ;
            Z3();
            break;              
        case 3:      
            LCD_PutChar ( '4' ) ;
            Z4();
            break;
        case 4:
            LCD_PutChar ( '5' ) ;
            Z5();
            break;
        case 5:   
            LCD_PutChar ( '6' ) ;
            Z6();
            break;
        case 6:
            LCD_PutChar ( '7' ) ;
            Z7();
            break;
        case 7:   
            LCD_PutChar ( '8' ) ;
            Z8();
            break;
        case 8:    
            LCD_PutChar ( '9' ) ;
            Z9();
            break;
            
    }
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( ' ' ) ;
    
    
}

// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************
int main ( void )
{


    /* Call the System Intialize routine*/
    SYS_Initialize ( ) ;
    

    /* wait here until switch S3 is pressed */


    /*Initialize Timer*/
    //TIMER_SetConfiguration ( TIMER_CONFIGURATION_RTCC ) ;

    /*Initialize ADC configure it as 10 bit interrupt driven mode*/
    //ADC_SetConfiguration ( ADC_CONFIGURATION_AUTO_SAMPLE_CONVERT ) ;

    int mode = 0;
    
    /* Infinite Loop */
    while ( 1 )
    {
        /* check if time to update LCD with Timer data */
//        if ( appData.rtc_lcd_update )
//        {
//            Hex2Dec ( appData.hours ) ;
//            Update_LCD ( ) ;
//            appData.rtc_lcd_update = 0 ;
//            i++;
//            /* check if time to update LCD with ADC data */
//            if ( appData.adc_lcd_update )
//            {
//
//                ConvertADCVoltage ( appData.temp1 ) ;
//                LCD_PutChar ( ' ' ) ;
//                LCD_PutChar ( ' ' ) ;
//                LCD_PutChar ( 'P' ) ;
//                LCD_PutChar ( 'o' ) ;
//                LCD_PutChar ( 't' ) ;
//                LCD_PutChar ( ' ' ) ;
//                LCD_PutChar ( '=' ) ;
//                LCD_PutChar ( ' ' ) ;
//                LCD_PutChar ( appData.adones ) ;
//                LCD_PutChar ( '.' ) ;
//                LCD_PutChar ( appData.adtens ) ;
//                LCD_PutChar ( appData.adhunds ) ;
//                LCD_PutChar ( ' ' ) ;
//                LCD_PutChar ( 'V' ) ;
//                LCD_PutChar ( 'd' ) ;
//                LCD_PutChar ( 'c' ) ;
//                LCD_PutChar ( ' ' ) ;
//                appData.adc_lcd_update = 0 ;
//            }
//            
//        }
        
        if(BUTTON_IsPressed(BUTTON_S3)){
            while(BUTTON_IsPressed(BUTTON_S3) == true);
            mode += 1;
        }
        if(BUTTON_IsPressed(BUTTON_S6)){
            while(BUTTON_IsPressed(BUTTON_S6) == true);
            mode -= 1;
        }
        
        if(mode < 0)
            mode = 8;
    
        if(mode > 8)
            mode = 0;
        
        if (mode <= 8) {
            manager(mode);
        }
    } ;
}

/*******************************************************************************

  Function:
   void Update_LCD( void )

  Summary:
    Function to update LCD

  Description:
    This function will update the time on the LCD

  Precondition:
    None.

  Parameters:
    None.

  Returns:
    None.

  Remarks:

 */
/******************************************************************************/
void Update_LCD ( void )
{
    LCD_PutChar ( 'T' ) ;
    LCD_PutChar ( 'i' ) ;
    LCD_PutChar ( 'm' ) ;
    LCD_PutChar ( 'e' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( appData.tens + 0x30 ) ;
    LCD_PutChar ( appData.ones + 0x30 ) ;

    Hex2Dec ( appData.minutes ) ;
    LCD_PutChar ( ':' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( appData.tens + 0x30 ) ;
    LCD_PutChar ( appData.ones + 0x30 ) ;

    Hex2Dec ( appData.seconds ) ;
    LCD_PutChar ( ':' ) ;
    LCD_PutChar ( ' ' ) ;
    LCD_PutChar ( appData.tens + 0x30 ) ;
    LCD_PutChar ( appData.ones + 0x30 ) ;

}

/*******************************************************************************

  Function:
   void ConvertADCVoltage ( unsigned int )

  Summary:
    Function to convert ADC data into volts

  Description:
     This is the file for the Explorer 16 Dem that converts raw 10 bit ADC data
    to volts suitable for the LCD display

  Precondition:
    None.

  Parameters:
    None.

  Returns:
    None.

  Remarks:

 */
/******************************************************************************/

void ConvertADCVoltage ( unsigned int adc_conv_data )
{
    /* reset values */
    appData.adones = 0 ;
    appData.adtens = 0 ;
    appData.adhunds = 0 ;
    appData.adthous = 0 ;

    while ( adc_conv_data > 0 )
    {
        /* test for 1 volt or greater */
        if ( adc_conv_data > ( ONE_VOLT - 1 ) )
        {
            /* increment 1 volt counter */
            appData.adones++ ;

            /* subtract 1 volt */
            adc_conv_data -= ONE_VOLT ;
        }


            /* test for 0.1 volt */
        else if ( adc_conv_data > ( ONE_TENTH_VOLT - 1 ) )
        {
            /* increment tenths */
            if ( appData.adtens < 9 )
            {
                appData.adtens++ ;
            }
            else
            {
                /* tenths has rolled over */
                appData.adones++ ;

                /* so increment ones and reset tenths */
                appData.adtens = 0 ;
            }

            adc_conv_data -= ONE_TENTH_VOLT ;
        }

            /* test for 0.01 volt */
        else if ( adc_conv_data > ( ONE_HUNDREDTH_VOLT - 1 ) )
        {
            /* increment hundredths */
            if ( appData.adhunds < 9 )
            {
                appData.adhunds++ ;
            }
            else
            {
                /* hundredths has rolled over */
                appData.adtens++ ;

                /* so increment tenths and reset hundredths */
                appData.adhunds = 0 ;
            }

            adc_conv_data -= ONE_HUNDREDTH_VOLT ;
        }

        else if ( adc_conv_data <= ( ONE_HUNDREDTH_VOLT - 1 ) )
        {
            appData.adthous++ ;
            adc_conv_data -- ;
        }
    }

    appData.adones += 0x30 ;
    appData.adtens += 0x30 ;
    appData.adhunds += 0x30 ;
    appData.adthous += 0x30 ;
}

/*******************************************************************************

  Function:
   void Hex2Dec ( unsigned char )

  Summary:
    Explorer 16 Demo Hex to Decimal Conversion File

  Description:
     This is the file for the Explorer 16 Dem that converts the hexadecimal data
    into decimal format.

  Precondition:
    None.

  Parameters:
    None.

  Returns:
    None.

  Remarks:

 */
/******************************************************************************/

void Hex2Dec ( unsigned char count )
{
    /* reset values */
    appData.hunds = 0 ;
    appData.tens  = 0 ;
    appData.ones = 0 ;

    while ( count >= 10 )
    {

        if ( count >= 200 )
        {
            count -= 200 ;
            appData.hunds = 0x02 ;
        }

        if (count >= 100)
        {
            count -= 100 ;
            appData.hunds++ ;
        }

        if (count >= 10 )
        {
            count -= 10 ;
            appData.tens++ ;
        }
    }

    appData.ones = count ;
}
