----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2023 04:05:57 PM
-- Design Name: 
-- Module Name: AU_sim - Behavioral
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

entity AU_sim is
--  Port ( );
end AU_sim;

architecture Behavioral of AU_sim is
    component AU is
        port (
            A : in std_logic_vector(3 downto 0);
            Clk : in std_logic;
            RegSel : in std_logic;
            S : out std_logic_vector(3 downto 0);
            Zero : out std_logic;
            Carry : out std_logic
        );
    end component;
    
    signal A : std_logic_vector(3 downto 0) := "0000";
    signal Clk : std_logic := '0';
    signal RegSel : std_logic := '0';
    signal S : std_logic_vector(3 downto 0);
    signal Zero : std_logic := '0';
    signal Carry : std_logic := '0';
    
begin
    UUT : AU PORT MAP (
            A => A,
            Clk => Clk,
            RegSel => RegSel,
            S => S,
            Zero => Zero,
            Carry => Carry
    );
        
    Clock : process
    begin
        CLK <= '1';
        wait for 2 ns;
        CLK <= '0';
        wait for 2 ns;
    end process;
    
    process
    begin
    --checking whether input is stored into register
        A <= "0001";
        wait for 5 ns;
        RegSel <= '1';
        A <= "0001";
        wait for 45 ns;
        RegSel <= '0';
        A <= "0010";
        wait for 50 ns;
        
    --checking whether addition is working properly
    -- 0010 + 0011
        RegSel <= '1';
        A <= "0011";
        wait for 50 ns;
        
    --making the registers empty
        RegSel <= '0';
        A <= "0000";
        wait for 50 ns;
        RegSel <= '1';
        A <= "0000";
        wait for 50 ns;
        
    --checking whether overflow is outputed
    --  1111 + 0001
        RegSel <= '0';
        A <= "1111";
        wait for 50 ns;
        RegSel <= '1';
        A <= "0001";
        wait for 50 ns;
        
    --making the registers empty
    --checking whether zero is outputed
        RegSel <= '0';
        A <= "0000";
        wait for 50 ns;
        RegSel <= '1';
        A <= "0000";
        wait for 50 ns;
        
    --index number 210518H = 0011 0011 0110 0101 0110
    -- 0101 + 0110
        RegSel <= '0';
        A <= "0110";
        wait for 50 ns;
        RegSel <= '1';
        A <= "0101";
        wait for 50 ns;
        
    -- 0110 + 0101
        RegSel <= '0';
        A <= "0110";
        wait for 50 ns;
        
    -- 0011 + 0110
        RegSel <= '1';
        A <= "0011";
        wait for 50 ns;
        
    --0011 + 0011
        RegSel <= '0';
        
        wait;
    end process;
    
end Behavioral;
