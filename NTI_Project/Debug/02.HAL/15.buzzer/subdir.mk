################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../02.HAL/15.buzzer/buzzer.c 

OBJS += \
./02.HAL/15.buzzer/buzzer.o 

C_DEPS += \
./02.HAL/15.buzzer/buzzer.d 


# Each subdirectory must supply rules for building sources it contributes
02.HAL/15.buzzer/%.o: ../02.HAL/15.buzzer/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -Wall -g2 -gstabs -O0 -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16 -DF_CPU=1000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


