/*
 * main.c
 *
 *  Created on: Dec 13, 2021
 *      Author: gerges
 */


#include"LIB\LSTD_TYPES.h"

#include"MCAL\MDIO\MDIO_Interface.h"
#include"MCAL/MADC/MADC_Interface.h"

#include"MCAL\MUSART\MUSART_Interface.h"
#include"HAL/ADXL345/ADXL345_I2C.h"

#include"FreeRTOS_SourceFiles\FreeRTOS.h"
#include"FreeRTOS_SourceFiles\task.h"
#include"FreeRTOS_SourceFiles\semphr.h"


#include<util\delay.h>

#define MAX_BUFFER     10

u8 StartFlag=0;
u8 StopFlag=0;

u8 UART_REC_Buffer[MAX_BUFFER];


xSemaphoreHandle EnabelSem;
xSemaphoreHandle FlagAlarmSem;

void APP_Enable_System(void *pv);
void APP_ADXL(void *Pv);
void APP_Alarm(void *Pv);
void APP_Disable_System(void *Pv);


void USART_Receive_ISR(void);



int main(void){

	/*ADXL Initialization*/
	ADXL_init();

	/*Button Initialization*/
	MDIO_Error_State_SetPinDirection(PIN1,MDIO_PORTB,PIN_INPUT);

	/*Buzzer Initialization*/
	MDIO_Error_State_SetPinDirection(PIN0,MDIO_PORTB,PIN_OUTPUT);

	/* TX and RX pins initialization */
	MDIO_Error_State_SetPinDirection(PIN0,MDIO_PORTD,PIN_INPUT);
	MDIO_Error_State_SetPinDirection(PIN1,MDIO_PORTD,PIN_OUTPUT);

	/*UART Initialization*/
	MUSART_VidInit();
	/*Set uart call back function*/
	MUSART_VidSetCallBack(USART_Receive_ISR);

	/*UART Interrupt receive enable*/
	MUSART_VidUSART_Receive_Interrupt_Enable();
	/*Enable to GI*/
	MGIE_VidEnable();


	/*Create Semaphors*/

	vSemaphoreCreateBinary(EnabelSem);
	vSemaphoreCreateBinary(FlagAlarmSem);

	/*Create Taskes*/
	xTaskCreate(APP_Disable_System,NULL,100,NULL,0,NULL);

	xTaskCreate(APP_ADXL,NULL,100,NULL,1,NULL);

	xTaskCreate(APP_Alarm,NULL,100,NULL,2,NULL);

	xTaskCreate(APP_Enable_System,NULL,100,NULL,3,NULL);


	/*Start Scheduler*/

	vTaskStartScheduler();

	while(1){}
	return 0;
}




void USART_Receive_ISR(void)
{
	MUSART_VidReceiveString(UART_REC_Buffer);

	if(MUSART_u8CompareString(UART_REC_Buffer , "start"))
	{
		StartFlag=1;
		StopFlag=0;

	}
	else if(MUSART_u8CompareString(UART_REC_Buffer , "stop"))
	{
		StopFlag=1;
	}
}

void APP_Enable_System(void *pv)
{
	u8 ButtonState;
	u8 Loc_SemStartState;

	while(1)
	{		Loc_SemStartState=xSemaphoreTake(EnabelSem,10);
	MDIO_Error_State_GetPinValue(PIN1,MDIO_PORTB,&ButtonState);

	if(ButtonState==0)
	{
		xSemaphoreGive(EnabelSem);
		StartFlag=1;
		StopFlag=0;
	}
	else if(StartFlag==1)
	{
		xSemaphoreGive(EnabelSem);
		StopFlag=0;
	}
	vTaskDelay(400);
	}
}

void APP_ADXL(void *Pv){
	u8 Loc_SemADXLState;
	float Frist_Read_Acc_Data[3]={0};
	float Second_Read_Acc_Data[3]={0};

	ADXL_Acc(Frist_Read_Acc_Data);

	while(1){
		Loc_SemADXLState=xSemaphoreTake(EnabelSem,10);
		if(Loc_SemADXLState==pdPASS){
			xSemaphoreTake(FlagAlarmSem,10);
			//Check Data from Sensor
			ADXL_Acc(Second_Read_Acc_Data);
			if(Frist_Read_Acc_Data[0]!=Second_Read_Acc_Data[0]
				|| Frist_Read_Acc_Data[1]!=Second_Read_Acc_Data[1]
				|| Frist_Read_Acc_Data[2]!=Second_Read_Acc_Data[2])
			{

				xSemaphoreGive(FlagAlarmSem);

			}
			else{
				/*Do Nothing*/
			}

		}
		else{
			/*Do Nothing*/
		}
		vTaskDelay(1000);
	}


}



void APP_Alarm(void *Pv){
	u8 Loc_SemUARTSendState;

	while(1){
		Loc_SemUARTSendState=xSemaphoreTake(FlagAlarmSem,10);
		if(Loc_SemUARTSendState==pdPASS){

			/*Enable Buzzer*/
			MDIO_Error_State_SetPinValue(PIN0,MDIO_PORTB,PIN_HIGH);

			/*Send Alarm on UART*/
			MUSART_VidSendString("Warning..!!!");

		}
		else{
			/*Do Nothing*/
		}
		vTaskDelay(1000);

	}

}


void APP_Disable_System(void *Pv){

	while(1){

		if((StopFlag==1)&&(StartFlag==1))
		{
			/*Disable Buzzer*/
			MDIO_Error_State_SetPinValue(PIN0,MDIO_PORTB,PIN_LOW);

			xSemaphoreGive(EnabelSem);
			xSemaphoreGive(FlagAlarmSem);

			StartFlag=0;

		}
		else{
			/*Do Nothing*/
		}
		vTaskDelay(1000);

	}

}


/*
 * void APP_Buzzer(void *Pv){
	u8 Loc_SemBuzzerState;

	while(1){
		Loc_SemBuzzerState=xSemaphoreTake(FlagAlarmSem,10);
		if(Loc_SemBuzzerState==pdPASS){

			MDIO_Error_State_SetPinValue(PIN1,MDIO_PORTB,PIN_HIGH);

		}
		else{
			//Do Nothing
		}
		vTaskDelay(200);

	}

}
 */
