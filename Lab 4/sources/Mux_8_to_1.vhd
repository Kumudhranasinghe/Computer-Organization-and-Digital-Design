----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2023 08:46:11 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
    component Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    signal Y0 : STD_LOGIC_VECTOR(7 downto 0);

begin
    Decoder_3_to_8_0 : Decoder_3_to_8
    port map(
        I => S,
        EN => EN,
        Y => Y0 );
    process(Y0,D)
    begin
        if Y0(0) = '1' then
            Y <= D(0);
        elsif Y0(1) = '1' then
            Y <= D(1);
        elsif Y0(2) = '1' then
            Y <= D(2);
        elsif Y0(3) = '1' then
            Y <= D(3);
        elsif Y0(4) = '1' then
            Y <= D(4);
        elsif Y0(5) = '1' then
            Y <= D(5);
        elsif Y0(6) = '1' then
            Y <= D(6);
        else
            Y <= D(7);
        end if;
    end process;
end Behavioral;
