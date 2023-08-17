----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2023 12:28:32 PM
-- Design Name: 
-- Module Name: TB_Decoder_2_to_4 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Decoder_3_to_8 is
--  Port ( );
end TB_Decoder_3_to_8;

architecture Behavioral of TB_Decoder_3_to_8 is
COMPONENT Decoder_3_to_8
     PORT( I : IN STD_LOGIC_VECTOR(2 downto 0);
           EN : IN STD_LOGIC;
           Y : OUT STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

SIGNAL I : std_logic_vector(2 downto 0);
SIGNAL EN : std_logic;
SIGNAL Y : std_logic_vector(7 downto 0);

begin
UUT : Decoder_3_to_8 PORT MAP(
    I(0) => I(0),
    I(1) => I(1),
    I(2) => I(2),
    EN => EN,
    Y(0) => Y(0),
    Y(1) => Y(1),
    Y(2) => Y(2),
    Y(3) => Y(3),
    Y(4) => Y(4),
    Y(5) => Y(5),
    Y(6) => Y(6),
    Y(7) => Y(7)   
);

process
begin
    I(0) <= '0';
    I(1) <= '0';
    I(2) <= '0';
    EN <= '1';
    
-- Index Number : 210518H => 110 011 011 001 010 110    
-- 110
    WAIT FOR 100 ns;
    I(1) <= '1';
    I(2) <= '1';
    
-- 010
    WAIT FOR 100 ns;
    I(2) <= '0';
    
-- 001
    WAIT FOR 100 ns;
    I(0) <= '1';
    I(1) <= '0';
    
-- 011
    WAIT FOR 100 ns;
    I(1) <= '1';
    
-- 011
    WAIT FOR 100 ns;
    
-- 110
    WAIT FOR 100 ns;
    I(0) <= '0';
    I(2) <= '1';
    
    WAIT;

end process;
end Behavioral;    
