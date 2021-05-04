----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:13:23 04/07/2021 
-- Design Name: 
-- Module Name:    td1 - Behavioral 
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

entity td1 is
    Port ( Din : in  STD_LOGIC_VECTOR (7 downto 0);
           Dout : out  STD_LOGIC_VECTOR (7 downto 0);
           CK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           SENS : in  STD_LOGIC;
           LOAD : in  STD_LOGIC;
           EN : in  STD_LOGIC);
end td1;

architecture Behavioral of td1 is	
		signal cpt:STD_LOGIC_VECTOR(7 downto 0);
begin
	process
		begin
			wait until CK'EVENT AND CK ='1';
			if RST='1' then 
				cpt <= x"00"; 
			else
				if LOAD='1' then
					cpt <= Din;
				elsif EN='0' then				
					if SENS='1' then
						cpt <= cpt+1;
					elsif SENS='0' then
						cpt <= cpt-1;
					end if;
				end if;	
			end if;
	end process;
	Dout <= cpt;
end Behavioral;

