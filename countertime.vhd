-- Instituicao: UFSC
-- Data: 04/07/2019 
-- Autores: Victor Hugo Schneider de Almeida(19100548) / Leonardo Gideão Costa Rocha (19102922)
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity countertime is port(
CLK,reset,enable: in std_logic;
Q: out std_logic;
T: out std_logic_vector(3 downto 0));
end entity;

architecture count_time of countertime is
signal cont : std_logic_vector(3 downto 0);
begin
	process(CLK,reset,enable,cont)
	begin
		if reset = '1' then
		cont <= "0000";
		elsif CLK'event and CLK = '1' then
		if enable = '1' then
			cont <= cont + 1;
				if cont = "1001" then 
				Q <= '1';
				else
				Q <= '0';
					end if;
			end if;
		end if;
		T <= cont;
	end process;
end architecture;
