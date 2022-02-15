################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../FreeRTOS_SourceFiles/croutine.c \
../FreeRTOS_SourceFiles/event_groups.c \
../FreeRTOS_SourceFiles/heap_1.c \
../FreeRTOS_SourceFiles/list.c \
../FreeRTOS_SourceFiles/port.c \
../FreeRTOS_SourceFiles/queue.c \
../FreeRTOS_SourceFiles/stream_buffer.c \
../FreeRTOS_SourceFiles/tasks.c \
../FreeRTOS_SourceFiles/timers.c 

OBJS += \
./FreeRTOS_SourceFiles/croutine.o \
./FreeRTOS_SourceFiles/event_groups.o \
./FreeRTOS_SourceFiles/heap_1.o \
./FreeRTOS_SourceFiles/list.o \
./FreeRTOS_SourceFiles/port.o \
./FreeRTOS_SourceFiles/queue.o \
./FreeRTOS_SourceFiles/stream_buffer.o \
./FreeRTOS_SourceFiles/tasks.o \
./FreeRTOS_SourceFiles/timers.o 

C_DEPS += \
./FreeRTOS_SourceFiles/croutine.d \
./FreeRTOS_SourceFiles/event_groups.d \
./FreeRTOS_SourceFiles/heap_1.d \
./FreeRTOS_SourceFiles/list.d \
./FreeRTOS_SourceFiles/port.d \
./FreeRTOS_SourceFiles/queue.d \
./FreeRTOS_SourceFiles/stream_buffer.d \
./FreeRTOS_SourceFiles/tasks.d \
./FreeRTOS_SourceFiles/timers.d 


# Each subdirectory must supply rules for building sources it contributes
FreeRTOS_SourceFiles/%.o: ../FreeRTOS_SourceFiles/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\FreeRTOS_SourceFiles" -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\HAL\ADXL345" -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\MCAL\I2C" -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\HAL" -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\HAL\HCLCD" -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\LIB" -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\MCAL" -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\MCAL\MDIO" -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\MCAL\MGIE" -I"C:\Users\B\Desktop\RTOS\WorkSpace\NTI_Project\MCAL\MUSART" -Wall -g2 -gstabs -O0 -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16 -DF_CPU=1000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


