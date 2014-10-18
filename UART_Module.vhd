library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
entity UART_Module is
port( Clk     : IN  STD_LOGIC;
      RX_LINE : IN  STD_LOGIC;
	    TX_LINE : OUT STD_LOGIC;
		  RX_BUSY : OUT STD_LOGIC;
      TX_BUSY : OUT STD_LOGIC);
end entity;
 
architecture UART_arc of UART_Module is 
 
component TX is
generic(sel  : STD_LOGIC_VECTOR(2 downto 0));
port(Clk     : IN  STD_LOGIC;
	   TX_LINE : OUT STD_LOGIC;
	   TX_DATA : IN  STD_LOGIC_VECTOR(7 downto 0);
	   TX_BUSY : OUT STD_LOGIC);
end component;
 
component RX is
generic(sel  : STD_LOGIC_VECTOR(2 downto 0));
port(Clk     : IN  STD_LOGIC;
     RX_LINE : IN  STD_LOGIC;
     RX_DATA : OUT STD_LOGIC_VECTOR(7 downto 0);
     RX_BUSY : OUT STD_LOGIC);
end component;

signal TX_DATA : STD_LOGIC_VECTOR(7 downto 0); 
signal RX_DATA : STD_LOGIC_VECTOR(7 downto 0); 
 
begin
  
TX1 : TX generic map ("011") port map(Clk, TX_LINE, TX_DATA, TX_BUSY);
RX1 : RX generic map ("011") port map(Clk, RX_LINE, RX_DATA, RX_BUSY);

end UART_arc;
