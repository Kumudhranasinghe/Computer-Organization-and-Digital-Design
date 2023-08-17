----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2023 02:57:14 PM
-- Design Name: 
-- Module Name: AU - Behavioral
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

entity AU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end AU;

architecture Behavioral of AU is
    component Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component RCA_4 is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_out : out STD_LOGIC);
    end component;
    
    component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
    end component;
    
    signal Clk_slow : STD_LOGIC;
    signal Y : STD_LOGIC_VECTOR(1 downto 0);
    signal QA : STD_LOGIC_VECTOR(3 downto 0);
    signal QB : STD_LOGIC_VECTOR(3 downto 0);
    signal QC : STD_LOGIC_VECTOR(3 downto 0);
    
begin
    Y(0) <= NOT RegSel ;
    Y(1) <= RegSel ;
    Zero <= (NOT QC(0)) AND (NOT QC(1)) AND (NOT QC(2)) AND (NOT QC(3));
    S <= QC;
    
    Slow_Clk_0 : Slow_Clk 
    port map(
        Clk_in => Clk,
        Clk_out => Clk_slow );
    
    Reg_A : Reg
    port map(
        D => A,
        Clk => Clk_slow,
        En => Y(0),
        Q => QA );
        
    Reg_B : Reg
    port map(
        D => A,
        Clk => Clk_slow,
        En => Y(1),
        Q => QB );
        
    RCA_4_0 : RCA_4
    port map(
        A0 => QA(0),
        A1 => QA(1),
        A2 => QA(2),
        A3 => QA(3),
        B0 => QB(0),
        B1 => QB(1),
        B2 => QB(2),
        B3 => QB(3),
        C_in => '0',
        C_out => Carry,
        S0 => QC(0),
        S1 => QC(1),
        S2 => QC(2),
        S3 => QC(3) );

end Behavioral;
