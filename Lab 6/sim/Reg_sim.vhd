----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2023 02:44:11 PM
-- Design Name: 
-- Module Name: Reg_sim - Behavioral
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

entity Reg_sim is
--  Port ( );
end Reg_sim;

architecture Behavioral of Reg_sim is
    component Reg is
        port (
            D : in std_logic_vector(3 downto 0);
            CLK : in std_logic;
            En : in std_logic;
            Q : out std_logic_vector(3 downto 0)
        );
    end component;
    
    signal D : std_logic_vector(3 downto 0) := "0000";
    signal CLK : std_logic := '0';
    signal En : std_logic := '1';
    signal Q : std_logic_vector(3 downto 0);
    
begin
    UUT : Reg
        port map (
            D => D,
            CLK => CLK,
            En => En,
            Q => Q
        );
        
    Clock : process
    begin
        CLK <= '1';
        wait for 50 ns;
        CLK <= '0';
        wait for 50 ns;
    end process;
    
    process
    begin
        D <= "0000";
        wait for 100 ns;
        D <= "0001";
        wait for 100 ns;
        En <= '0';
        D <= "0010";
        wait for 100 ns;
        En <= '1';
        D <= "0011";
        wait for 100 ns;
        En <= '0';
        D <= "0100";
        wait for 100 ns;
        En <= '1';
        D <= "0101";
        wait for 100 ns;
        En <= '0';
        D <= "0110";
        wait for 100 ns;
        En <= '1';
        D <= "0111";
        wait for 100 ns;
        D <= "1000";
        wait for 100 ns;
        D <= "0000";
        wait;
    end process;
    
end Behavioral;