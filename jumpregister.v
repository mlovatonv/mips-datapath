module jregister(func, jar);

input [0:5] func;
output reg jar;

always @(*)
    jar = func == 6'b001000 ? 1: 0;

endmodule