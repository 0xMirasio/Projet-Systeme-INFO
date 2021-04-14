--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: O.87xd
--  \   \         Application: netgen
--  /   /         Filename: test_ALU_timesim.vhd
-- /___/   /\     Timestamp: Wed Apr 14 10:43:59 2021
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 3 -pcf test_ALU.pcf -rpw 100 -tpw 0 -ar Structure -tm test_ALU -insert_pp_buffers true -w -dir netgen/par -ofmt vhdl -sim test_ALU.ncd test_ALU_timesim.vhd 
-- Device	: 6slx16csg324-3 (PRODUCTION 1.21 2012-01-07)
-- Input file	: test_ALU.ncd
-- Output file	: /home/poncetta/Bureau/VHDL/Processeur-Systeme_INFO/netgen/par/test_ALU_timesim.vhd
-- # of Entities	: 1
-- Design Name	: test_ALU
-- Xilinx	: /usr/local/insa/Xilinx.ISE/13.4/ISE_DS/ISE/
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity test_ALU is
  port (
    LOAD : in STD_LOGIC := 'X'; 
    RST : in STD_LOGIC := 'X'; 
    CK : in STD_LOGIC := 'X'; 
    In1 : in STD_LOGIC_VECTOR ( 3 downto 0 ); 
    In2 : in STD_LOGIC_VECTOR ( 3 downto 0 ); 
    Dout1 : out STD_LOGIC_VECTOR ( 3 downto 0 ); 
    Dout2 : out STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end test_ALU;

architecture Structure of test_ALU is
  signal CK_BUFGP_IBUFG_0 : STD_LOGIC; 
  signal LOAD_inv : STD_LOGIC; 
  signal In1_0_IBUF_0 : STD_LOGIC; 
  signal In1_1_IBUF_0 : STD_LOGIC; 
  signal In1_2_IBUF_0 : STD_LOGIC; 
  signal In1_3_IBUF_0 : STD_LOGIC; 
  signal In2_0_IBUF_0 : STD_LOGIC; 
  signal In2_1_IBUF_0 : STD_LOGIC; 
  signal In2_2_IBUF_0 : STD_LOGIC; 
  signal In2_3_IBUF_0 : STD_LOGIC; 
  signal RST_inv : STD_LOGIC; 
  signal CK_BUFGP : STD_LOGIC; 
  signal CK_BUFGP_IBUFG_1 : STD_LOGIC; 
  signal ProtoComp1_IINV_OUT : STD_LOGIC; 
  signal LOAD_inv_non_inverted : STD_LOGIC; 
  signal In1_0_IBUF_8 : STD_LOGIC; 
  signal In1_1_IBUF_11 : STD_LOGIC; 
  signal In1_2_IBUF_14 : STD_LOGIC; 
  signal In1_3_IBUF_17 : STD_LOGIC; 
  signal In2_0_IBUF_20 : STD_LOGIC; 
  signal In2_1_IBUF_23 : STD_LOGIC; 
  signal In2_2_IBUF_26 : STD_LOGIC; 
  signal In2_3_IBUF_29 : STD_LOGIC; 
  signal RST_ProtoComp1_IINV_OUT : STD_LOGIC; 
  signal RST_inv_non_inverted : STD_LOGIC; 
  signal ProtoComp3_D2OBYPSEL_GND_0 : STD_LOGIC; 
  signal ProtoComp3_D2OFFBYP_SRC_OUT : STD_LOGIC; 
  signal D1o_1_ProtoComp3_D2OBYPSEL_GND_0 : STD_LOGIC; 
  signal D1o_1_ProtoComp3_D2OFFBYP_SRC_OUT : STD_LOGIC; 
  signal D1o_2_ProtoComp3_D2OBYPSEL_GND_0 : STD_LOGIC; 
  signal D1o_2_ProtoComp3_D2OFFBYP_SRC_OUT : STD_LOGIC; 
  signal D1o_3_ProtoComp3_D2OBYPSEL_GND_0 : STD_LOGIC; 
  signal D1o_3_ProtoComp3_D2OFFBYP_SRC_OUT : STD_LOGIC; 
  signal D2o_0_ProtoComp3_D2OBYPSEL_GND_0 : STD_LOGIC; 
  signal D2o_0_ProtoComp3_D2OFFBYP_SRC_OUT : STD_LOGIC; 
  signal D2o_1_ProtoComp3_D2OBYPSEL_GND_0 : STD_LOGIC; 
  signal D2o_1_ProtoComp3_D2OFFBYP_SRC_OUT : STD_LOGIC; 
  signal D2o_2_ProtoComp3_D2OBYPSEL_GND_0 : STD_LOGIC; 
  signal D2o_2_ProtoComp3_D2OFFBYP_SRC_OUT : STD_LOGIC; 
  signal D2o_3_ProtoComp3_D2OBYPSEL_GND_0 : STD_LOGIC; 
  signal D2o_3_ProtoComp3_D2OFFBYP_SRC_OUT : STD_LOGIC; 
  signal NlwBufferSignal_Dout1_0_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_Dout1_1_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_Dout1_2_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_Dout1_3_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_Dout2_0_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_Dout2_1_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_Dout2_2_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_Dout2_3_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_D1o_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_D1o_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_D1o_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_ProtoComp3_D2OFFBYP_SRC_2_INA : STD_LOGIC; 
  signal NlwBufferSignal_D1o_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_D2o_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_ProtoComp3_D2OFFBYP_SRC_4_INA : STD_LOGIC; 
  signal NlwBufferSignal_D2o_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_D2o_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_D2o_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_CK_BUFGP_BUFG_IN : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal NLW_ProtoComp3_D2OFFBYP_SRC_IB_UNCONNECTED : STD_LOGIC; 
  signal NLW_ProtoComp3_D2OFFBYP_SRC_1_IB_UNCONNECTED : STD_LOGIC; 
  signal NLW_ProtoComp3_D2OFFBYP_SRC_2_IB_UNCONNECTED : STD_LOGIC; 
  signal NLW_ProtoComp3_D2OFFBYP_SRC_3_IB_UNCONNECTED : STD_LOGIC; 
  signal NLW_ProtoComp3_D2OFFBYP_SRC_4_IB_UNCONNECTED : STD_LOGIC; 
  signal NLW_ProtoComp3_D2OFFBYP_SRC_5_IB_UNCONNECTED : STD_LOGIC; 
  signal NLW_ProtoComp3_D2OFFBYP_SRC_6_IB_UNCONNECTED : STD_LOGIC; 
  signal NLW_ProtoComp3_D2OFFBYP_SRC_7_IB_UNCONNECTED : STD_LOGIC; 
  signal D1o : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal D2o : STD_LOGIC_VECTOR ( 3 downto 0 ); 
begin
  CK_BUFGP_IBUFG : X_BUF
    generic map(
      LOC => "PAD216",
      PATHPULSE => 202 ps
    )
    port map (
      O => CK_BUFGP_IBUFG_1,
      I => CK
    );
  ProtoComp0_IMUX : X_BUF
    generic map(
      LOC => "PAD216",
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP_IBUFG_1,
      O => CK_BUFGP_IBUFG_0
    );
  LOAD_IBUF : X_BUF
    generic map(
      LOC => "PAD157",
      PATHPULSE => 202 ps
    )
    port map (
      O => LOAD_inv_non_inverted,
      I => LOAD
    );
  ProtoComp1_IMUX : X_BUF
    generic map(
      LOC => "PAD157",
      PATHPULSE => 202 ps
    )
    port map (
      I => ProtoComp1_IINV_OUT,
      O => LOAD_inv
    );
  ProtoComp1_IINV : X_INV
    generic map(
      LOC => "PAD157",
      PATHPULSE => 202 ps
    )
    port map (
      I => LOAD_inv_non_inverted,
      O => ProtoComp1_IINV_OUT
    );
  In1_0_IBUF : X_BUF
    generic map(
      LOC => "PAD159",
      PATHPULSE => 202 ps
    )
    port map (
      O => In1_0_IBUF_8,
      I => In1(0)
    );
  ProtoComp0_IMUX_1 : X_BUF
    generic map(
      LOC => "PAD159",
      PATHPULSE => 202 ps
    )
    port map (
      I => In1_0_IBUF_8,
      O => In1_0_IBUF_0
    );
  In1_1_IBUF : X_BUF
    generic map(
      LOC => "PAD160",
      PATHPULSE => 202 ps
    )
    port map (
      O => In1_1_IBUF_11,
      I => In1(1)
    );
  ProtoComp0_IMUX_2 : X_BUF
    generic map(
      LOC => "PAD160",
      PATHPULSE => 202 ps
    )
    port map (
      I => In1_1_IBUF_11,
      O => In1_1_IBUF_0
    );
  In1_2_IBUF : X_BUF
    generic map(
      LOC => "PAD161",
      PATHPULSE => 202 ps
    )
    port map (
      O => In1_2_IBUF_14,
      I => In1(2)
    );
  ProtoComp0_IMUX_3 : X_BUF
    generic map(
      LOC => "PAD161",
      PATHPULSE => 202 ps
    )
    port map (
      I => In1_2_IBUF_14,
      O => In1_2_IBUF_0
    );
  In1_3_IBUF : X_BUF
    generic map(
      LOC => "PAD162",
      PATHPULSE => 202 ps
    )
    port map (
      O => In1_3_IBUF_17,
      I => In1(3)
    );
  ProtoComp0_IMUX_4 : X_BUF
    generic map(
      LOC => "PAD162",
      PATHPULSE => 202 ps
    )
    port map (
      I => In1_3_IBUF_17,
      O => In1_3_IBUF_0
    );
  In2_0_IBUF : X_BUF
    generic map(
      LOC => "PAD173",
      PATHPULSE => 202 ps
    )
    port map (
      O => In2_0_IBUF_20,
      I => In2(0)
    );
  ProtoComp0_IMUX_5 : X_BUF
    generic map(
      LOC => "PAD173",
      PATHPULSE => 202 ps
    )
    port map (
      I => In2_0_IBUF_20,
      O => In2_0_IBUF_0
    );
  In2_1_IBUF : X_BUF
    generic map(
      LOC => "PAD174",
      PATHPULSE => 202 ps
    )
    port map (
      O => In2_1_IBUF_23,
      I => In2(1)
    );
  ProtoComp0_IMUX_6 : X_BUF
    generic map(
      LOC => "PAD174",
      PATHPULSE => 202 ps
    )
    port map (
      I => In2_1_IBUF_23,
      O => In2_1_IBUF_0
    );
  In2_2_IBUF : X_BUF
    generic map(
      LOC => "PAD175",
      PATHPULSE => 202 ps
    )
    port map (
      O => In2_2_IBUF_26,
      I => In2(2)
    );
  ProtoComp0_IMUX_7 : X_BUF
    generic map(
      LOC => "PAD175",
      PATHPULSE => 202 ps
    )
    port map (
      I => In2_2_IBUF_26,
      O => In2_2_IBUF_0
    );
  In2_3_IBUF : X_BUF
    generic map(
      LOC => "PAD176",
      PATHPULSE => 202 ps
    )
    port map (
      O => In2_3_IBUF_29,
      I => In2(3)
    );
  ProtoComp0_IMUX_8 : X_BUF
    generic map(
      LOC => "PAD176",
      PATHPULSE => 202 ps
    )
    port map (
      I => In2_3_IBUF_29,
      O => In2_3_IBUF_0
    );
  RST_IBUF : X_BUF
    generic map(
      LOC => "PAD158",
      PATHPULSE => 202 ps
    )
    port map (
      O => RST_inv_non_inverted,
      I => RST
    );
  ProtoComp1_IMUX_1 : X_BUF
    generic map(
      LOC => "PAD158",
      PATHPULSE => 202 ps
    )
    port map (
      I => RST_ProtoComp1_IINV_OUT,
      O => RST_inv
    );
  ProtoComp1_IINV_1 : X_INV
    generic map(
      LOC => "PAD158",
      PATHPULSE => 202 ps
    )
    port map (
      I => RST_inv_non_inverted,
      O => RST_ProtoComp1_IINV_OUT
    );
  Dout1_0_OBUF : X_OBUF
    generic map(
      LOC => "PAD163"
    )
    port map (
      I => NlwBufferSignal_Dout1_0_OBUF_I,
      O => Dout1(0)
    );
  Dout1_1_OBUF : X_OBUF
    generic map(
      LOC => "PAD164"
    )
    port map (
      I => NlwBufferSignal_Dout1_1_OBUF_I,
      O => Dout1(1)
    );
  Dout1_2_OBUF : X_OBUF
    generic map(
      LOC => "PAD169"
    )
    port map (
      I => NlwBufferSignal_Dout1_2_OBUF_I,
      O => Dout1(2)
    );
  Dout1_3_OBUF : X_OBUF
    generic map(
      LOC => "PAD170"
    )
    port map (
      I => NlwBufferSignal_Dout1_3_OBUF_I,
      O => Dout1(3)
    );
  Dout2_0_OBUF : X_OBUF
    generic map(
      LOC => "PAD167"
    )
    port map (
      I => NlwBufferSignal_Dout2_0_OBUF_I,
      O => Dout2(0)
    );
  Dout2_1_OBUF : X_OBUF
    generic map(
      LOC => "PAD168"
    )
    port map (
      I => NlwBufferSignal_Dout2_1_OBUF_I,
      O => Dout2(1)
    );
  Dout2_2_OBUF : X_OBUF
    generic map(
      LOC => "PAD171"
    )
    port map (
      I => NlwBufferSignal_Dout2_2_OBUF_I,
      O => Dout2(2)
    );
  Dout2_3_OBUF : X_OBUF
    generic map(
      LOC => "PAD172"
    )
    port map (
      I => NlwBufferSignal_Dout2_3_OBUF_I,
      O => Dout2(3)
    );
  D1o_0 : X_SFF
    generic map(
      LOC => "ILOGIC_X8Y3",
      INIT => '0'
    )
    port map (
      CE => LOAD_inv,
      CLK => NlwBufferSignal_D1o_0_CLK,
      I => ProtoComp3_D2OFFBYP_SRC_OUT,
      O => D1o(0),
      SSET => GND,
      SRST => RST_inv,
      SET => GND,
      RST => GND
    );
  ProtoComp3_D2OFFBYP_SRC : X_MUX2
    generic map(
      LOC => "ILOGIC_X8Y3"
    )
    port map (
      IA => In1_0_IBUF_0,
      IB => NLW_ProtoComp3_D2OFFBYP_SRC_IB_UNCONNECTED,
      O => ProtoComp3_D2OFFBYP_SRC_OUT,
      SEL => ProtoComp3_D2OBYPSEL_GND_0
    );
  ProtoComp3_D2OBYPSEL_GND : X_ZERO
    generic map(
      LOC => "ILOGIC_X8Y3"
    )
    port map (
      O => ProtoComp3_D2OBYPSEL_GND_0
    );
  D1o_1 : X_SFF
    generic map(
      LOC => "ILOGIC_X8Y2",
      INIT => '0'
    )
    port map (
      CE => LOAD_inv,
      CLK => NlwBufferSignal_D1o_1_CLK,
      I => D1o_1_ProtoComp3_D2OFFBYP_SRC_OUT,
      O => D1o(1),
      SSET => GND,
      SRST => RST_inv,
      SET => GND,
      RST => GND
    );
  ProtoComp3_D2OFFBYP_SRC_1 : X_MUX2
    generic map(
      LOC => "ILOGIC_X8Y2"
    )
    port map (
      IA => In1_1_IBUF_0,
      IB => NLW_ProtoComp3_D2OFFBYP_SRC_1_IB_UNCONNECTED,
      O => D1o_1_ProtoComp3_D2OFFBYP_SRC_OUT,
      SEL => D1o_1_ProtoComp3_D2OBYPSEL_GND_0
    );
  ProtoComp3_D2OBYPSEL_GND_1 : X_ZERO
    generic map(
      LOC => "ILOGIC_X8Y2"
    )
    port map (
      O => D1o_1_ProtoComp3_D2OBYPSEL_GND_0
    );
  D1o_2 : X_SFF
    generic map(
      LOC => "ILOGIC_X7Y1",
      INIT => '0'
    )
    port map (
      CE => LOAD_inv,
      CLK => NlwBufferSignal_D1o_2_CLK,
      I => D1o_2_ProtoComp3_D2OFFBYP_SRC_OUT,
      O => D1o(2),
      SSET => GND,
      SRST => RST_inv,
      SET => GND,
      RST => GND
    );
  ProtoComp3_D2OFFBYP_SRC_2 : X_MUX2
    generic map(
      LOC => "ILOGIC_X7Y1"
    )
    port map (
      IA => NlwBufferSignal_ProtoComp3_D2OFFBYP_SRC_2_INA,
      IB => NLW_ProtoComp3_D2OFFBYP_SRC_2_IB_UNCONNECTED,
      O => D1o_2_ProtoComp3_D2OFFBYP_SRC_OUT,
      SEL => D1o_2_ProtoComp3_D2OBYPSEL_GND_0
    );
  ProtoComp3_D2OBYPSEL_GND_2 : X_ZERO
    generic map(
      LOC => "ILOGIC_X7Y1"
    )
    port map (
      O => D1o_2_ProtoComp3_D2OBYPSEL_GND_0
    );
  D1o_3 : X_SFF
    generic map(
      LOC => "ILOGIC_X7Y0",
      INIT => '0'
    )
    port map (
      CE => LOAD_inv,
      CLK => NlwBufferSignal_D1o_3_CLK,
      I => D1o_3_ProtoComp3_D2OFFBYP_SRC_OUT,
      O => D1o(3),
      SSET => GND,
      SRST => RST_inv,
      SET => GND,
      RST => GND
    );
  ProtoComp3_D2OFFBYP_SRC_3 : X_MUX2
    generic map(
      LOC => "ILOGIC_X7Y0"
    )
    port map (
      IA => In1_3_IBUF_0,
      IB => NLW_ProtoComp3_D2OFFBYP_SRC_3_IB_UNCONNECTED,
      O => D1o_3_ProtoComp3_D2OFFBYP_SRC_OUT,
      SEL => D1o_3_ProtoComp3_D2OBYPSEL_GND_0
    );
  ProtoComp3_D2OBYPSEL_GND_3 : X_ZERO
    generic map(
      LOC => "ILOGIC_X7Y0"
    )
    port map (
      O => D1o_3_ProtoComp3_D2OBYPSEL_GND_0
    );
  D2o_0 : X_SFF
    generic map(
      LOC => "ILOGIC_X4Y1",
      INIT => '0'
    )
    port map (
      CE => LOAD_inv,
      CLK => NlwBufferSignal_D2o_0_CLK,
      I => D2o_0_ProtoComp3_D2OFFBYP_SRC_OUT,
      O => D2o(0),
      SSET => GND,
      SRST => RST_inv,
      SET => GND,
      RST => GND
    );
  ProtoComp3_D2OFFBYP_SRC_4 : X_MUX2
    generic map(
      LOC => "ILOGIC_X4Y1"
    )
    port map (
      IA => NlwBufferSignal_ProtoComp3_D2OFFBYP_SRC_4_INA,
      IB => NLW_ProtoComp3_D2OFFBYP_SRC_4_IB_UNCONNECTED,
      O => D2o_0_ProtoComp3_D2OFFBYP_SRC_OUT,
      SEL => D2o_0_ProtoComp3_D2OBYPSEL_GND_0
    );
  ProtoComp3_D2OBYPSEL_GND_4 : X_ZERO
    generic map(
      LOC => "ILOGIC_X4Y1"
    )
    port map (
      O => D2o_0_ProtoComp3_D2OBYPSEL_GND_0
    );
  D2o_1 : X_SFF
    generic map(
      LOC => "ILOGIC_X4Y0",
      INIT => '0'
    )
    port map (
      CE => LOAD_inv,
      CLK => NlwBufferSignal_D2o_1_CLK,
      I => D2o_1_ProtoComp3_D2OFFBYP_SRC_OUT,
      O => D2o(1),
      SSET => GND,
      SRST => RST_inv,
      SET => GND,
      RST => GND
    );
  ProtoComp3_D2OFFBYP_SRC_5 : X_MUX2
    generic map(
      LOC => "ILOGIC_X4Y0"
    )
    port map (
      IA => In2_1_IBUF_0,
      IB => NLW_ProtoComp3_D2OFFBYP_SRC_5_IB_UNCONNECTED,
      O => D2o_1_ProtoComp3_D2OFFBYP_SRC_OUT,
      SEL => D2o_1_ProtoComp3_D2OBYPSEL_GND_0
    );
  ProtoComp3_D2OBYPSEL_GND_5 : X_ZERO
    generic map(
      LOC => "ILOGIC_X4Y0"
    )
    port map (
      O => D2o_1_ProtoComp3_D2OBYPSEL_GND_0
    );
  D2o_2 : X_SFF
    generic map(
      LOC => "ILOGIC_X4Y3",
      INIT => '0'
    )
    port map (
      CE => LOAD_inv,
      CLK => NlwBufferSignal_D2o_2_CLK,
      I => D2o_2_ProtoComp3_D2OFFBYP_SRC_OUT,
      O => D2o(2),
      SSET => GND,
      SRST => RST_inv,
      SET => GND,
      RST => GND
    );
  ProtoComp3_D2OFFBYP_SRC_6 : X_MUX2
    generic map(
      LOC => "ILOGIC_X4Y3"
    )
    port map (
      IA => In2_2_IBUF_0,
      IB => NLW_ProtoComp3_D2OFFBYP_SRC_6_IB_UNCONNECTED,
      O => D2o_2_ProtoComp3_D2OFFBYP_SRC_OUT,
      SEL => D2o_2_ProtoComp3_D2OBYPSEL_GND_0
    );
  ProtoComp3_D2OBYPSEL_GND_6 : X_ZERO
    generic map(
      LOC => "ILOGIC_X4Y3"
    )
    port map (
      O => D2o_2_ProtoComp3_D2OBYPSEL_GND_0
    );
  D2o_3 : X_SFF
    generic map(
      LOC => "ILOGIC_X4Y2",
      INIT => '0'
    )
    port map (
      CE => LOAD_inv,
      CLK => NlwBufferSignal_D2o_3_CLK,
      I => D2o_3_ProtoComp3_D2OFFBYP_SRC_OUT,
      O => D2o(3),
      SSET => GND,
      SRST => RST_inv,
      SET => GND,
      RST => GND
    );
  ProtoComp3_D2OFFBYP_SRC_7 : X_MUX2
    generic map(
      LOC => "ILOGIC_X4Y2"
    )
    port map (
      IA => In2_3_IBUF_0,
      IB => NLW_ProtoComp3_D2OFFBYP_SRC_7_IB_UNCONNECTED,
      O => D2o_3_ProtoComp3_D2OFFBYP_SRC_OUT,
      SEL => D2o_3_ProtoComp3_D2OBYPSEL_GND_0
    );
  ProtoComp3_D2OBYPSEL_GND_7 : X_ZERO
    generic map(
      LOC => "ILOGIC_X4Y2"
    )
    port map (
      O => D2o_3_ProtoComp3_D2OBYPSEL_GND_0
    );
  CK_BUFGP_BUFG : X_CKBUF
    generic map(
      LOC => "BUFGMUX_X3Y13",
      PATHPULSE => 202 ps
    )
    port map (
      I => NlwBufferSignal_CK_BUFGP_BUFG_IN,
      O => CK_BUFGP
    );
  NlwBufferBlock_Dout1_0_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => D1o(0),
      O => NlwBufferSignal_Dout1_0_OBUF_I
    );
  NlwBufferBlock_Dout1_1_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => D1o(1),
      O => NlwBufferSignal_Dout1_1_OBUF_I
    );
  NlwBufferBlock_Dout1_2_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => D1o(2),
      O => NlwBufferSignal_Dout1_2_OBUF_I
    );
  NlwBufferBlock_Dout1_3_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => D1o(3),
      O => NlwBufferSignal_Dout1_3_OBUF_I
    );
  NlwBufferBlock_Dout2_0_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => D2o(0),
      O => NlwBufferSignal_Dout2_0_OBUF_I
    );
  NlwBufferBlock_Dout2_1_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => D2o(1),
      O => NlwBufferSignal_Dout2_1_OBUF_I
    );
  NlwBufferBlock_Dout2_2_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => D2o(2),
      O => NlwBufferSignal_Dout2_2_OBUF_I
    );
  NlwBufferBlock_Dout2_3_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => D2o(3),
      O => NlwBufferSignal_Dout2_3_OBUF_I
    );
  NlwBufferBlock_D1o_0_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP,
      O => NlwBufferSignal_D1o_0_CLK
    );
  NlwBufferBlock_D1o_1_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP,
      O => NlwBufferSignal_D1o_1_CLK
    );
  NlwBufferBlock_D1o_2_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP,
      O => NlwBufferSignal_D1o_2_CLK
    );
  NlwBufferBlock_ProtoComp3_D2OFFBYP_SRC_2_INA : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => In1_2_IBUF_0,
      O => NlwBufferSignal_ProtoComp3_D2OFFBYP_SRC_2_INA
    );
  NlwBufferBlock_D1o_3_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP,
      O => NlwBufferSignal_D1o_3_CLK
    );
  NlwBufferBlock_D2o_0_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP,
      O => NlwBufferSignal_D2o_0_CLK
    );
  NlwBufferBlock_ProtoComp3_D2OFFBYP_SRC_4_INA : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => In2_0_IBUF_0,
      O => NlwBufferSignal_ProtoComp3_D2OFFBYP_SRC_4_INA
    );
  NlwBufferBlock_D2o_1_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP,
      O => NlwBufferSignal_D2o_1_CLK
    );
  NlwBufferBlock_D2o_2_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP,
      O => NlwBufferSignal_D2o_2_CLK
    );
  NlwBufferBlock_D2o_3_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP,
      O => NlwBufferSignal_D2o_3_CLK
    );
  NlwBufferBlock_CK_BUFGP_BUFG_IN : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP_IBUFG_0,
      O => NlwBufferSignal_CK_BUFGP_BUFG_IN
    );
  NlwBlock_test_ALU_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

