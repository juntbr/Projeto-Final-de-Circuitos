-- Instituicao: UFSC
-- Data: 04/07/2019 
-- Autores: Victor Hugo Schneider de Almeida(19100548) / Leonardo Gideão Costa Rocha (19102922)
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter_round is port
(reset,en,clock : in std_logic;
endgame: out std_logic;
round: out std_logic_vector(3 downto 0)
);
end entity;
architecture counterarc of counter_round is
signal cont : std_logic_vector(3 downto 0);
begin
	process(reset,en,cont,clock)
	begin
		if reset = '1' then
		cont <= "0000";
		endgame <= '0';
		elsif clock'event and clock= '1' then
		if en = '1' then
			cont <= cont + 1;
				if cont = "1000" then 
				endgame <= '1';
				else
				endgame <= '0';
					end if;
			end if;
		end if;
	end process;
	round <= cont;
end architecture;
