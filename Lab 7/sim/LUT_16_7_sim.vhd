----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/28/2023 07:27:12 PM
-- Design Name: 
-- Module Name: LUT_16_7_sim - Behavioral
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

entity LUT_16_7_sim is
--  Port ( );
end LUT_16_7_sim;

architecture Behavioral of LUT_16_7_sim is
    component LUT_16_7 is
        port (
            address : in std_logic_vector(3 downto 0);
            data : out std_logic_vector(6 downto 0)
        );
    end component;
    
    signal address : std_logic_vector(3 downto 0) := "0000";
    signal data : std_logic_vector(6 downto 0);


begin
    UUT : LUT_16_7
        port map (
            address => address,
            data => data
        );
        
    process
        begin
            address <= "0000";
            wait for 100 ns;
            
            address <= "0001";
            wait for 100 ns;

            address <= "0010";
            wait for 100 ns;

            address <= "0011";
            wait for 100 ns;
           
            address <= "0100";
            wait for 100 ns;
          
            address <= "0101";
            wait for 100 ns;
         
            address <= "0110";
            wait for 100 ns;
          
            address <= "0111";
            wait for 100 ns;
            
            address <= "1000";
            wait for 100 ns;
            
            address <= "1001";
            wait for 100 ns;
                       
            address <= "1010";
            wait for 100 ns;
                      
            address <= "1011";
            wait for 100 ns;
                     
            address <= "1100";
            wait for 100 ns;
                      
            address <= "1101";
            wait for 100 ns;
            
            address <= "1110";
            wait for 100 ns;
            
            address <= "1111";
            wait;
    end process;
end Behavioral;
