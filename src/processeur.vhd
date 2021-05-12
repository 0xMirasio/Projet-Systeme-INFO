library IEEE, work;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

use work.constants.all;

entity processeur is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           POUT : out  STD_LOGIC_VECTOR (7 downto 0));
end processeur;

architecture Behavioral of processeur is
	 
	---------------------------------------------------
	--						MEM INSTRUCT						 --
	---------------------------------------------------	
	COMPONENT bancMEMINSTRUC
	 PORT ( 
			 addr : in  STD_LOGIC_VECTOR (7 downto 0);
			 CLK : in  STD_LOGIC;
			 OUTD : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	END COMPONENT;

	
	---------------------------------------------------
	--						BANC REGISTRE						 --
	---------------------------------------------------
	COMPONENT bancReg is
    PORT ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Wb : in  STD_LOGIC_VECTOR (3 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0)
			 );
	END COMPONENT;


	---------------------------------------------------
	--								ALU						 	 --
	---------------------------------------------------
	COMPONENT alu
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Ctrl_Alu : IN  std_logic_vector(2 downto 0);
         S : OUT  std_logic_vector(7 downto 0);
         N : OUT  std_logic;
         O : OUT  std_logic;
         Z : OUT  std_logic;
         C : OUT  std_logic
        );
    END COMPONENT;
	 
	 
	 ---------------------------------------------------
	 --						MEM DATA					 --
	 ---------------------------------------------------
	 COMPONENT bancMemDATA 
    PORT ( addr : in  STD_LOGIC_VECTOR (7 downto 0);
           IND : in  STD_LOGIC_VECTOR (7 downto 0);
           RW : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           OUTD : out  STD_LOGIC_VECTOR (7 downto 0));
	 END COMPONENT;

	
--	COMPONENT Pipeline 
--    Port ( CLK : in  STD_LOGIC;
--           RST : in  STD_LOGIC;
--           Ai : in  STD_LOGIC_VECTOR (CONSTANT_OPERAND-1 downto 0);
--           Bi : in  STD_LOGIC_VECTOR (CONSTANT_OPERAND-1 downto 0);
--           Ci : in  STD_LOGIC_VECTOR (CONSTANT_OPERAND-1 downto 0);
--           OPi : in  STD_LOGIC_VECTOR (CONSTANT_INSTRU downto 0);
--           Ao : out  STD_LOGIC_VECTOR (CONSTANT_OPERAND-1 downto 0);
--           Bo : out  STD_LOGIC_VECTOR (CONSTANT_OPERAND-1 downto 0);
--           Co : out  STD_LOGIC_VECTOR (CONSTANT_OPERAND-1 downto 0);
--           OPo : out  STD_LOGIC_VECTOR (CONSTANT_INSTRU-1 downto 0));
--	END COMPONENT;

	SIGNAL aLD, opLD, bLD, cLD : STD_LOGIC_VECTOR(CONSTANT_OPERAND-1 downto 0) := (others => '0');
	SIGNAL aDE, opDE, bDE, cDE : STD_LOGIC_VECTOR(CONSTANT_OPERAND-1 downto 0) := (others => '0');
	SIGNAL aEM, opEM, bEM : STD_LOGIC_VECTOR(CONSTANT_OPERAND-1 downto 0) := (others => '0');
	SIGNAL aMR, opMR, bMR : STD_LOGIC_VECTOR(CONSTANT_OPERAND-1 downto 0) := (others => '0');
	
	
	SIGNAL LCMR : STD_LOGIC;
	SIGNAL LCDE : STD_LOGIC_VECTOR(2 downto 0);
	SIGNAL LCEM : STD_LOGIC;
	
	SIGNAL tempMEMINSTRU : STD_LOGIC_VECTOR(CONSTANT_OUT-1 downto 0);
	SIGNAL tmpIN : STD_LOGIC_VECTOR(CONSTANT_ADDRESS-1 downto 0);
	
	SIGNAL addr : STD_LOGIC_VECTOR(CONSTANT_ADDRESS-1 downto 0);
	SIGNAL QA : STD_LOGIC_VECTOR(CONSTANT_ADDRESS-1 downto 0);
	SIGNAL QB : STD_LOGIC_VECTOR(CONSTANT_ADDRESS-1 downto 0);
	
	SIGNAL S : STD_LOGIC_VECTOR(CONSTANT_ADDRESS-1 downto 0);
	SIGNAL N : STD_LOGIC;
	SIGNAL O : STD_LOGIC;
	SIGNAL Z : STD_LOGIC;
	SIGNAL C : STD_LOGIC;
	
	SIGNAL addrDATA : STD_LOGIC_VECTOR(CONSTANT_ADDRESS-1 downto 0);
	SIGNAL outDATA : STD_LOGIC_VECTOR(CONSTANT_ADDRESS-1 downto 0);
	
	
