################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../01.MCAL/06.uart/uart.c \
../01.MCAL/06.uart/uart_PBcfg.c 

OBJS += \
./01.MCAL/06.uart/uart.o \
./01.MCAL/06.uart/uart_PBcfg.o 

C_DEPS += \
./01.MCAL/06.uart/uart.d \
./01.MCAL/06.uart/uart_PBcfg.d 


# Each subdirectory must supply rules for building sources it contributes
01.MCAL/06.uart/%.o: ../01.MCAL/06.uart/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -Wall -g2 -gstabs -O0 -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16 -DF_CPU=1000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


