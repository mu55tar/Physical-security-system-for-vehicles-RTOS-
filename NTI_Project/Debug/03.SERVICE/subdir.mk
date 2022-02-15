################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../03.SERVICE/croutine.c \
../03.SERVICE/event_groups.c \
../03.SERVICE/heap_1.c \
../03.SERVICE/list.c \
../03.SERVICE/port.c \
../03.SERVICE/queue.c \
../03.SERVICE/stream_buffer.c \
../03.SERVICE/tasks.c \
../03.SERVICE/timers.c 

OBJS += \
./03.SERVICE/croutine.o \
./03.SERVICE/event_groups.o \
./03.SERVICE/heap_1.o \
./03.SERVICE/list.o \
./03.SERVICE/port.o \
./03.SERVICE/queue.o \
./03.SERVICE/stream_buffer.o \
./03.SERVICE/tasks.o \
./03.SERVICE/timers.o 

C_DEPS += \
./03.SERVICE/croutine.d \
./03.SERVICE/event_groups.d \
./03.SERVICE/heap_1.d \
./03.SERVICE/list.d \
./03.SERVICE/port.d \
./03.SERVICE/queue.d \
./03.SERVICE/stream_buffer.d \
./03.SERVICE/tasks.d \
./03.SERVICE/timers.d 


# Each subdirectory must supply rules for building sources it contributes
03.SERVICE/%.o: ../03.SERVICE/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -Wall -g2 -gstabs -O0 -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16 -DF_CPU=1000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


