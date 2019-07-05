module SignExtend(in, out);
input [0:15] in;
output reg[0:31] out;

always@(*)begin
    out = in;
    if(in>32767) begin
        out[0:15] = 16'hffff;
    end
end

endmodule

module SignExtend26(in, out);
input [0:25] in;
output [0:31] out;

assign out = in;

endmodule
