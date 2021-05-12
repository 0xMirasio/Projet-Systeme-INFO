library IEEE;
use IEEE.STD_LOGIC_1164.all;

package constants is

    constant CONSTANT_ADDRESS : Natural := 8;
    constant CONSTANT_OUT : Natural := 32;
    constant CONSTANT_OPERAND : Natural := 8;
    constant CONSTANT_INSTRU : Natural := 8;
    
    constant CONSTANT_OP_NOP    : std_logic_vector(CONSTANT_INSTRU - 1 downto 0) := x"00";

    constant CONSTANT_OP_ADD    : std_logic_vector(CONSTANT_INSTRU - 1 downto 0) := x"01";
    constant CONSTANT_OP_MUL    : std_logic_vector(CONSTANT_INSTRU - 1 downto 0) := x"02";
    constant CONSTANT_OP_SUB    : std_logic_vector(CONSTANT_INSTRU - 1 downto 0) := x"03";
    constant CONSTANT_OP_DIV    : std_logic_vector(CONSTANT_INSTRU - 1 downto 0) := x"04";

    constant CONSTANT_OP_COP    : std_logic_vector(CONSTANT_INSTRU - 1 downto 0) := x"05";
    constant CONSTANT_OP_AFC    : std_logic_vector(CONSTANT_INSTRU - 1 downto 0) := x"06";

    constant CONSTANT_OP_LOAD	  : std_logic_vector(CONSTANT_INSTRU - 1 downto 0) := x"07";
    constant CONSTANT_OP_STORE    : std_logic_vector(CONSTANT_INSTRU - 1 downto 0) := x"08";

--    constant CONSTANT_OP_INF    : std_logic_vector(CONSTANT_INSTRU - 1 downto 0) := x"09";
--    constant CONSTANT_OP_SUP    : std_logic_vector(CONSTANT_INSTRU - 1 downto 0) := x"0A";
--
--    constant CONSTANT_OP_EQU    : std_logic_vector(CONSTANT_INSTRU - 1 downto 0) := x"0B";
--    constant CONSTANT_OP_PRI    : std_logic_vector(CONSTANT_INSTRU - 1 downto 0) := x"0C";
	 
	 
--        : std_logic_vector(CONSTANT_INSTRU - 1 downto 0) := x"0D";
--        : std_logic_vector(CONSTANT_INSTRU - 1 downto 0) := x"0E";
    
    end constants;
    
package body constants is
end constants;