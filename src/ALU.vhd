----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:10:01 04/14/2021 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity alu is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
			  Ctrl_Alu : in  STD_LOGIC_VECTOR (2 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           N : out  STD_LOGIC;
           O : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           C : out  STD_LOGIC);
end alu;

architecture Behavioral of alu is
	signal result:STD_LOGIC_VECTOR(15 downto 0);
	signal A_ext:STD_LOGIC_VECTOR(15 downto 0);
	signal B_ext:STD_LOGIC_VECTOR(15 downto 0);
	
begin
	A_ext <= x"00"&A;
	B_ext <= x"00"&B;

	instruct: process
		begin
			N <= '0';
			O <= '0';
			Z <= '0';
			C <= '0';
			
			case Ctrl_Alu is
			when "001" => result <= A_ext+B_ext;
			when "010" => result <= A_ext(7 downto 0)*B_ext(7 downto 0);
			when "011" => result <= A_ext-B_ext;
			when others	=>	result <= x"0000" ;
			end case;
			
			if result(15 downto 8) /= x"00" and Ctrl_Alu = "001" then
				C <= '1';
			elsif result(15 downto 8) /= x"00" and Ctrl_Alu = "010" then
				O <= '1';
			elsif A_ext < B_ext and Ctrl_Alu = "011" then
				N <= '1';
			elsif result(15 downto 0) = x"0000" then
				Z <= '1';
			end if;
			
			
			S <= result(7 downto 0);
			
			wait on Ctrl_Alu, A_ext, B_ext, result;
	end process;

end Behavioral;