-- Instituicao: UFSC
-- Data: 04/07/2019 
-- Autores: Victor Hugo Schneider de Almeida(19100548) / Leonardo Gideão Costa Rocha (19102922)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity Counter_point is port (
CLK: in std_logic;
reset: in std_logic;
enable: in std_logic;
D: in std_logic_vector(3 downto 0);
T: out std_logic_vector(5 downto 0);
Q: out std_logic
);
end entity;

architecture arcounter of Counter_point is
Signal Tot: std_logic_vector(5 downto 0);
begin
process (CLK, reset, D, enable)
begin
if reset = '1' then
	Tot <= "000000";
	elsif CLK'event and CLK = '1' then
		if enable = '1' then
			Tot <= Tot + D;
		end if;
			if Tot = "011101" then
				Q <= '1';
			else
				Q <= '0';
			end if;
	end if;
end process;
T <= Tot;
end arcounter;
