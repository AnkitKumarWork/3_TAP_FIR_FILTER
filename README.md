# 3_TAP_FIR_FILTER_TRANSPOSE_ARCH

# 3-Tap FIR Filter

## Overview
This project implements a 3-tap Finite Impulse Response (FIR) filter in FPGA . FIR filters are widely used in digital signal processing (DSP) applications for filtering signals while maintaining a linear phase response.

## 1 Features
- Implements a simple 3-tap FIR filter.
- Configurable filter coefficients.
- h0 = 0.25;
- h1 = 0.5;
- h2 = 0.25;
- Supports real-time and offline processing.
- Suitable for FPGA, ASIC, or software-based implementations.

## FIR ARCHITECTURES

### DIRECT FORM ARCHITECTURE
![image](https://github.com/user-attachments/assets/4d9604fd-8028-4b67-ba15-b569f42981ba)


### TRANSPOSE ARCHITECTURE
![image](https://github.com/user-attachments/assets/7a6b0431-e441-44ff-ae3d-e2524c321ff7)


### Filter Equation
The output of the FIR filter is computed as:
![image](https://github.com/user-attachments/assets/6e1426b8-5272-464c-881c-3c978b7e967e)

where:
- X(n) is the input signal.
- Y(n)is the output signal.
- h0, h1, h2 are the filter coefficients.
- x(n-1) is 1 unit dealyed input
- x(n-2) is 2 unit delayed input


### 2. FPGA/Hardware Implementation
For FPGA implementations, the FIR filter can be described in Verilog using XILINIX VIVADO

#BLOCK DIAGRAM
![image](https://github.com/user-attachments/assets/f298a024-67f4-475c-b7e7-0380fae9d439)

# IMPLEMENTATION 
## By behavioural description 
-https://github.com/AnkitKumarWork/3_TAP_FIR_FILTER_TRANSPOSE_ARCH/tree/main/FIR_BEHAV

- designed using datapath and controller, datapath has been described just by giving behavioural verilog code.

#Using Top- Down approach
## DATAPATH

-https://github.com/AnkitKumarWork/3_TAP_FIR_FILTER_TRANSPOSE_ARCH/tree/main/FIR_TOP_DOWN

designed each submodule seperately and instantiate them using structural modelling.
functional blocks(sub modules) required-
- Reg_x 
- Reg_delay1
- Reg_delay2
- Reg_y
- multiplier1
- multiplier2
- multiplier3
- adder1
- adder2
  
![image](https://github.com/user-attachments/assets/58b973b3-3468-4322-8afa-50390ada0c35)

## CONTROLLER

![image](https://github.com/user-attachments/assets/5f326f76-5fac-4632-86db-80968ddc7f8f)

## TOP MODULE 

![image](https://github.com/user-attachments/assets/67493065-5f31-4c1c-af0f-1b2a46886590)


# Simulation
To test the FIR filter:
1. Apply a known input sequence.
   TESTBENCH - https://github.com/AnkitKumarWork/3_TAP_FIR_FILTER_TRANSPOSE_ARCH/blob/main/FIR_TOP_DOWN/TOP_FIR_TB.v
2. Compare the output against expected results.
3. FINAL_OUTPUT

   ![image](https://github.com/user-attachments/assets/464eb3b9-4fff-4ec5-ace5-ba9e9ba72b46)


## Applications
- Audio signal processing
- Communication systems
- Image processing
- Sensor signal conditioning

