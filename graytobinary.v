module g2b_converter #(parameter WIDTH=4) (input [WIDTH-1:0] gray, output [WIDTH-1:0] binary);
  /*
  assign binary[0] = gray[3] ^ gray[2] ^ gray[1] ^ gray[0];
  assign binary[1] = gray[3] ^ gray[2] ^ gray[1];
  assign binary[2] = gray[3] ^ gray[2];
  assign binary[3] = gray[3];
  */
  // OR
  genvar i;
  generate
    for(i=0;i<WIDTH;i++) begin
      assign binary[i] = ^(gray >> i);
    end
  endgenerate
endmodule
// testbech
module TB;
  reg [3:0] binary, gray;
  g2b_converter g2b(gray, binary);
  
  initial begin
    $monitor("Gray = %b --> Binary = %b", gray, binary);
    gray = 4'b1110; #1;
    gray = 4'b0100; #1;
    gray = 4'b0111; #1;
    gray = 4'b1010; #1;
    gray = 4'b1000;
  end
endmodule
