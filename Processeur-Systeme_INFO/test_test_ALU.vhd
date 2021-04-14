--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:38:55 04/14/2021
-- Design Name:   
-- Module Name:   /home/poncetta/Bureau/VHDL/Processeur-Systeme_INFO/test_test_ALU.vhd
-- Project Name:  Processeur-Systeme_INFO
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: test_ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_test_ALU IS
END test_test_ALU;
 
ARCHITECTURE behavior OF test_test_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT test_ALU
    PORT(
         In1 : IN  std_logic_vector(3 downto 0);
         In2 : IN  std_logic_vector(3 downto 0);
         LOAD : IN  std_logic;
         RST : IN  std_logic;
         CK : IN  std_logic;
         Dout1 : OUT  std_logic_vector(3 downto 0);
         Dout2 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal In1 : std_logic_vector(3 downto 0) := (others => '0');
   signal In2 : std_logic_vector(3 downto 0) := (others => '0');
   signal LOAD : std_logic := '0';
   signal RST : std_logic := '0';
   signal CK : std_logic := '0';

 	--Outputs
   signal Dout1 : std_logic_vector(3 downto 0);
   signal Dout2 : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace CK below with 
   -- appropriate port name 
 
   constant CK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: test_ALU PORT MAP (
          In1 => In1,
          In2 => In2,
          LOAD => LOAD,
          RST => RST,
          CK => CK,
          Dout1 => Dout1,
          Dout2 => Dout2
        );

   -- Clock process definitions
   CK_process :process
   begin
		CK <= '0';
		wait for CK_period/2;
		CK <= '1';
		wait for CK_period/2;
   end process;
	
	RST <= '0', '1' after 25 ns, '0' after 500 ns, '1' after 530 ns;
	LOAD <= '0', '1' after 300 ns;
	In1 <= x"0", "1010" after 50ns , "1011" after 125 ns, "0001" after 200ns, "1111" after 500ns;
	In2 <= x"0", "1000" after 50ns , "0001" after 125 ns, "1101" after 200ns, "1111" after 500ns;
	

END;
