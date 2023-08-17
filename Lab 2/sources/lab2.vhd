----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2023 11:37:43 AM
-- Design Name: 
-- Module Name: lab2 - Behavioral
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

entity lab2 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           X : out STD_LOGIC;
           Y : out STD_LOGIC;
           Z : out STD_LOGIC);
end lab2;

architecture Behavioral of lab2 is
signal NOT_A : std_logic;
signal NOT_B : std_logic;
signal NOT_C : std_logic;

begin

NOT_A <= NOT A;
NOT_B <= NOT B;
NOT_C <= NOT C;

--green light
X <= A AND B AND C;

--amber light
Y <= ((A XOR B) AND C) OR ((A AND B) AND NOT_C);

--red light
Z <= ((A XOR B) AND NOT_C) OR ((A NOR B) AND C) OR ((A NOR B) AND NOT_C);
end Behavioral;