begin
my_meminstru : bancMemINSTRUC PORT MAP(addr=>addr, CLK=>CLK, OUTD=>tempMEMINSTRU);
my_bancReg : bancReg PORT MAP(A=>bLD(3 downto 0), B=>cLD(3 downto 0), Wb=>aMR(3 downto 0), W=>LCMR, DATA=>bMR, RST=>'1', CLK=>CLK, QA=>QA, QB=>QB);
my_alu: alu PORT MAP(A=>bDE,B=>cDE, Ctrl_Alu=>LCDE, S=>S, N=>OPEN, O=>OPEN, Z=>OPEN, C=>OPEN);
my_bancMemDATA : bancMemDATA PORT MAP(addr=>addrDATA, IND=>bEM , RW=>LCEM, RST=>RST, CLK=>CLK, OUTD=>outDATA);

	process
		begin
			WAIT UNTIL CLK'EVENT AND CLK = '1';
			if rst = '1' then
				
				--Pipeline LI/DL
				aLD <= tempMEMINSTRU(23 downto 16);
				bLD <= tempMEMINSTRU(15 downto 8);
				cLD <= tempMEMINSTRU(7 downto 0);
				opLD <= tempMEMINSTRU(31 downto 24);

				--Pipeline DI/EX
				aDE <= aLD; 
				opDE <= opLD;	
				if opLD = CONSTANT_OP_COP 
				or opLD = CONSTANT_OP_ADD
				or opLD = CONSTANT_OP_SUB
				or opLD = CONSTANT_OP_MUL then
					bDE <= QA;
				else
					bDE <= bLD; 
				end if;
				cDE <= QB;
				
				--Pipeline EX/MEM
				aEM <= aDE;
				opEM <= opDE;
				if opDE = CONSTANT_OP_ADD
				or opDE = CONSTANT_OP_SUB
				or opDE = CONSTANT_OP_MUL then
					bEM <= S;
				else
					bEM <= bDE; 
				end if;
				
				if opEM = CONSTANT_OP_STORE then
					addrDATA <= aEM;
				else
					addrDATA <= bEM;
				end if;
				
				--Pipeline Mem/RE
				aMR <= aEM;
				opMR <= opEM;
				if opEM = CONSTANT_OP_LOAD then
					bMR <= outDATA;
				else
					bMR <= bEM;
				end if;

				addr <= addr + 1;
			else
				addr <= x"00";
			end if;
	end process;
	
	--LC Alu
	LCDE <= opDE(2 downto 0) 
		when opDE = CONSTANT_OP_ADD 
		or opDE = CONSTANT_OP_SUB
		or opDE = CONSTANT_OP_MUL ELSE
			"000";
	
	--LC MemDATA
	LCEM <= '0' WHEN opEM = CONSTANT_OP_STORE ELSE 
		'1';
				
	--LC bancReg
	LCMR <= '1' 
		WHEN opMR = CONSTANT_OP_AFC 
		or opMR = CONSTANT_OP_COP 
		or opMR = CONSTANT_OP_ADD
		or opMR = CONSTANT_OP_SUB
		or opMR = CONSTANT_OP_MUL 
		or opMR = CONSTANT_OP_LOAD ELSE 
			'0';
	
		
		POUT <= aMR;
end Behavioral;

