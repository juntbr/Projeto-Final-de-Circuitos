-- Instituicao: UFSC
-- Data: 04/07/2019 
-- Autores: Victor Hugo Schneider de Almeida(19100548) / Leonardo Gideão Costa Rocha (19102922)

library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_unsigned.all;
entity comp is
port (uo,ui: in std_logic_vector(5 downto 0);
      endgame: in std_logic;
      O,I: out std_logic
		);
end entity;

architecture comparador of comp is
begin
process(uo,ui,endgame)
begin
if uo > ui and endgame = '1' then
	O <= '1';
	I <= '0';
elsif uo <= ui and endgame = '1' then
	O <= '0';
	I <= '1';
else
	O <= '0';
	I <= '0';
end if;
end process;
end architecture;
