*****************************************************************
* VLSI 2011                                                     *
*                                                               *
* Lab09d: Adder Design                                          *
*****************************************************************

***********************************
* Operation Condition             *
***********************************
*** Process: Typical ***
.lib "hspice_model.122" L18U18V_TT
*.lib "hspice_model.122" L18U18V_FF
*.lib "hspice_model.122" L18U18V_SS

*** Voltage: 1.8V ***
.PARAM supply=1.8v

*** Temperature: 25C ***
.TEMP 25


***********************************
* Transition Analysis             *
***********************************
.TRAN 1ps 250ns 


***********************************
* HSPICE Options                  *
***********************************
.OPTION POST PROBE
.OPTION NOMOD BRIEF MEASDGT=7 
.OPTION CAPTAB NOTOP AUTOSTOP


***********************************
* Output Signals                  *
***********************************
.probe tran v(A[*]) v(B[*]) v(CIN)
.probe tran v(S[*]) v(C[*]) 
.probe tran i(VDD)


***********************************
* Measurement Commands            *
***********************************
.MEAS tran avg_power avg par('v(VDD)*i(VDD)') FROM=0ns TO=250ns
.MEAS tran max_power min par('v(VDD)*i(VDD)') FROM=0ns TO=250ns

.MEASURE C3_TR    TRIG v(C[3]) VAL='supply*0.1' RISE=1
+                 TARG v(C[3]) VAL='supply*0.9' RISE=1
.MEASURE C3_TF    TRIG v(C[3]) VAL='supply*0.9' FALL=1 
+                 TARG v(C[3]) VAL='supply*0.1' FALL=1

.MEASURE S3_TR    TRIG v(S[3]) VAL='supply*0.1' RISE=1
+                 TARG v(S[3]) VAL='supply*0.9' RISE=1
.MEASURE S3_TF    TRIG v(S[3]) VAL='supply*0.9' FALL=1 
+                 TARG v(S[3]) VAL='supply*0.1' FALL=1

.MEASURE C3_TPLH  TRIG v(B[0]) VAL='supply*0.5' RISE=1  
+                 TARG v(C[3]) VAL='supply*0.5' RISE=1
.MEASURE C3_TPHL  TRIG v(B[0]) VAL='supply*0.5' FALL=1  
+                 TARG v(C[3]) VAL='supply*0.5' FALL=1

.MEASURE S3_TPLH  TRIG v(B[0]) VAL='supply*0.5' RISE=2  
+                 TARG v(S[3]) VAL='supply*0.5' RISE=3
.MEASURE S3_TPHL  TRIG v(B[0]) VAL='supply*0.5' FALL=2  
+                 TARG v(S[3]) VAL='supply*0.5' FALL=3

*.MEASURE S3_TPLH  TRIG v(B[0]) VAL='supply*0.5' RISE=1
*+                 TARG v(S[3]) VAL='supply*0.5' RISE=1
*.MEASURE S3_TPHL  TRIG v(B[0]) VAL='supply*0.5' FALL=1  
*+                 TARG v(S[3]) VAL='supply*0.5' FALL=1

***********************************
* Define Global Nets              *
***********************************
.GLOBAL VDD GND

***********************************
* Voltage Sources                 *
***********************************
vdd     VDD   0  DC supply
vss     VSS   0  DC 0
*** Digital Vector Input ***
.VEC "CLA.vec"


***********************************
* TOP Circuit                     *
***********************************

** Design Your Circuit Here **
XXOR01 A[0] B[0] P0   XOR2X1 
XAND01 A[0] B[0] G0   AND2X1
 
XXOR02 A[1] B[1] P1   XOR2X1 
XAND02 A[1] B[1] G1   AND2X1
 
XXOR03 A[2] B[2] P2   XOR2X1 
XAND03 A[2] B[2] G2   AND2X1
 
XXOR04 A[3] B[3] P3   XOR2X1 
XAND04 A[3] B[3] G3   AND2X1 

****** Start computing ******
*  First step is make c[0]  *
XAND2 P0   CIN  N0   AND2X1
XOR01 N0   G0   C[0] OR2X1
******************************
*  Second step is make c[1]  *
XAND3 P1 C[0] N1   AND2X1
XOR02 N1 G1   C[1] OR2X1
******************************
*  Third step is make c[2]   *
XAND4 P2 C[1] N2   AND2X1
XOR03 N2 G2   C[2] OR2X1
******************************
*  Forth step is make c[3]   *
XAND5 P3 C[2] N3   AND2X1
XOR04 N3 G3   C[3] OR2X1
******************************
*    Fifth step is make S    *
XXOR05 P0 CIN S[0] XOR2X1
XXOR06 P1 C[0] S[1] XOR2X1
XXOR07 P2 C[1] S[2] XOR2X1
XXOR08 P3 C[2] S[3] XOR2X1
***********Finish*************


***********************************
* Sub Circuit                     *
***********************************
.subckt XOR2X1  A B Y
Xnand1 A  B  o1 NAND2X1
Xnand2 A  o1 o2 NAND2X1
Xnand3 o1 B  o3 NAND2X1
Xnand4 o2 o3 Y  NAND2X1
.ends

.subckt AND2X1 A B Y
Xnand1 A B C NAND2X1
Xnot1  C   Y INV
.ends

.subckt NAND2X1 A B Y 
mM0 VDD  A  Y  VDD P_18_G2 L=1.8e-07 W=9.0e-07
mM1 VDD  B  Y  VDD P_18_G2 L=1.8e-07 W=9.0e-07
mM2 Y    A  n1 GND N_18_G2 L=1.8e-07 W=7.8e-07
mM3 n1   B GND GND N_18_G2 L=1.8e-07 W=7.8e-07
.ends

.subckt OR2X1 A B Y
Xnor1 A B C NOR2X1
Xnot1 C   Y INV
.ends

.subckt NOR2X1 A B Y
mM0 VDD A  n1  VDD P_18_G2 L=1.8e-07 W=9.0e-07
mM1 n1  B  Y   VDD P_18_G2 L=1.8e-07 W=9.0e-07
mM2 Y   A  GND GND N_18_G2 L=1.8e-07 W=7.8e-07
mM3 Y   B  GND GND N_18_G2 L=1.8e-07 W=7.8e-07
.ends

.subckt INV A Y
mM0 VDD A Y   VDD P_18_G2 L=1.8e-07 W=9.0e-07
mM1 Y   A GND GND N_18_G2 L=1.8e-07 W=6.0e-07
.ends



.ALTER
.PARAM supply=1.62v
.del lib "hspice_model.122" L18U18V_TT
.lib "hspice_model.122" L18U18V_SS
.TEMP 125

.ALTER
.PARAM supply=1.98v
.del lib "hspice_model.122" L18U18V_TT
.lib "hspice_model.122" L18U18V_FF
.TEMP 0

.end
