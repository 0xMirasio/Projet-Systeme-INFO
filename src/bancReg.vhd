----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:48:54 04/16/2021 
-- Design Name: 
-- Module Name:    bancReg - Behavioral 
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bancReg is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Wb : in  STD_LOGIC_VECTOR (3 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end bancReg;

architecture Behavioral of bancReg is
	type breg is ARRAY(0 to 15) of std_logic_vector(7 downto 0);
	signal reg : breg;
begin		
	process
		begin
			wait until CLK'EVENT AND CLK ='1';
			if RST = '0' then
				reg <= (others=> X"00");
			else
				if W = '1' then
					reg(TO_INTEGER(unsigned(Wb)))<= DATA;
				end if;
			end if;
	end process;
		
		QA <= reg(TO_INTEGER(unsigned(A)));
		QB <= reg(TO_INTEGER(unsigned(B)));
		

end Behavioral;

