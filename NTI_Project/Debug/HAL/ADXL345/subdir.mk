################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../HAL/ADXL345/ADXL345_I2C.c 

OBJS += \
./HAL/ADXL345/ADXL345_I2C.o 

C_DEPS += \
./HAL/ADXL345/ADXL345_I2C.d 


# Each subdirectory must supply rules for building sources it contributes
HAL/ADXL345/%.o: ../HAL/ADXL345/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\FreeRTOS_SourceFiles" -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\HAL\ADXL345" -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\MCAL\I2C" -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\HAL" -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\HAL\HCLCD" -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\LIB" -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\MCAL" -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\MCAL\MDIO" -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\MCAL\MGIE" -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\MCAL\MUSART" -Wall -g2 -gstabs -O0 -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16 -DF_CPU=1000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

