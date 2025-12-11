`timescale 1ns / 1ps

module tb_rotating_square;

    // inputs
    logic clk;
    logic rst;
    logic en;
    logic cw;
    
    // outputs
    logic [3:0] an;
    logic [7:0] sseg;

    // 
    rotating_square dut(
        .clk(clk), 
        .rst(rst), 
        .en(en), 
        .cw(cw), 
        .an(an), 
        .sseg(sseg)
    );

    // force parameter to 3 for this test bench
    defparam dut.counter.N = 3; 

    // clk generation
    always #5 clk = ~clk; 

    initial begin
        clk = 0;
        rst = 1;
        en = 0;
        cw = 1;

        #100;
        
        //rst
        rst = 0;
        #20;
        //enable and cw
        en = 1;
        cw = 1;
        #200;
        
        // change direction
        cw = 0;
        #200;
        
        // enable off
        en = 0;
        #100;
        
        //enable on 
        en = 1;
        #100;

        $stop;
    end
      
endmodule