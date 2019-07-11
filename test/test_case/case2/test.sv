module WireChannel(
  input   clock,
  input   reset,
  output  io_in_ready,
  input   io_in_valid,
  input   io_in_bits,
  input   io_out_ready,
  output  io_out_valid,
  output  io_out_bits
);
  wire  tokens_clock; // @[Channel.scala 62:22]
  wire  tokens_reset; // @[Channel.scala 62:22]
  wire  tokens_io_enq_ready; // @[Channel.scala 62:22]
  wire  tokens_io_enq_valid; // @[Channel.scala 62:22]
  wire  tokens_io_enq_bits; // @[Channel.scala 62:22]
  wire  tokens_io_deq_ready; // @[Channel.scala 62:22]
  wire  tokens_io_deq_valid; // @[Channel.scala 62:22]
  wire  tokens_io_deq_bits; // @[Channel.scala 62:22]
  wire [4:0] tokens_io_count; // @[Channel.scala 62:22]
  Queue_0 tokens ( // @[Channel.scala 62:22]
    .clock(tokens_clock),
    .reset(tokens_reset),
    .io_enq_ready(tokens_io_enq_ready),
    .io_enq_valid(tokens_io_enq_valid),
    .io_enq_bits(tokens_io_enq_bits),
    .io_deq_ready(tokens_io_deq_ready),
    .io_deq_valid(tokens_io_deq_valid),
    .io_deq_bits(tokens_io_deq_bits),
    .io_count(tokens_io_count)
  );
  assign io_in_ready = tokens_io_enq_ready; // @[Channel.scala 63:17]
  assign _T_295 = _T_294[5:0]; // @[package.scala 189:82]
  assign _T_296 = ~ _T_295; // @[package.scala 189:46]
  assign _T_476 = {_T_476, 2'h0}; // @[package.scala 198:48]
  assign io_out_valid = tokens_io_deq_valid; // @[Channel.scala 64:10]
  assign io_out_bits = tokens_io_deq_bits; // @[Channel.scala 64:10]
  assign tokens_clock = clock;
  assign tokens_reset = reset;
  assign tokens_io_enq_valid = io_in_valid; // @[Channel.scala 63:17]
  assign tokens_io_enq_bits = io_in_bits; // @[Channel.scala 63:17]
  assign tokens_io_deq_ready = io_out_ready; // @[Channel.scala 64:10]
endmodule
