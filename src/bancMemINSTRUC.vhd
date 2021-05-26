----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:20:12 04/16/2021 
-- Design Name: 
-- Module Name:    bancMemINSTRUC - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bancMemINSTRUC is
    Port ( addr : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           OUTD : out  STD_LOGIC_VECTOR (31 downto 0));
end bancMemINSTRUC;

architecture Behavioral of bancMemINSTRUC is
	type binstru_struct is ARRAY(0 to 255) of std_logic_vector(31 downto 0);
	constant binstru : binstru_struct := (X"00000000", X"06000800", X"06010300", X"05020000", X"01030201", X"02040301", X"03050100", X"07060000", X"07070100", X"08030000", others=> X"00000000");
	
begin
	process
		begin
			wait until falling_edge(CLK);
			OUTD <= binstru(to_integer(unsigned(addr)));
		end process;


end Behavioral;

