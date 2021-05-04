----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:19:38 04/16/2021 
-- Design Name: 
-- Module Name:    bancMemDATA - Behavioral 
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

entity bancMemDATA is
    Port ( addr : in  STD_LOGIC_VECTOR (7 downto 0);
           IND : in  STD_LOGIC_VECTOR (7 downto 0);
           RW : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           OUTD : out  STD_LOGIC_VECTOR (7 downto 0));
end bancMemDATA;

architecture Behavioral of bancMemDATA is
	type bmem_struct is ARRAY(0 to 255) of std_logic_vector(7 downto 0);
	signal bmem : bmem_struct := (others => x"00");
begin
	process
		begin
			wait until CLK'EVENT AND CLK ='1';
				if RST = '0' then
					bmem <= (others=> X"00");
				else
					if RW = '1' then -- lecture
						OUTD <= bmem(TO_INTEGER(unsigned(addr)));
					elsif RW = '0' then -- ecriture
						bmem(TO_INTEGER(unsigned(addr)))<= IND;
					end if;
				end if;
		end process;
			
			
end Behavioral;

