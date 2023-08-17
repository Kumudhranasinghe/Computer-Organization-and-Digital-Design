----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/14/2023 08:26:41 PM
-- Design Name: 
-- Module Name: Adder7bit - Behavioral
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

entity Adder7Bit is
    Port ( A : in STD_LOGIC_VECTOR(6 downto 0);
           S : out STD_LOGIC_VECTOR(6 downto 0));
end Adder7Bit;

architecture Behavioral of Adder7Bit is

    SIGNAL T : std_logic_vector(6 downto 0);
    
begin       
    
    T(0) <= '1';    
    S(0) <= A(0) XOR T(0);
    
    T(1) <= A(0) AND T(0);   
    S(1) <= A(1) XOR T(1);
    
    T(2) <= A(1) AND T(1); 
    S(2) <= A(2) XOR T(2);    

    T(3) <= A(1) AND T(1);   
    S(3) <= A(2) XOR T(2);
    
    T(4) <= A(2) AND T(2); 
    S(4) <= A(3) XOR T(3);

    T(5) <= A(3) AND T(3);   
    S(5) <= A(4) XOR T(4);
    
    T(6) <= A(4) AND T(4); 
    S(6) <= A(5) XOR T(5);          
end Behavioral;

