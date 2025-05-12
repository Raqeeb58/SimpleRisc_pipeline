// Data Hazard Unit for a 5-stage RISC-V pipeline
// Handles forwarding from MEM and WB stages to EX stage

module data_hazard_unit(rst,isWb_M,isWb_RW,RD_M,RD_RW,RS1_E,RS2_E,forwardA_E,forwardB_E);
    input  rst;        // reset
    input  isWb_M;      // Write-back signal from MEM stage (1 if instruction writes to register)
    input  isWb_RW;     // Write-back signal from WB stage (1 if instruction writes to register)
    input  [3:0] RD_M;  // Destination register in MEM stage (4-bit register address)
    input  [3:0] RD_RW; // Destination register in WB stage (4-bit register address)
    input  [3:0] RS1_E; // Source register 1 in EX stage (4-bit register address)
    input  [3:0] RS2_E; // Source register 2 in EX stage (4-bit register address)
    output [1:0] forwardA_E; // Forwarding control for operand A (EX stage)
    output [1:0] forwardB_E ; // Forwarding control for operand B (EX stage)

// Forwarding logic for operand A (RS1)
assign forwardA_E = (rst == 1'b1) ? 2'b00 : 
                       ((isWb_M == 1'b1) &(RD_M !=4'b0) & (RD_M == RS1_E)) ? 2'b10 ://Forward from MEM stage
                       ((isWb_RW == 1'b1) &(RD_M !=4'b0) & (RD_RW == RS1_E)) ? 2'b01 : //Forward from WB stage
                        2'b00;
// Forwarding logic for operand B (RS2                       
assign forwardB_E = (rst == 1'b1) ? 2'b00 : 
                       ((isWb_M == 1'b1)  &(RD_RW!=4'b0)& (RD_M == RS2_E)) ? 2'b10 : // Forward from MEM stage
                       ((isWb_RW == 1'b1) &(RD_RW!=4'b0)& (RD_RW == RS2_E)) ? 2'b01 : //Forward from WB stage if
                        2'b00;
endmodule

