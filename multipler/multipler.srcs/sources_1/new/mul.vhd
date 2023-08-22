----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/20/2023 03:13:47 PM
-- Design Name: 
-- Module Name: mul - Behavioral
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
use ieee.std_logic_arith.all;
use IEEE.numeric_bit.all;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mul is
  Port(
  A: in std_logic_vector (3 downto 0);
  B: in std_logic_vector (3 downto 0);
  P: out std_logic_vector (7 downto 0)
  );
end mul;

architecture Behavioral of mul is
    signal pp0, pp1, pp2, pp3: std_logic_vector (3 downto 0);
    signal ps1, ps2, ps3: std_logic_vector (3 downto 0);
    signal ppp1, ppp2, ppp3: std_logic_vector (4 downto 0);
    signal pps1, pps2, pps3: std_logic_vector (4 downto 0);
begin

pp0 <= a and (3 downto 0 => b(0));
pp1 <= a and (3 downto 0 => b(1));
pp2 <= a and (3 downto 0 => b(2));
pp3 <= a and (3 downto 0 => b(3));

ps1(3) <= '0';
ps2(3) <= pps1(4);
ps3(3) <= pps2(4);

ps1(2 downto 0) <= pp0 (3 downto 1);
ps2(2 downto 0) <= pp1 (3 downto 1);
ps3(2 downto 0) <= pp2 (3 downto 1);

ppp1(3 downto 0) <= pp1(3 downto 0);
ppp2(3 downto 0) <= pp2(3 downto 0);
ppp3(3 downto 0) <= pp3(3 downto 0);

ppp1(4) <= '0';
ppp2(4) <= '0';
ppp3(4) <= '0';

pps1 <= ppp1 + pps1;
pps2 <= ppp2 + pps2;
pps3 <= ppp3 + pps3;

P(7 downto 3) <= pps3(4 downto 0);
P(2) <= pps2(0);
P(1) <= pps1(0);
P(0) <= pp0(0);
end Behavioral;
