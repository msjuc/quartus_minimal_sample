module sample
(
  input x,y,z,w,
  output f
);
assign f = x ^ y&z | !w;
endmodule