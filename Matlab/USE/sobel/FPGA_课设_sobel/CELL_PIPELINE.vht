LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
USE IEEE.NUMERIC_STD.ALL;
USE STD.TEXTIO.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
ENTITY CELL_PIPELINE_vhd_tst IS
END CELL_PIPELINE_vhd_tst;
ARCHITECTURE CELL_PIPELINE_arch OF CELL_PIPELINE_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL CLR : STD_LOGIC;
SIGNAL ENA : STD_LOGIC;
SIGNAL I_END : STD_LOGIC;
SIGNAL I_ORI : STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL I_OUT : STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL PIXEL : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL RESULT : SIGNED(7 DOWNTO 0);
SIGNAL Y : SIGNED(7 DOWNTO 0);
SIGNAL sim_end,WR_ENA,OUT_EN:STD_LOGIC;
COMPONENT CELL_PIPELINE
	PORT (
	CLK : IN STD_LOGIC;
	CLR : IN STD_LOGIC;
	ENA : IN STD_LOGIC;
	I_END : OUT STD_LOGIC;
	I_ORI : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
	I_OUT : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
	PIXEL : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	RESULT : OUT SIGNED(7 DOWNTO 0);
	Y : IN SIGNED(7 DOWNTO 0);
	OUT_EN:OUT STD_LOGIC
	);
END COMPONENT;
TYPE STATUS_TYPE is (IDLE,  FILE_OPEN,WRITE_BEGIN,  FILE_CLOSE  );
SIGNAL STATUS:STATUS_TYPE:=IDLE;
BEGIN
	i1 : CELL_PIPELINE
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	CLR => CLR,
	ENA => ENA,
	I_END => I_END,
	I_ORI => I_ORI,
	I_OUT => I_OUT,
	PIXEL => PIXEL,
	RESULT => RESULT,
	Y => Y,
	OUT_EN=>OUT_EN
	);
init :   	PROCESS   --这个进程用来产生CLK信号，周期为10ns                                                               
				BEGIN                         
				WAIT FOR 5 NS;
				CLK<='0';
				WAIT FOR 5 NS;
				CLK<='1';  
				END PROCESS init;   
Y_GEN:    	PROCESS  --这个进程用来初始化细胞状态为0
				BEGIN
				Y<=(OTHERS=>'0');  WAIT;
				END PROCESS;
I_ORI_GEN:	PROCESS --这个进程用来给定第一个要处理的像素地址--因为在100*100分辨的图片的上下左右增加了一条全为0的边
				BEGIN	  --所以第一个像素的地址为103
				I_ORI<=STD_LOGIC_VECTOR(TO_UNSIGNED(103,14));  WAIT;
				END PROCESS;
CLR_GEN:  	PROCESS  --清零信号，在前20ns有效
				BEGIN  
				CLR<='1'; 
				WAIT FOR 20 NS;
				CLR<='0';  WAIT;     
				END PROCESS;                                   
ENA_GEN:  	PROCESS  --使能信号，在20ns后有效
				BEGIN  
				ENA<='0';  
				WAIT FOR 20 NS;
				ENA<='1';  WAIT;    
				END PROCESS;                 

PROCESS(OUT_EN)
FILE      FILE1 : TEXT;   
VARIABLE  FILE_STATUS:FILE_OPEN_STATUS;
VARIABLE  BUF:LINE;
BEGIN
  IF OUT_EN'EVENT AND OUT_EN='1' THEN
   CASE (STATUS)IS
     WHEN IDLE=>IF WR_ENA='0' THEN
	              STATUS<=IDLE;
					 ELSE STATUS<=FILE_OPEN;
                END IF;
	  WHEN FILE_OPEN=> STATUS<=WRITE_BEGIN;
	                   FILE_OPEN(FILE_STATUS,FILE1,"data_record.txt",write_mode);          
     WHEN WRITE_BEGIN=> WRITE(BUF,PIXEL);
                        WRITELINE(FILE1,BUF);			
			              IF  SIM_END='1' THEN	
							      STATUS<=FILE_CLOSE;
							  ELSE  STATUS<=WRITE_BEGIN;
							  END IF;
     WHEN FILE_CLOSE=>FILE_CLOSE(FILE1);
	  WHEN OTHERS=>STATUS<=IDLE;
	  END CASE;
	  END IF;
	  END PROCESS;
WR_ENA_GEN:PROCESS
BEGIN
WR_ENA<='0';
  WAIT FOR 168 NS;
  WR_ENA<='1';
  WAIT;
END PROCESS;

SIM_END_GEN:PROCESS
BEGIN
SIM_END<='0';
  WAIT FOR 1600000 NS;
  SIM_END<='1';
  WAIT;
END PROCESS;  
          
 
END CELL_PIPELINE_arch;
