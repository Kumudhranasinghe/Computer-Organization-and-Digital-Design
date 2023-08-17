----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/28/2023 08:58:29 PM
-- Design Name: 
-- Module Name: AU_7_seg_sim - Behavioral
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

entity AU_7_seg_sim is
--  Port ( );
end AU_7_seg_sim;

architecture Behavioral of AU_7_seg_sim is
    component AU_7_seg is
    port (
        A : in std_logic_vector(3 downto 0);
        Clk : in std_logic;
        RegSel : in std_logic;
        S_LED : inout std_logic_vector(3 downto 0);
        S_7Seg : out std_logic_vector(6 downto 0);
        Zero : out std_logic;
        Carry : out std_logic
    );
    end component;
    
    signal A : std_logic_vector(3 downto 0) := "0000";
    signal Clk : std_logic := '0';
    signal RegSel : std_logic := '0';
    signal S_LED : std_logic_vector(3 downto 0);
    signal S_7Seg : std_logic_vector(6 downto 0);
    signal Zero : std_logic := '0';
    signal Carry : std_logic := '0';


begin
    UUT : AU_7_seg PORT MAP (
            A => A,
            Clk => Clk,
            RegSel => RegSel,
            S_LED => S_LED,
            S_7Seg => S_7Seg,
            Zero => Zero,
            Carry => Carry
    );
    
    Clock : process
        begin
            CLK <= '1';
            wait for 1 us;
            CLK <= '0';
            wait for 1 us;
        end process;

process
    begin
    --checking whether input is stored into register
        A <= "0001";
        wait for 0 ms;
        RegSel <= '1';
        A <= "0001";
        wait for 50 ms;
        RegSel <= '0';
        A <= "0010";
        wait for 950 ms;
        
    --checking whether addition is working properly
    -- 0010 + 0011
        RegSel <= '1';
        A <= "0011";
        wait for 1000 ms;
        
    --making the registers empty
        RegSel <= '0';
        A <= "0000";
        wait for 1000 ms;
        RegSel <= '1';
        A <= "0000";
        wait for 1000 ms;
        
    --checking whether overflow is outputed
    --  1111 + 0001
        RegSel <= '0';
        A <= "1111";
        wait for 1000 ms;
        RegSel <= '1';
        A <= "0001";
        wait for 1000 ms;
        
    --making the registers empty
    --checking whether zero is outputed
        RegSel <= '0';
        A <= "0000";
        wait for 1000 ms;
        RegSel <= '1';
        A <= "0000";
        wait for 1000 ms;
        
    --index number 210518H = 0011 0011 0110 0101 0110
    -- 0101 + 0110
        RegSel <= '0';
        A <= "0110";
        wait for 1000 ms;
        RegSel <= '1';
        A <= "0101";
        wait for 1000 ms;
            
    -- 0110 + 0101
        RegSel <= '0';
        A <= "0110";
        wait for 1000 ms;
            
    -- 0011 + 0110
        RegSel <= '1';
        A <= "0011";
        wait for 1000 ms;
            
    --0011 + 0011
        RegSel <= '0';
            
        wait;
    end process;
end Behavioral;
