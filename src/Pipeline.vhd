library IEEE;
library work;

use IEEE.STD_LOGIC_1164.ALL;
use work.constants.ALL;

entity Pipeline is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Ai : in  STD_LOGIC_VECTOR (CONSTANT_OPERAND-1 downto 0);
           Bi : in  STD_LOGIC_VECTOR (CONSTANT_OPERAND-1 downto 0);
           Ci : in  STD_LOGIC_VECTOR (CONSTANT_OPERAND-1 downto 0);
           OPi : in  STD_LOGIC_VECTOR (CONSTANT_INSTRU downto 0);
           Ao : out  STD_LOGIC_VECTOR (CONSTANT_OPERAND-1 downto 0);
           Bo : out  STD_LOGIC_VECTOR (CONSTANT_OPERAND-1 downto 0);
           Co : out  STD_LOGIC_VECTOR (CONSTANT_OPERAND-1 downto 0);
           OPo : out  STD_LOGIC_VECTOR (CONSTANT_INSTRU-1 downto 0));
end Pipeline;

architecture Behavioral of Pipeline is

begin
process 
        begin
            wait until CLK'EVENT AND CLK ='1';
            if RST = '0' then
                Ao <= (others => '0');
                OPo <= (others => '0');
                Bo <= (others => '0');
                Co <= (others => '0');
            else
                Ao <= Ai;
                OPo <= OPi;
                Bo <= Bi;
                Co <= Ci;
                    
            end if;
        end process;

end Behavioral;