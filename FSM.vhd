-- Instituicao: UFSC
-- Data: 04/07/2019 
-- Autores: Victor Hugo Schneider de Almeida(19100548) / Leonardo Gideão Costa Rocha (19102922)ertonceli Bueno (19100539)


library ieee;
use ieee.std_logic_1164.all;
entity FSM is 
port	(clock: in std_logic;
		reset,enter,stop: in std_logic;
		overflow, end_game, end_time, win0, win1: in std_logic;
		R1, R2, E1, E2, E3, E4: out std_logic;
		SEL: out std_logic_vector(1 downto 0)
		);
end entity;
architecture control of FSM is
	type STATES is (Init, Setup, Play, Check, Result, NextRound, Waait);
	signal EA, PE: STATES;
begin
	P1: process(clock, reset)
	begin
		if reset= '0' then
				EA <= Init;
		elsif clock'event and clock= '1' then
				EA <= PE;
		end if;
end process;
P2: process(EA,end_time,end_game,enter,stop,win0,win1,overflow)
begin
	case EA is
		when Init =>	
				R1 <= '1';
				R2 <= '1';
				E1 <= '0';
				E2 <= '0';
				E3 <= '0';
				E4 <= '0';
				SEL <= "00";
				if enter = '0' then
				PE <= Setup;
				else
				PE <= Init;
				end if;
		when Setup =>
				
				R1 <= '0';
				R2 <= '0';
				E1 <= '0';
				E2 <= '1';
				E3 <= '0';
				E4 <= '0';
				SEL <= "01";
				if enter = '0' then
				PE <= Play;
				else
				PE <= Setup;
				end if;
		when Play =>				
				R1 <= '0';
				R2 <= '0';
				E1 <= '1';
				E2 <= '0';
				E3 <= '0';
				E4 <= '1';
				SEL <= "10";
				if stop = '0' and end_time = '0' then
				PE <= Check;
				elsif stop = '1' and end_time = '1' then
				PE <= Result;
				else
				PE <= Play;
				end if;
				
		when Check =>				
				R1 <= '0';
				R2 <= '0';
				E1 <= '1';
				E2 <= '0';
				E3 <= '0';
				E4 <= '0';
				SEL <= "10";
				if win0 = '1' or win1 = '1' or end_game = '1' or overflow = '1' then
				PE <= Result;
				else
				PE <= NextRound;
				end if;
		when NextRound =>				
				R1 <= '0';
				R2 <= '1';
				E1 <= '1';
				E2 <= '0';
				E3 <= '1';
				E4 <= '0';
				SEL <= "10";
				PE <= Waait;
		when Waait =>			
				R1 <= '0';
				R2 <= '0';
				E1 <= '1';
				E2 <= '0';
				E3 <= '0';
				E4 <= '0';
				SEL <= "10";
				if enter = '0' then
				PE <= Play;
				else
				PE <= Waait;
				end if;
		when Result =>					
				R1 <= '0';
				R2 <= '0';
				E1 <= '0';
				E2 <= '0';
				E3 <= '0';
				E4 <= '0';
				SEL <= "11";
				if enter = '0' then
				PE <= Init;
				else
				PE <= Result;
				end if;
		when others =>
				PE <= Init;
		end case;
end process;
end architecture;
