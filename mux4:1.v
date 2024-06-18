module mux_example(
  input [1:0] sel,
  input  i0,i1,i2,i3,
  output reg y);
    
  always @(*) begin
    case(sel)
      2'h0: y = i0;
      2'h1: y = i1;
      2'h2: y = i2;
      2'h3: y = i3;
      default: $display("Invalid sel input");
    endcase
  end
endmodule

// testbench
module tb;
  reg [1:0] sel;
  reg i0,i1,i2,i3;
  wire y;
  
  mux_example mux(sel, i0, i1, i2, i3, y);
  
  initial begin
    $monitor("sel = %b -> i3 = %0b, i2 = %0b ,i1 = %0b, i0 = %0b -> y = %0b", sel,i3,i2,i1,i0, y);
    {i3,i2,i1,i0} = 4'h5;
    repeat(6) begin
      sel = $random;
      #5;
    end
  end
endmodule
