function [11:0] imm_12_b(input[31:0] word);
	begin
		imm_12_b = {word[31], word[7], word[30:25], word[11:8]};
	end
endfunction

function [11:0] imm_12_s(input[31:0] word);
	begin
		imm_12_s = {word[31,25], word[11,7]};
	end
endfunction

function [11:0] imm_12_i(input[31:0] word);
	begin
		imm_12_i = word[31,20];
	end
endfunction

function [20:0] imm_20(input[31:0] word);
	begin
		imm_20 = {word[31], word[19:12], word[20], word[30:21]};
	end
endfunction

function signed_compare(input[31:0] op_1, input[31:0] op_2);
	begin
		signed_compare = op_1 > op_2 ? 1 : 0;
	end
endfunction

function abs(input[31:0] a, input[31:0] b)
    begin
    end
endfunction    

reg a [31:0];
reg b [31:0];
always@(*)
begin
if (a[31]==1'b1)
b[31:0]={1'b1,a[30:0]};
else b [31:0]=a [31:0];
end

e' lo stesso ???eee
//Note: if imm is two complement negative number, the positive value is zeroExtend( ~ (imm - 1))





