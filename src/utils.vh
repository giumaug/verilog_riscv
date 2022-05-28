`define ABS(VAL, LEN) ((VAL[LEN - 1] == 0) ? VAL : ( ~ (VAL - 1)))
`define SIGN_EXTEND(VAL, CUR_LEN, NEW_LEN) {{(NEW_LEN - CUR_LEN){VAL[CUR_LEN - 1]}}, VAL}
`define ZERO_EXTEND(VAL, CUR_LEN, NEW_LEN) {{(NEW_LEN - CUR_LEN){1'b0}}, VAL}
`define SIGNED(a) $signed(a)
`define UNSIGNED(a) $unsigned(a)

