module TLXbar_6(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [3:0]  auto_in_a_bits_size,
  input  [2:0]  auto_in_a_bits_source,
  input  [30:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [3:0]  auto_in_d_bits_size,
  output [2:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_5_a_ready,
  output        auto_out_5_a_valid,
  output [2:0]  auto_out_5_a_bits_size,
  output [2:0]  auto_out_5_a_bits_source,
  output [16:0] auto_out_5_a_bits_address,
  output [7:0]  auto_out_5_a_bits_mask,
  output        auto_out_5_d_ready,
  input         auto_out_5_d_valid,
  input  [2:0]  auto_out_5_d_bits_size,
  input  [2:0]  auto_out_5_d_bits_source,
  input  [63:0] auto_out_5_d_bits_data,
  input         auto_out_4_a_ready,
  output        auto_out_4_a_valid,
  output [2:0]  auto_out_4_a_bits_opcode,
  output [2:0]  auto_out_4_a_bits_param,
  output [2:0]  auto_out_4_a_bits_size,
  output [2:0]  auto_out_4_a_bits_source,
  output [30:0] auto_out_4_a_bits_address,
  output [7:0]  auto_out_4_a_bits_mask,
  output [63:0] auto_out_4_a_bits_data,
  output        auto_out_4_a_bits_corrupt,
  output        auto_out_4_d_ready,
  input         auto_out_4_d_valid,
  input  [2:0]  auto_out_4_d_bits_opcode,
  input  [1:0]  auto_out_4_d_bits_param,
  input  [2:0]  auto_out_4_d_bits_size,
  input  [2:0]  auto_out_4_d_bits_source,
  input         auto_out_4_d_bits_sink,
  input         auto_out_4_d_bits_denied,
  input  [63:0] auto_out_4_d_bits_data,
  input         auto_out_4_d_bits_corrupt,
  input         auto_out_3_a_ready,
  output        auto_out_3_a_valid,
  output [2:0]  auto_out_3_a_bits_opcode,
  output [2:0]  auto_out_3_a_bits_size,
  output [2:0]  auto_out_3_a_bits_source,
  output [11:0] auto_out_3_a_bits_address,
  output [7:0]  auto_out_3_a_bits_mask,
  output [63:0] auto_out_3_a_bits_data,
  output        auto_out_3_d_ready,
  input         auto_out_3_d_valid,
  input  [2:0]  auto_out_3_d_bits_opcode,
  input  [2:0]  auto_out_3_d_bits_size,
  input  [2:0]  auto_out_3_d_bits_source,
  input  [63:0] auto_out_3_d_bits_data,
  input         auto_out_2_a_ready,
  output        auto_out_2_a_valid,
  output [2:0]  auto_out_2_a_bits_opcode,
  output [2:0]  auto_out_2_a_bits_size,
  output [2:0]  auto_out_2_a_bits_source,
  output [25:0] auto_out_2_a_bits_address,
  output [7:0]  auto_out_2_a_bits_mask,
  output [63:0] auto_out_2_a_bits_data,
  output        auto_out_2_d_ready,
  input         auto_out_2_d_valid,
  input  [2:0]  auto_out_2_d_bits_opcode,
  input  [2:0]  auto_out_2_d_bits_size,
  input  [2:0]  auto_out_2_d_bits_source,
  input  [63:0] auto_out_2_d_bits_data,
  input         auto_out_1_a_ready,
  output        auto_out_1_a_valid,
  output [2:0]  auto_out_1_a_bits_opcode,
  output [2:0]  auto_out_1_a_bits_size,
  output [2:0]  auto_out_1_a_bits_source,
  output [27:0] auto_out_1_a_bits_address,
  output [7:0]  auto_out_1_a_bits_mask,
  output [63:0] auto_out_1_a_bits_data,
  output        auto_out_1_d_ready,
  input         auto_out_1_d_valid,
  input  [2:0]  auto_out_1_d_bits_opcode,
  input  [2:0]  auto_out_1_d_bits_size,
  input  [2:0]  auto_out_1_d_bits_source,
  input  [63:0] auto_out_1_d_bits_data,
  input         auto_out_0_a_ready,
  output        auto_out_0_a_valid,
  output [2:0]  auto_out_0_a_bits_opcode,
  output [3:0]  auto_out_0_a_bits_size,
  output [2:0]  auto_out_0_a_bits_source,
  output        auto_out_0_d_ready,
  input         auto_out_0_d_valid,
  input  [2:0]  auto_out_0_d_bits_opcode,
  input  [1:0]  auto_out_0_d_bits_param,
  input  [3:0]  auto_out_0_d_bits_size,
  input  [2:0]  auto_out_0_d_bits_source,
  input         auto_out_0_d_bits_sink,
  input         auto_out_0_d_bits_denied,
  input  [63:0] auto_out_0_d_bits_data,
  input         auto_out_0_d_bits_corrupt,
  input         targetFire
);
  reg [8:0] _T_438; // @[Arbiter.scala 53:30]
  reg [31:0] _RAND_0;
  wire  _T_439; // @[Arbiter.scala 54:28]
  wire [5:0] _T_445; // @[Cat.scala 30:58]
  reg [5:0] _T_452; // @[Arbiter.scala 20:23]
  reg [31:0] _RAND_1;
  wire [5:0] _T_453; // @[Arbiter.scala 21:30]
  wire [5:0] _T_454; // @[Arbiter.scala 21:28]
  wire [11:0] _T_455; // @[Cat.scala 30:58]
  wire [10:0] _T_456; // @[package.scala 207:48]
  wire [11:0] _GEN_9; // @[package.scala 207:43]
  wire [11:0] _T_457; // @[package.scala 207:43]
  wire [9:0] _T_458; // @[package.scala 207:48]
  wire [11:0] _GEN_10; // @[package.scala 207:43]
  wire [11:0] _T_459; // @[package.scala 207:43]
  wire [7:0] _T_460; // @[package.scala 207:48]
  wire [11:0] _GEN_11; // @[package.scala 207:43]
  wire [11:0] _T_461; // @[package.scala 207:43]
  wire [10:0] _T_463; // @[Arbiter.scala 22:52]
  wire [11:0] _T_464; // @[Arbiter.scala 22:66]
  wire [11:0] _GEN_12; // @[Arbiter.scala 22:58]
  wire [11:0] _T_465; // @[Arbiter.scala 22:58]
  wire [5:0] _T_466; // @[Arbiter.scala 23:29]
  wire [5:0] _T_467; // @[Arbiter.scala 23:48]
  wire [5:0] _T_468; // @[Arbiter.scala 23:39]
  wire [5:0] _T_469; // @[Arbiter.scala 23:18]
  wire  _T_484; // @[Arbiter.scala 60:72]
  wire  _T_491; // @[Arbiter.scala 62:65]
  reg  _T_561_0; // @[Arbiter.scala 78:26]
  reg [31:0] _RAND_2;
  wire  _T_562_0; // @[Arbiter.scala 79:25]
  wire [78:0] _T_594; // @[Mux.scala 28:72]
  wire [78:0] _T_595; // @[Mux.scala 28:72]
  wire  _T_485; // @[Arbiter.scala 60:72]
  wire  _T_492; // @[Arbiter.scala 62:65]
  reg  _T_561_1; // @[Arbiter.scala 78:26]
  reg [31:0] _RAND_3;
  wire  _T_562_1; // @[Arbiter.scala 79:25]
  wire [3:0] out_1_d_bits_size; // @[Xbar.scala 154:19 Xbar.scala 180:18]
  wire [78:0] _T_602; // @[Mux.scala 28:72]
  wire [78:0] _T_603; // @[Mux.scala 28:72]
  wire [78:0] _T_636; // @[Mux.scala 28:72]
  wire  _T_486; // @[Arbiter.scala 60:72]
  wire  _T_493; // @[Arbiter.scala 62:65]
  reg  _T_561_2; // @[Arbiter.scala 78:26]
  reg [31:0] _RAND_4;
  wire  _T_562_2; // @[Arbiter.scala 79:25]
  wire [3:0] out_2_d_bits_size; // @[Xbar.scala 154:19 Xbar.scala 180:18]
  wire [78:0] _T_610; // @[Mux.scala 28:72]
  wire [78:0] _T_611; // @[Mux.scala 28:72]
  wire [78:0] _T_637; // @[Mux.scala 28:72]
  wire  _T_487; // @[Arbiter.scala 60:72]
  wire  _T_494; // @[Arbiter.scala 62:65]
  reg  _T_561_3; // @[Arbiter.scala 78:26]
  reg [31:0] _RAND_5;
  wire  _T_562_3; // @[Arbiter.scala 79:25]
  wire [3:0] out_3_d_bits_size; // @[Xbar.scala 154:19 Xbar.scala 180:18]
  wire [78:0] _T_618; // @[Mux.scala 28:72]
  wire [78:0] _T_619; // @[Mux.scala 28:72]
  wire [78:0] _T_638; // @[Mux.scala 28:72]
  wire  _T_488; // @[Arbiter.scala 60:72]
  wire  _T_495; // @[Arbiter.scala 62:65]
  reg  _T_561_4; // @[Arbiter.scala 78:26]
  reg [31:0] _RAND_6;
  wire  _T_562_4; // @[Arbiter.scala 79:25]
  wire [3:0] out_4_d_bits_size; // @[Xbar.scala 154:19 Xbar.scala 180:18]
  wire [78:0] _T_626; // @[Mux.scala 28:72]
  wire [78:0] _T_627; // @[Mux.scala 28:72]
  wire [78:0] _T_639; // @[Mux.scala 28:72]
  wire  _T_489; // @[Arbiter.scala 60:72]
  wire  _T_496; // @[Arbiter.scala 62:65]
  reg  _T_561_5; // @[Arbiter.scala 78:26]
  reg [31:0] _RAND_7;
  wire  _T_562_5; // @[Arbiter.scala 79:25]
  wire [3:0] out_5_d_bits_size; // @[Xbar.scala 154:19 Xbar.scala 180:18]
  wire [78:0] _T_634; // @[Mux.scala 28:72]
  wire [78:0] _T_635; // @[Mux.scala 28:72]
  wire [78:0] _T_640; // @[Mux.scala 28:72]
  wire [30:0] _T_51; // @[Parameters.scala 122:31]
  wire [31:0] _T_52; // @[Parameters.scala 122:49]
  wire [31:0] _T_53; // @[Parameters.scala 122:52]
  wire [31:0] _T_54; // @[Parameters.scala 122:52]
  wire  requestAIO_0_0; // @[Parameters.scala 122:67]
  wire [30:0] _T_56; // @[Parameters.scala 122:31]
  wire [31:0] _T_57; // @[Parameters.scala 122:49]
  wire [31:0] _T_58; // @[Parameters.scala 122:52]
  wire [31:0] _T_59; // @[Parameters.scala 122:52]
  wire  requestAIO_0_1; // @[Parameters.scala 122:67]
  wire [30:0] _T_61; // @[Parameters.scala 122:31]
  wire [31:0] _T_62; // @[Parameters.scala 122:49]
  wire [31:0] _T_63; // @[Parameters.scala 122:52]
  wire [31:0] _T_64; // @[Parameters.scala 122:52]
  wire  requestAIO_0_2; // @[Parameters.scala 122:67]
  wire [31:0] _T_67; // @[Parameters.scala 122:49]
  wire [31:0] _T_68; // @[Parameters.scala 122:52]
  wire [31:0] _T_69; // @[Parameters.scala 122:52]
  wire  requestAIO_0_3; // @[Parameters.scala 122:67]
  wire [30:0] _T_71; // @[Parameters.scala 122:31]
  wire [31:0] _T_72; // @[Parameters.scala 122:49]
  wire [31:0] _T_73; // @[Parameters.scala 122:52]
  wire [31:0] _T_74; // @[Parameters.scala 122:52]
  wire  requestAIO_0_4; // @[Parameters.scala 122:67]
  wire [30:0] _T_76; // @[Parameters.scala 122:31]
  wire [31:0] _T_77; // @[Parameters.scala 122:49]
  wire [31:0] _T_78; // @[Parameters.scala 122:52]
  wire [31:0] _T_79; // @[Parameters.scala 122:52]
  wire  requestAIO_0_5; // @[Parameters.scala 122:67]
  wire [26:0] _T_270; // @[package.scala 189:77]
  wire [11:0] _T_271; // @[package.scala 189:82]
  wire [11:0] _T_272; // @[package.scala 189:46]
  wire [8:0] _T_273; // @[Edges.scala 221:59]
  wire  _T_274; // @[Edges.scala 107:36]
  wire [8:0] beatsDO_0; // @[Edges.scala 222:14]
  wire [20:0] _T_276; // @[package.scala 189:77]
  wire [5:0] _T_277; // @[package.scala 189:82]
  wire [5:0] _T_278; // @[package.scala 189:46]
  wire [2:0] _T_279; // @[Edges.scala 221:59]
  wire  _T_280; // @[Edges.scala 107:36]
  wire [2:0] beatsDO_1; // @[Edges.scala 222:14]
  wire [20:0] _T_282; // @[package.scala 189:77]
  wire [5:0] _T_283; // @[package.scala 189:82]
  wire [5:0] _T_284; // @[package.scala 189:46]
  wire [2:0] _T_285; // @[Edges.scala 221:59]
  wire  _T_286; // @[Edges.scala 107:36]
  wire [2:0] beatsDO_2; // @[Edges.scala 222:14]
  wire [20:0] _T_288; // @[package.scala 189:77]
  wire [5:0] _T_289; // @[package.scala 189:82]
  wire [5:0] _T_290; // @[package.scala 189:46]
  wire [2:0] _T_291; // @[Edges.scala 221:59]
  wire  _T_292; // @[Edges.scala 107:36]
  wire [2:0] beatsDO_3; // @[Edges.scala 222:14]
  wire [20:0] _T_294; // @[package.scala 189:77]
  wire [5:0] _T_295; // @[package.scala 189:82]
  wire [5:0] _T_296; // @[package.scala 189:46]
  wire [2:0] _T_297; // @[Edges.scala 221:59]
  wire  _T_298; // @[Edges.scala 107:36]
  wire [2:0] beatsDO_4; // @[Edges.scala 222:14]
  wire [20:0] _T_300; // @[package.scala 189:77]
  wire [5:0] _T_301; // @[package.scala 189:82]
  wire [5:0] _T_302; // @[package.scala 189:46]
  wire [2:0] beatsDO_5; // @[Edges.scala 221:59]
  wire  _T_319; // @[Mux.scala 28:72]
  wire  _T_320; // @[Mux.scala 28:72]
  wire  _T_321; // @[Mux.scala 28:72]
  wire  _T_322; // @[Mux.scala 28:72]
  wire  _T_323; // @[Mux.scala 28:72]
  wire  _T_324; // @[Mux.scala 28:72]
  wire  _T_325; // @[Mux.scala 28:72]
  wire  _T_326; // @[Mux.scala 28:72]
  wire  _T_327; // @[Mux.scala 28:72]
  wire  _T_328; // @[Mux.scala 28:72]
  wire  _T_440; // @[Arbiter.scala 55:24]
  wire  _T_447; // @[Arbiter.scala 19:19]
  wire  _T_449; // @[Arbiter.scala 19:12]
  wire  _T_450; // @[Arbiter.scala 19:12]
  wire  _T_470; // @[Arbiter.scala 24:27]
  wire  _T_471; // @[Arbiter.scala 24:18]
  wire [5:0] _T_472; // @[Arbiter.scala 25:29]
  wire [6:0] _T_473; // @[package.scala 198:48]
  wire [5:0] _T_474; // @[package.scala 198:53]
  wire [5:0] _T_475; // @[package.scala 198:43]
  wire [7:0] _T_476; // @[package.scala 198:48]
  wire [5:0] _T_477; // @[package.scala 198:53]
  wire [5:0] _T_478; // @[package.scala 198:43]
  wire [9:0] _T_479; // @[package.scala 198:48]
  wire [5:0] _T_480; // @[package.scala 198:53]
  wire [5:0] _T_481; // @[package.scala 198:43]
  wire  _T_499; // @[Arbiter.scala 67:52]
  wire  _T_500; // @[Arbiter.scala 67:52]
  wire  _T_501; // @[Arbiter.scala 67:52]
  wire  _T_502; // @[Arbiter.scala 67:52]
  wire  _T_503; // @[Arbiter.scala 67:52]
  wire  _T_505; // @[Arbiter.scala 68:62]
  wire  _T_508; // @[Arbiter.scala 68:62]
  wire  _T_509; // @[Arbiter.scala 68:59]
  wire  _T_510; // @[Arbiter.scala 68:56]
  wire  _T_511; // @[Arbiter.scala 68:62]
  wire  _T_512; // @[Arbiter.scala 68:59]
  wire  _T_513; // @[Arbiter.scala 68:56]
  wire  _T_514; // @[Arbiter.scala 68:62]
  wire  _T_515; // @[Arbiter.scala 68:59]
  wire  _T_516; // @[Arbiter.scala 68:56]
  wire  _T_517; // @[Arbiter.scala 68:62]
  wire  _T_518; // @[Arbiter.scala 68:59]
  wire  _T_519; // @[Arbiter.scala 68:56]
  wire  _T_520; // @[Arbiter.scala 68:62]
  wire  _T_521; // @[Arbiter.scala 68:59]
  wire  _T_523; // @[Arbiter.scala 68:77]
  wire  _T_524; // @[Arbiter.scala 68:77]
  wire  _T_525; // @[Arbiter.scala 68:77]
  wire  _T_526; // @[Arbiter.scala 68:77]
  wire  _T_528; // @[Arbiter.scala 68:13]
  wire  _T_529; // @[Arbiter.scala 68:13]
  wire  _T_530; // @[Arbiter.scala 70:31]
  wire  _T_531; // @[Arbiter.scala 70:31]
  wire  _T_532; // @[Arbiter.scala 70:31]
  wire  _T_533; // @[Arbiter.scala 70:31]
  wire  _T_534; // @[Arbiter.scala 70:31]
  wire  _T_535; // @[Arbiter.scala 70:15]
  wire  _T_541; // @[Arbiter.scala 70:36]
  wire  _T_543; // @[Arbiter.scala 70:14]
  wire  _T_544; // @[Arbiter.scala 70:14]
  wire [8:0] _T_545; // @[Arbiter.scala 73:69]
  wire [2:0] _T_546; // @[Arbiter.scala 73:69]
  wire [2:0] _T_547; // @[Arbiter.scala 73:69]
  wire [2:0] _T_548; // @[Arbiter.scala 73:69]
  wire [2:0] _T_549; // @[Arbiter.scala 73:69]
  wire [2:0] _T_550; // @[Arbiter.scala 73:69]
  wire [8:0] _GEN_13; // @[Arbiter.scala 74:44]
  wire [8:0] _T_551; // @[Arbiter.scala 74:44]
  wire [8:0] _GEN_14; // @[Arbiter.scala 74:44]
  wire [8:0] _T_552; // @[Arbiter.scala 74:44]
  wire [8:0] _GEN_15; // @[Arbiter.scala 74:44]
  wire [8:0] _T_553; // @[Arbiter.scala 74:44]
  wire [8:0] _GEN_16; // @[Arbiter.scala 74:44]
  wire [8:0] _T_554; // @[Arbiter.scala 74:44]
  wire [8:0] _GEN_17; // @[Arbiter.scala 74:44]
  wire [8:0] _T_555; // @[Arbiter.scala 74:44]
  wire  _T_575; // @[Mux.scala 28:72]
  wire  _T_576; // @[Mux.scala 28:72]
  wire  _T_581; // @[Mux.scala 28:72]
  wire  _T_577; // @[Mux.scala 28:72]
  wire  _T_582; // @[Mux.scala 28:72]
  wire  _T_578; // @[Mux.scala 28:72]
  wire  _T_583; // @[Mux.scala 28:72]
  wire  _T_579; // @[Mux.scala 28:72]
  wire  _T_584; // @[Mux.scala 28:72]
  wire  _T_580; // @[Mux.scala 28:72]
  wire  _T_585; // @[Mux.scala 28:72]
  wire  in_0_d_valid; // @[Arbiter.scala 86:24]
  wire  _T_556; // @[Decoupled.scala 37:37]
  wire [8:0] _GEN_18; // @[Arbiter.scala 75:52]
  wire [8:0] _T_558; // @[Arbiter.scala 75:52]
  wire  _T_563_0; // @[Arbiter.scala 82:24]
  wire  _T_563_1; // @[Arbiter.scala 82:24]
  wire  _T_563_2; // @[Arbiter.scala 82:24]
  wire  _T_563_3; // @[Arbiter.scala 82:24]
  wire  _T_563_4; // @[Arbiter.scala 82:24]
  wire  _T_563_5; // @[Arbiter.scala 82:24]
  assign _T_439 = _T_438 == 9'h0; // @[Arbiter.scala 54:28]
  assign _T_445 = {auto_out_5_d_valid,auto_out_4_d_valid,auto_out_3_d_valid,auto_out_2_d_valid,auto_out_1_d_valid,auto_out_0_d_valid}; // @[Cat.scala 30:58]
  assign _T_453 = ~ _T_452; // @[Arbiter.scala 21:30]
  assign _T_454 = _T_445 & _T_453; // @[Arbiter.scala 21:28]
  assign _T_455 = {_T_454,auto_out_5_d_valid,auto_out_4_d_valid,auto_out_3_d_valid,auto_out_2_d_valid,auto_out_1_d_valid,auto_out_0_d_valid}; // @[Cat.scala 30:58]
  assign _T_456 = _T_455[11:1]; // @[package.scala 207:48]
  assign _GEN_9 = {{1'd0}, _T_456}; // @[package.scala 207:43]
  assign _T_457 = _T_455 | _GEN_9; // @[package.scala 207:43]
  assign _T_458 = _T_457[11:2]; // @[package.scala 207:48]
  assign _GEN_10 = {{2'd0}, _T_458}; // @[package.scala 207:43]
  assign _T_459 = _T_457 | _GEN_10; // @[package.scala 207:43]
  assign _T_460 = _T_459[11:4]; // @[package.scala 207:48]
  assign _GEN_11 = {{4'd0}, _T_460}; // @[package.scala 207:43]
  assign _T_461 = _T_459 | _GEN_11; // @[package.scala 207:43]
  assign _T_463 = _T_461[11:1]; // @[Arbiter.scala 22:52]
  assign _T_464 = {_T_452, 6'h0}; // @[Arbiter.scala 22:66]
  assign _GEN_12 = {{1'd0}, _T_463}; // @[Arbiter.scala 22:58]
  assign _T_465 = _GEN_12 | _T_464; // @[Arbiter.scala 22:58]
  assign _T_466 = _T_465[11:6]; // @[Arbiter.scala 23:29]
  assign _T_467 = _T_465[5:0]; // @[Arbiter.scala 23:48]
  assign _T_468 = _T_466 & _T_467; // @[Arbiter.scala 23:39]
  assign _T_469 = ~ _T_468; // @[Arbiter.scala 23:18]
  assign _T_484 = _T_469[0]; // @[Arbiter.scala 60:72]
  assign _T_491 = _T_484 & auto_out_0_d_valid; // @[Arbiter.scala 62:65]
  assign _T_562_0 = _T_439 ? _T_491 : _T_561_0; // @[Arbiter.scala 79:25]
  assign _T_594 = {auto_out_0_d_bits_opcode,auto_out_0_d_bits_param,auto_out_0_d_bits_size,auto_out_0_d_bits_source,auto_out_0_d_bits_sink,auto_out_0_d_bits_denied,auto_out_0_d_bits_data,auto_out_0_d_bits_corrupt}; // @[Mux.scala 28:72]
  assign _T_595 = _T_562_0 ? _T_594 : 79'h0; // @[Mux.scala 28:72]
  assign _T_485 = _T_469[1]; // @[Arbiter.scala 60:72]
  assign _T_492 = _T_485 & auto_out_1_d_valid; // @[Arbiter.scala 62:65]
  assign _T_562_1 = _T_439 ? _T_492 : _T_561_1; // @[Arbiter.scala 79:25]
  assign out_1_d_bits_size = {{1'd0}, auto_out_1_d_bits_size}; // @[Xbar.scala 154:19 Xbar.scala 180:18]
  assign _T_602 = {auto_out_1_d_bits_opcode,2'h0,out_1_d_bits_size,auto_out_1_d_bits_source,2'h0,auto_out_1_d_bits_data,1'h0}; // @[Mux.scala 28:72]
  assign _T_603 = _T_562_1 ? _T_602 : 79'h0; // @[Mux.scala 28:72]
  assign _T_636 = _T_595 | _T_603; // @[Mux.scala 28:72]
  assign _T_486 = _T_469[2]; // @[Arbiter.scala 60:72]
  assign _T_493 = _T_486 & auto_out_2_d_valid; // @[Arbiter.scala 62:65]
  assign _T_562_2 = _T_439 ? _T_493 : _T_561_2; // @[Arbiter.scala 79:25]
  assign out_2_d_bits_size = {{1'd0}, auto_out_2_d_bits_size}; // @[Xbar.scala 154:19 Xbar.scala 180:18]
  assign _T_610 = {auto_out_2_d_bits_opcode,2'h0,out_2_d_bits_size,auto_out_2_d_bits_source,2'h0,auto_out_2_d_bits_data,1'h0}; // @[Mux.scala 28:72]
  assign _T_611 = _T_562_2 ? _T_610 : 79'h0; // @[Mux.scala 28:72]
  assign _T_637 = _T_636 | _T_611; // @[Mux.scala 28:72]
  assign _T_487 = _T_469[3]; // @[Arbiter.scala 60:72]
  assign _T_494 = _T_487 & auto_out_3_d_valid; // @[Arbiter.scala 62:65]
  assign _T_562_3 = _T_439 ? _T_494 : _T_561_3; // @[Arbiter.scala 79:25]
  assign out_3_d_bits_size = {{1'd0}, auto_out_3_d_bits_size}; // @[Xbar.scala 154:19 Xbar.scala 180:18]
  assign _T_618 = {auto_out_3_d_bits_opcode,2'h0,out_3_d_bits_size,auto_out_3_d_bits_source,2'h0,auto_out_3_d_bits_data,1'h0}; // @[Mux.scala 28:72]
  assign _T_619 = _T_562_3 ? _T_618 : 79'h0; // @[Mux.scala 28:72]
  assign _T_638 = _T_637 | _T_619; // @[Mux.scala 28:72]
  assign _T_488 = _T_469[4]; // @[Arbiter.scala 60:72]
  assign _T_495 = _T_488 & auto_out_4_d_valid; // @[Arbiter.scala 62:65]
  assign _T_562_4 = _T_439 ? _T_495 : _T_561_4; // @[Arbiter.scala 79:25]
  assign out_4_d_bits_size = {{1'd0}, auto_out_4_d_bits_size}; // @[Xbar.scala 154:19 Xbar.scala 180:18]
  assign _T_626 = {auto_out_4_d_bits_opcode,auto_out_4_d_bits_param,out_4_d_bits_size,auto_out_4_d_bits_source,auto_out_4_d_bits_sink,auto_out_4_d_bits_denied,auto_out_4_d_bits_data,auto_out_4_d_bits_corrupt}; // @[Mux.scala 28:72]
  assign _T_627 = _T_562_4 ? _T_626 : 79'h0; // @[Mux.scala 28:72]
  assign _T_639 = _T_638 | _T_627; // @[Mux.scala 28:72]
  assign _T_489 = _T_469[5]; // @[Arbiter.scala 60:72]
  assign _T_496 = _T_489 & auto_out_5_d_valid; // @[Arbiter.scala 62:65]
  assign _T_562_5 = _T_439 ? _T_496 : _T_561_5; // @[Arbiter.scala 79:25]
  assign out_5_d_bits_size = {{1'd0}, auto_out_5_d_bits_size}; // @[Xbar.scala 154:19 Xbar.scala 180:18]
  assign _T_634 = {5'h4,out_5_d_bits_size,auto_out_5_d_bits_source,2'h0,auto_out_5_d_bits_data,1'h0}; // @[Mux.scala 28:72]
  assign _T_635 = _T_562_5 ? _T_634 : 79'h0; // @[Mux.scala 28:72]
  assign _T_640 = _T_639 | _T_635; // @[Mux.scala 28:72]
  assign _T_51 = auto_in_a_bits_address ^ 31'h2000; // @[Parameters.scala 122:31]
  assign _T_52 = {1'b0,$signed(_T_51)}; // @[Parameters.scala 122:49]
  assign _T_53 = $signed(_T_52) & $signed(32'sh1a012000); // @[Parameters.scala 122:52]
  assign _T_54 = $signed(_T_53); // @[Parameters.scala 122:52]
  assign requestAIO_0_0 = $signed(_T_54) == $signed(32'sh0); // @[Parameters.scala 122:67]
  assign _T_56 = auto_in_a_bits_address ^ 31'h8000000; // @[Parameters.scala 122:31]
  assign _T_57 = {1'b0,$signed(_T_56)}; // @[Parameters.scala 122:49]
  assign _T_58 = $signed(_T_57) & $signed(32'sh18000000); // @[Parameters.scala 122:52]
  assign _T_59 = $signed(_T_58); // @[Parameters.scala 122:52]
  assign requestAIO_0_1 = $signed(_T_59) == $signed(32'sh0); // @[Parameters.scala 122:67]
  assign _T_61 = auto_in_a_bits_address ^ 31'h2000000; // @[Parameters.scala 122:31]
  assign _T_62 = {1'b0,$signed(_T_61)}; // @[Parameters.scala 122:49]
  assign _T_63 = $signed(_T_62) & $signed(32'sh1a010000); // @[Parameters.scala 122:52]
  assign _T_64 = $signed(_T_63); // @[Parameters.scala 122:52]
  assign requestAIO_0_2 = $signed(_T_64) == $signed(32'sh0); // @[Parameters.scala 122:67]
  assign _T_67 = {1'b0,$signed(auto_in_a_bits_address)}; // @[Parameters.scala 122:49]
  assign _T_68 = $signed(_T_67) & $signed(32'sh1a012000); // @[Parameters.scala 122:52]
  assign _T_69 = $signed(_T_68); // @[Parameters.scala 122:52]
  assign requestAIO_0_3 = $signed(_T_69) == $signed(32'sh0); // @[Parameters.scala 122:67]
  assign _T_71 = auto_in_a_bits_address ^ 31'h10000000; // @[Parameters.scala 122:31]
  assign _T_72 = {1'b0,$signed(_T_71)}; // @[Parameters.scala 122:49]
  assign _T_73 = $signed(_T_72) & $signed(32'sh1a002000); // @[Parameters.scala 122:52]
  assign _T_74 = $signed(_T_73); // @[Parameters.scala 122:52]
  assign requestAIO_0_4 = $signed(_T_74) == $signed(32'sh0); // @[Parameters.scala 122:67]
  assign _T_76 = auto_in_a_bits_address ^ 31'h10000; // @[Parameters.scala 122:31]
  assign _T_77 = {1'b0,$signed(_T_76)}; // @[Parameters.scala 122:49]
  assign _T_78 = $signed(_T_77) & $signed(32'sh1a010000); // @[Parameters.scala 122:52]
  assign _T_79 = $signed(_T_78); // @[Parameters.scala 122:52]
  assign requestAIO_0_5 = $signed(_T_79) == $signed(32'sh0); // @[Parameters.scala 122:67]
  assign _T_270 = 27'hfff << auto_out_0_d_bits_size; // @[package.scala 189:77]
  assign _T_271 = _T_270[11:0]; // @[package.scala 189:82]
  assign _T_272 = ~ _T_271; // @[package.scala 189:46]
  assign _T_273 = _T_272[11:3]; // @[Edges.scala 221:59]
  assign _T_274 = auto_out_0_d_bits_opcode[0]; // @[Edges.scala 107:36]
  assign beatsDO_0 = _T_274 ? _T_273 : 9'h0; // @[Edges.scala 222:14]
  assign _T_276 = 21'h3f << out_1_d_bits_size; // @[package.scala 189:77]
  assign _T_277 = _T_276[5:0]; // @[package.scala 189:82]
  assign _T_278 = ~ _T_277; // @[package.scala 189:46]
  assign _T_279 = _T_278[5:3]; // @[Edges.scala 221:59]
  assign _T_280 = auto_out_1_d_bits_opcode[0]; // @[Edges.scala 107:36]
  assign beatsDO_1 = _T_280 ? _T_279 : 3'h0; // @[Edges.scala 222:14]
  assign _T_282 = 21'h3f << out_2_d_bits_size; // @[package.scala 189:77]
  assign _T_283 = _T_282[5:0]; // @[package.scala 189:82]
  assign _T_284 = ~ _T_283; // @[package.scala 189:46]
  assign _T_285 = _T_284[5:3]; // @[Edges.scala 221:59]
  assign _T_286 = auto_out_2_d_bits_opcode[0]; // @[Edges.scala 107:36]
  assign beatsDO_2 = _T_286 ? _T_285 : 3'h0; // @[Edges.scala 222:14]
  assign _T_288 = 21'h3f << out_3_d_bits_size; // @[package.scala 189:77]
  assign _T_289 = _T_288[5:0]; // @[package.scala 189:82]
  assign _T_290 = ~ _T_289; // @[package.scala 189:46]
  assign _T_291 = _T_290[5:3]; // @[Edges.scala 221:59]
  assign _T_292 = auto_out_3_d_bits_opcode[0]; // @[Edges.scala 107:36]
  assign beatsDO_3 = _T_292 ? _T_291 : 3'h0; // @[Edges.scala 222:14]
  assign _T_294 = 21'h3f << out_4_d_bits_size; // @[package.scala 189:77]
  assign _T_295 = _T_294[5:0]; // @[package.scala 189:82]
  assign _T_296 = ~ _T_295; // @[package.scala 189:46]
  assign _T_297 = _T_296[5:3]; // @[Edges.scala 221:59]
  assign _T_298 = auto_out_4_d_bits_opcode[0]; // @[Edges.scala 107:36]
  assign beatsDO_4 = _T_298 ? _T_297 : 3'h0; // @[Edges.scala 222:14]
  assign _T_300 = 21'h3f << out_5_d_bits_size; // @[package.scala 189:77]
  assign _T_301 = _T_300[5:0]; // @[package.scala 189:82]
  assign _T_302 = ~ _T_301; // @[package.scala 189:46]
  assign beatsDO_5 = _T_302[5:3]; // @[Edges.scala 221:59]
  assign _T_319 = requestAIO_0_0 ? auto_out_0_a_ready : 1'h0; // @[Mux.scala 28:72]
  assign _T_320 = requestAIO_0_1 ? auto_out_1_a_ready : 1'h0; // @[Mux.scala 28:72]
  assign _T_321 = requestAIO_0_2 ? auto_out_2_a_ready : 1'h0; // @[Mux.scala 28:72]
  assign _T_322 = requestAIO_0_3 ? auto_out_3_a_ready : 1'h0; // @[Mux.scala 28:72]
  assign _T_323 = requestAIO_0_4 ? auto_out_4_a_ready : 1'h0; // @[Mux.scala 28:72]
  assign _T_324 = requestAIO_0_5 ? auto_out_5_a_ready : 1'h0; // @[Mux.scala 28:72]
  assign _T_325 = _T_319 | _T_320; // @[Mux.scala 28:72]
  assign _T_326 = _T_325 | _T_321; // @[Mux.scala 28:72]
  assign _T_327 = _T_326 | _T_322; // @[Mux.scala 28:72]
  assign _T_328 = _T_327 | _T_323; // @[Mux.scala 28:72]
  assign _T_440 = _T_439 & auto_in_d_ready; // @[Arbiter.scala 55:24]
  assign _T_447 = _T_445 == _T_445; // @[Arbiter.scala 19:19]
  assign _T_449 = _T_447 | reset; // @[Arbiter.scala 19:12]
  assign _T_450 = _T_449 == 1'h0; // @[Arbiter.scala 19:12]
  assign _T_470 = _T_445 != 6'h0; // @[Arbiter.scala 24:27]
  assign _T_471 = _T_440 & _T_470; // @[Arbiter.scala 24:18]
  assign _T_472 = _T_469 & _T_445; // @[Arbiter.scala 25:29]
  assign _T_473 = {_T_472, 1'h0}; // @[package.scala 198:48]
  assign _T_474 = _T_473[5:0]; // @[package.scala 198:53]
  assign _T_475 = _T_472 | _T_474; // @[package.scala 198:43]
  assign _T_476 = {_T_475, 2'h0}; // @[package.scala 198:48]
  assign _T_477 = _T_476[5:0]; // @[package.scala 198:53]
  assign _T_478 = _T_475 | _T_477; // @[package.scala 198:43]
  assign _T_479 = {_T_478, 4'h0}; // @[package.scala 198:48]
  assign _T_480 = _T_479[5:0]; // @[package.scala 198:53]
  assign _T_481 = _T_478 | _T_480; // @[package.scala 198:43]
  assign _T_499 = _T_491 | _T_492; // @[Arbiter.scala 67:52]
  assign _T_500 = _T_499 | _T_493; // @[Arbiter.scala 67:52]
  assign _T_501 = _T_500 | _T_494; // @[Arbiter.scala 67:52]
  assign _T_502 = _T_501 | _T_495; // @[Arbiter.scala 67:52]
  assign _T_503 = _T_502 | _T_496; // @[Arbiter.scala 67:52]
  assign _T_505 = _T_491 == 1'h0; // @[Arbiter.scala 68:62]
  assign _T_508 = _T_492 == 1'h0; // @[Arbiter.scala 68:62]
  assign _T_509 = _T_505 | _T_508; // @[Arbiter.scala 68:59]
  assign _T_510 = _T_499 == 1'h0; // @[Arbiter.scala 68:56]
  assign _T_511 = _T_493 == 1'h0; // @[Arbiter.scala 68:62]
  assign _T_512 = _T_510 | _T_511; // @[Arbiter.scala 68:59]
  assign _T_513 = _T_500 == 1'h0; // @[Arbiter.scala 68:56]
  assign _T_514 = _T_494 == 1'h0; // @[Arbiter.scala 68:62]
  assign _T_515 = _T_513 | _T_514; // @[Arbiter.scala 68:59]
  assign _T_516 = _T_501 == 1'h0; // @[Arbiter.scala 68:56]
  assign _T_517 = _T_495 == 1'h0; // @[Arbiter.scala 68:62]
  assign _T_518 = _T_516 | _T_517; // @[Arbiter.scala 68:59]
  assign _T_519 = _T_502 == 1'h0; // @[Arbiter.scala 68:56]
  assign _T_520 = _T_496 == 1'h0; // @[Arbiter.scala 68:62]
  assign _T_521 = _T_519 | _T_520; // @[Arbiter.scala 68:59]
  assign _T_523 = _T_509 & _T_512; // @[Arbiter.scala 68:77]
  assign _T_524 = _T_523 & _T_515; // @[Arbiter.scala 68:77]
  assign _T_525 = _T_524 & _T_518; // @[Arbiter.scala 68:77]
  assign _T_526 = _T_525 & _T_521; // @[Arbiter.scala 68:77]
  assign _T_528 = _T_526 | reset; // @[Arbiter.scala 68:13]
  assign _T_529 = _T_528 == 1'h0; // @[Arbiter.scala 68:13]
  assign _T_530 = auto_out_0_d_valid | auto_out_1_d_valid; // @[Arbiter.scala 70:31]
  assign _T_531 = _T_530 | auto_out_2_d_valid; // @[Arbiter.scala 70:31]
  assign _T_532 = _T_531 | auto_out_3_d_valid; // @[Arbiter.scala 70:31]
  assign _T_533 = _T_532 | auto_out_4_d_valid; // @[Arbiter.scala 70:31]
  assign _T_534 = _T_533 | auto_out_5_d_valid; // @[Arbiter.scala 70:31]
  assign _T_535 = _T_534 == 1'h0; // @[Arbiter.scala 70:15]
  assign _T_541 = _T_535 | _T_503; // @[Arbiter.scala 70:36]
  assign _T_543 = _T_541 | reset; // @[Arbiter.scala 70:14]
  assign _T_544 = _T_543 == 1'h0; // @[Arbiter.scala 70:14]
  assign _T_545 = _T_491 ? beatsDO_0 : 9'h0; // @[Arbiter.scala 73:69]
  assign _T_546 = _T_492 ? beatsDO_1 : 3'h0; // @[Arbiter.scala 73:69]
  assign _T_547 = _T_493 ? beatsDO_2 : 3'h0; // @[Arbiter.scala 73:69]
  assign _T_548 = _T_494 ? beatsDO_3 : 3'h0; // @[Arbiter.scala 73:69]
  assign _T_549 = _T_495 ? beatsDO_4 : 3'h0; // @[Arbiter.scala 73:69]
  assign _T_550 = _T_496 ? beatsDO_5 : 3'h0; // @[Arbiter.scala 73:69]
  assign _GEN_13 = {{6'd0}, _T_546}; // @[Arbiter.scala 74:44]
  assign _T_551 = _T_545 | _GEN_13; // @[Arbiter.scala 74:44]
  assign _GEN_14 = {{6'd0}, _T_547}; // @[Arbiter.scala 74:44]
  assign _T_552 = _T_551 | _GEN_14; // @[Arbiter.scala 74:44]
  assign _GEN_15 = {{6'd0}, _T_548}; // @[Arbiter.scala 74:44]
  assign _T_553 = _T_552 | _GEN_15; // @[Arbiter.scala 74:44]
  assign _GEN_16 = {{6'd0}, _T_549}; // @[Arbiter.scala 74:44]
  assign _T_554 = _T_553 | _GEN_16; // @[Arbiter.scala 74:44]
  assign _GEN_17 = {{6'd0}, _T_550}; // @[Arbiter.scala 74:44]
  assign _T_555 = _T_554 | _GEN_17; // @[Arbiter.scala 74:44]
  assign _T_575 = _T_561_0 ? auto_out_0_d_valid : 1'h0; // @[Mux.scala 28:72]
  assign _T_576 = _T_561_1 ? auto_out_1_d_valid : 1'h0; // @[Mux.scala 28:72]
  assign _T_581 = _T_575 | _T_576; // @[Mux.scala 28:72]
  assign _T_577 = _T_561_2 ? auto_out_2_d_valid : 1'h0; // @[Mux.scala 28:72]
  assign _T_582 = _T_581 | _T_577; // @[Mux.scala 28:72]
  assign _T_578 = _T_561_3 ? auto_out_3_d_valid : 1'h0; // @[Mux.scala 28:72]
  assign _T_583 = _T_582 | _T_578; // @[Mux.scala 28:72]
  assign _T_579 = _T_561_4 ? auto_out_4_d_valid : 1'h0; // @[Mux.scala 28:72]
  assign _T_584 = _T_583 | _T_579; // @[Mux.scala 28:72]
  assign _T_580 = _T_561_5 ? auto_out_5_d_valid : 1'h0; // @[Mux.scala 28:72]
  assign _T_585 = _T_584 | _T_580; // @[Mux.scala 28:72]
  assign in_0_d_valid = _T_439 ? _T_534 : _T_585; // @[Arbiter.scala 86:24]
  assign _T_556 = auto_in_d_ready & in_0_d_valid; // @[Decoupled.scala 37:37]
  assign _GEN_18 = {{8'd0}, _T_556}; // @[Arbiter.scala 75:52]
  assign _T_558 = _T_438 - _GEN_18; // @[Arbiter.scala 75:52]
  assign _T_563_0 = _T_439 ? _T_484 : _T_561_0; // @[Arbiter.scala 82:24]
  assign _T_563_1 = _T_439 ? _T_485 : _T_561_1; // @[Arbiter.scala 82:24]
  assign _T_563_2 = _T_439 ? _T_486 : _T_561_2; // @[Arbiter.scala 82:24]
  assign _T_563_3 = _T_439 ? _T_487 : _T_561_3; // @[Arbiter.scala 82:24]
  assign _T_563_4 = _T_439 ? _T_488 : _T_561_4; // @[Arbiter.scala 82:24]
  assign _T_563_5 = _T_439 ? _T_489 : _T_561_5; // @[Arbiter.scala 82:24]
  assign auto_in_a_ready = _T_328 | _T_324; // @[LazyModule.scala 173:31]
  assign auto_in_d_valid = _T_439 ? _T_534 : _T_585; // @[LazyModule.scala 173:31]
  assign auto_in_d_bits_opcode = _T_640[78:76]; // @[LazyModule.scala 173:31]
  assign auto_in_d_bits_param = _T_640[75:74]; // @[LazyModule.scala 173:31]
  assign auto_in_d_bits_size = _T_640[73:70]; // @[LazyModule.scala 173:31]
  assign auto_in_d_bits_source = _T_640[69:67]; // @[LazyModule.scala 173:31]
  assign auto_in_d_bits_sink = _T_640[66]; // @[LazyModule.scala 173:31]
  assign auto_in_d_bits_denied = _T_640[65]; // @[LazyModule.scala 173:31]
  assign auto_in_d_bits_data = _T_640[64:1]; // @[LazyModule.scala 173:31]
  assign auto_in_d_bits_corrupt = _T_640[0]; // @[LazyModule.scala 173:31]
  assign auto_out_5_a_valid = auto_in_a_valid & requestAIO_0_5; // @[LazyModule.scala 173:49]
  assign auto_out_5_a_bits_size = auto_in_a_bits_size[2:0]; // @[LazyModule.scala 173:49]
  assign auto_out_5_a_bits_source = auto_in_a_bits_source; // @[LazyModule.scala 173:49]
  assign auto_out_5_a_bits_address = auto_in_a_bits_address[16:0]; // @[LazyModule.scala 173:49]
  assign auto_out_5_a_bits_mask = auto_in_a_bits_mask; // @[LazyModule.scala 173:49]
  assign auto_out_5_d_ready = auto_in_d_ready & _T_563_5; // @[LazyModule.scala 173:49]
  assign auto_out_4_a_valid = auto_in_a_valid & requestAIO_0_4; // @[LazyModule.scala 173:49]
  assign auto_out_4_a_bits_opcode = auto_in_a_bits_opcode; // @[LazyModule.scala 173:49]
  assign auto_out_4_a_bits_param = auto_in_a_bits_param; // @[LazyModule.scala 173:49]
  assign auto_out_4_a_bits_size = auto_in_a_bits_size[2:0]; // @[LazyModule.scala 173:49]
  assign auto_out_4_a_bits_source = auto_in_a_bits_source; // @[LazyModule.scala 173:49]
  assign auto_out_4_a_bits_address = auto_in_a_bits_address; // @[LazyModule.scala 173:49]
  assign auto_out_4_a_bits_mask = auto_in_a_bits_mask; // @[LazyModule.scala 173:49]
  assign auto_out_4_a_bits_data = auto_in_a_bits_data; // @[LazyModule.scala 173:49]
  assign auto_out_4_a_bits_corrupt = auto_in_a_bits_corrupt; // @[LazyModule.scala 173:49]
  assign auto_out_4_d_ready = auto_in_d_ready & _T_563_4; // @[LazyModule.scala 173:49]
  assign auto_out_3_a_valid = auto_in_a_valid & requestAIO_0_3; // @[LazyModule.scala 173:49]
  assign auto_out_3_a_bits_opcode = auto_in_a_bits_opcode; // @[LazyModule.scala 173:49]
  assign auto_out_3_a_bits_size = auto_in_a_bits_size[2:0]; // @[LazyModule.scala 173:49]
  assign auto_out_3_a_bits_source = auto_in_a_bits_source; // @[LazyModule.scala 173:49]
  assign auto_out_3_a_bits_address = auto_in_a_bits_address[11:0]; // @[LazyModule.scala 173:49]
  assign auto_out_3_a_bits_mask = auto_in_a_bits_mask; // @[LazyModule.scala 173:49]
  assign auto_out_3_a_bits_data = auto_in_a_bits_data; // @[LazyModule.scala 173:49]
  assign auto_out_3_d_ready = auto_in_d_ready & _T_563_3; // @[LazyModule.scala 173:49]
  assign auto_out_2_a_valid = auto_in_a_valid & requestAIO_0_2; // @[LazyModule.scala 173:49]
  assign auto_out_2_a_bits_opcode = auto_in_a_bits_opcode; // @[LazyModule.scala 173:49]
  assign auto_out_2_a_bits_size = auto_in_a_bits_size[2:0]; // @[LazyModule.scala 173:49]
  assign auto_out_2_a_bits_source = auto_in_a_bits_source; // @[LazyModule.scala 173:49]
  assign auto_out_2_a_bits_address = auto_in_a_bits_address[25:0]; // @[LazyModule.scala 173:49]
  assign auto_out_2_a_bits_mask = auto_in_a_bits_mask; // @[LazyModule.scala 173:49]
  assign auto_out_2_a_bits_data = auto_in_a_bits_data; // @[LazyModule.scala 173:49]
  assign auto_out_2_d_ready = auto_in_d_ready & _T_563_2; // @[LazyModule.scala 173:49]
  assign auto_out_1_a_valid = auto_in_a_valid & requestAIO_0_1; // @[LazyModule.scala 173:49]
  assign auto_out_1_a_bits_opcode = auto_in_a_bits_opcode; // @[LazyModule.scala 173:49]
  assign auto_out_1_a_bits_size = auto_in_a_bits_size[2:0]; // @[LazyModule.scala 173:49]
  assign auto_out_1_a_bits_source = auto_in_a_bits_source; // @[LazyModule.scala 173:49]
  assign auto_out_1_a_bits_address = auto_in_a_bits_address[27:0]; // @[LazyModule.scala 173:49]
  assign auto_out_1_a_bits_mask = auto_in_a_bits_mask; // @[LazyModule.scala 173:49]
  assign auto_out_1_a_bits_data = auto_in_a_bits_data; // @[LazyModule.scala 173:49]
  assign auto_out_1_d_ready = auto_in_d_ready & _T_563_1; // @[LazyModule.scala 173:49]
  assign auto_out_0_a_valid = auto_in_a_valid & requestAIO_0_0; // @[LazyModule.scala 173:49]
  assign auto_out_0_a_bits_opcode = auto_in_a_bits_opcode; // @[LazyModule.scala 173:49]
  assign auto_out_0_a_bits_size = auto_in_a_bits_size; // @[LazyModule.scala 173:49]
  assign auto_out_0_a_bits_source = auto_in_a_bits_source; // @[LazyModule.scala 173:49]
  assign auto_out_0_d_ready = auto_in_d_ready & _T_563_0; // @[LazyModule.scala 173:49]
initial begin
  
 // RANDOMIZE
end
  always @(posedge clock) begin
    if (targetFire) begin
      if (reset) begin
        _T_438 <= 9'h0;
      end else begin
        if (_T_440) begin
          _T_438 <= _T_555;
        end else begin
          _T_438 <= _T_558;
        end
      end
    end
    if (targetFire) begin
      if (reset) begin
        _T_452 <= 6'h3f;
      end else begin
        if (_T_471) begin
          _T_452 <= _T_481;
        end
      end
    end
    if (targetFire) begin
      if (reset) begin
        _T_561_0 <= 1'h0;
      end else begin
        if (_T_439) begin
          _T_561_0 <= _T_491;
        end
      end
    end
    if (targetFire) begin
      if (reset) begin
        _T_561_1 <= 1'h0;
      end else begin
        if (_T_439) begin
          _T_561_1 <= _T_492;
        end
      end
    end
    if (targetFire) begin
      if (reset) begin
        _T_561_2 <= 1'h0;
      end else begin
        if (_T_439) begin
          _T_561_2 <= _T_493;
        end
      end
    end
    if (targetFire) begin
      if (reset) begin
        _T_561_3 <= 1'h0;
      end else begin
        if (_T_439) begin
          _T_561_3 <= _T_494;
        end
      end
    end
    if (targetFire) begin
      if (reset) begin
        _T_561_4 <= 1'h0;
      end else begin
        if (_T_439) begin
          _T_561_4 <= _T_495;
        end
      end
    end
    if (targetFire) begin
      if (reset) begin
        _T_561_5 <= 1'h0;
      end else begin
        if (_T_439) begin
          _T_561_5 <= _T_496;
        end
      end
    end
    
 // SYNTHESIS
    
 // SYNTHESIS
    
 // SYNTHESIS
    
 // SYNTHESIS
    
 // SYNTHESIS
    
 // SYNTHESIS
  end
endmodule
