
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdbool.h>

#include "app.h"
#include <p24fj128ga010.h> 

#define ONE_VOLT 310
#define ONE_TENTH_VOLT 31
#define ONE_HUNDREDTH_VOLT 3

#define SCALE 308L // z zad 1



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

// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************

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



int isAlarm = 0;
#define ALARM_TEMPERATURE 29

void alarm(int temp) {
    int limit = 29  ;
    
    if(isAlarm == 1) {
        LATA = 255;
    } else {
        LATA = 0;
    }
    
    if (temp > limit) {
        if (isAlarm == 0) {
                LED_On(LED_D9);
                
                LED_Off(LED_D9);
               
                
                LED_On(LED_D9);
                
                LED_Off(LED_D9);
                
                
                LED_On(LED_D9);
                
                LED_Off(LED_D9);
                
            }
            if (temp > limit) {
                LATA = 255;
            }
            isAlarm = 1;
    } 
}


void temperatura(){
    if(BUTTON_IsPressed ( BUTTON_S6 )){
        isAlarm = 0;
    } 
        
    if(!BUTTON_IsPressed ( BUTTON_S6 )){
        appData.temp1 = ADC_Read10bit(ADC_CHANNEL_TEMPERATURE_SENSOR);
        ConvertADCVoltage ( appData.temp1 ) ;
        float voltage = (appData.adones-'0') + (appData.adtens-'0')*0.1 + (appData.adhunds-'0')*0.01;
        int temp = (int)((voltage - 0.5) * 100); // zmiana wzoru na ((voltage - 0.5) * 100)
        
        char tempStr[6];
        sprintf(tempStr, "%d", temp);
        
        LCD_PutChar ( appData.adones ) ;
        LCD_PutChar ( appData.adtens ) ;
        LCD_PutChar ( '.' ) ;
        LCD_PutChar ( appData.adhunds ) ;
        LCD_PutChar ( ' ' ) ; // Dodajemy spacj? mi?dzy warto?ciami
        LCD_PutChar ( tempStr[0] ) ; // Wy?wietlamy warto?? temp
        if (tempStr[1] != '\0') { // Je?li druga cyfra temp istnieje
            LCD_PutChar ( tempStr[1] ) ;
        }
        delay(300);
        alarm(temp); 
        
        LCD_ClearScreen(); 
        appData.adc_lcd_update = 0 ;
    }   
}

int main ( void )
{
    SYS_Initialize ( ) ;
   /*Initialize Timer*/
    TIMER_SetConfiguration ( TIMER_CONFIGURATION_RTCC ) ;

    /*Initialize ADC configure it as 10 bit interrupt driven mode*/
    ADC_SetConfiguration ( ADC_CONFIGURATION_AUTO_SAMPLE_CONVERT ) ;
    


    /* Infinite Loop */
    while ( 1 )
    {
        temperatura();

    } ;
    
}

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
