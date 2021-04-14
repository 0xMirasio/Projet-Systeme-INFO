----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:07:06 04/14/2021 
-- Design Name: 
-- Module Name:    test_ALU - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_ALU is
    Port ( In1 : in  STD_LOGIC_VECTOR (3 downto 0);
           In2 : in  STD_LOGIC_VECTOR (3 downto 0);
           LOAD : in  STD_LOGIC;
			  RST : in STD_LOGIC;
			  CK : in STD_LOGIC;
           Dout1 : out  STD_LOGIC_VECTOR (3 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (3 downto 0));
end test_ALU;

architecture Behavioral of test_ALU is
	signal D2o :STD_LOGIC_VECTOR(3 downto 0);
	signal D1o:STD_LOGIC_VECTOR(3 downto 0);
	
begin
	process
		begin
			wait until CK'EVENT AND CK ='1';
			if RST='1' then 
				D1o <= x"0";
				D2o <= x"0";
			else
				if LOAD='1' then
					D1o <= In1;
					D2o <= In2;
				end if;
			end if;
		
		end process;
		Dout1 <= D1o;
		Dout2 <= D2o;
		
end Behavioral;

