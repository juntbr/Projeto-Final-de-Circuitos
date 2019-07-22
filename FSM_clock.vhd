-- Instituicao: UFSC
-- Data: 04/07/2019 
-- Autores: Victor Hugo Schneider de Almeida(19100548) / Leonardo Gideão Costa Rocha (19102922)

library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity FSM_clock is port(
CLK,RST,EN: in std_logic;
c05hz,c1hz,c2hz,c4hz,c10hz: out std_logic
);
end entity;

architecture arclock of FSM_clock is
signal cont05,cont1,cont2,cont4,cont10: std_logic_vector(27 downto 0);
begin
	process(CLK,RST,EN,cont05,cont1,cont2,cont4,cont10)
	begin
		if RST = '1' then
		cont05 <= x"0000000";
		cont1 <= x"0000000";
		cont2 <= x"0000000";
		cont4 <= x"0000000";
		cont10 <= x"0000000";
		elsif CLK'event and CLK = '1' then
		if EN = '1' then
			cont05 <= cont05 + 1;
			cont1 <= cont1 + 1;
			cont2 <= cont2 + 1;
			cont4 <= cont4 + 1;
			cont10 <= cont10 + 1;
				if cont05 = x"5F5E0FF" then
					cont05 <= x"0000000";
					c05hz <= '1';
				else
					c05hz <= '0';
				end if;
				if cont1 = x"2FAF07F" then
					cont1 <= x"0000000";
					c1hz <= '1';
				else
				c1hz <= '0';
				end if;
				if cont2 = x"17D783F" then
					cont2 <= x"0000000";
					c2hz <= '1';
				else
				c2hz <= '0';
				end if;
				if cont4 = x"0BEBC1F" then
					cont4 <= x"0000000";
					c4hz <= '1';
				else
					c4hz <= '0';
				end if;
				if cont10 = x"04C4B3F" then
					cont10 <= x"0000000";
					c10hz <= '1';
				else
					c10hz <= '0';
				end if;
			end if;
		end if;
	end process;
end architecture;
