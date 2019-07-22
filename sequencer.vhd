library ieee;
use ieee.std_logic_1164.all;

entity sequencer is 
port	(reset,enable,stop,clock: in std_logic;
		hexseq: out std_logic_vector(3 downto 0)
);
end entity;

architecture arcsequence of Sequencer is
	type STATES is (E0,E1,E2,E3,E4,E5,E6,E7,E8,E9,E10,E11,E12,E13,E14,E15);
	signal EA, PE: STATES;
begin
P1: process(clock,reset)
	begin
		if reset = '1' then
			EA <= E0;
		elsif clock'event and clock = '1' and enable = '1' then
			EA <= PE;
		end if;
end process;
P2: process (EA)
	begin
		case EA is
			when E0 => hexseq <= "0000"; 
			if stop = '0' then
			PE <= E0;
			else
			PE <= E1;
			end if;
			when E1 => hexseq <= "0001"; 
			if stop = '0' then
			PE <= E1;
			else
			PE <= E2;
			end if;
			when E2 => hexseq <= "0010"; 
			if stop = '0' then
			PE <= E2;
			else
			PE <= E3;
			end if;
			when E3 => hexseq <= "0011"; 
			if stop = '0' then
			PE <= E3;
			else
			PE <= E4;
			end if;
			when E4 => hexseq <= "0100"; 
			if stop = '0' then
			PE <= E4;
			else
			PE <= E5;
			end if;
			when E5 => hexseq <= "0101"; 
			if stop = '0' then
			PE <= E5;
			else
			PE <= E6;
			end if;
			when E6 => hexseq <= "0110"; 
			if stop = '0' then
			PE <= E6;
			else
			PE <= E7;
			end if;
			when E7 => hexseq <= "0111"; 
			if stop = '0' then
			PE <= E7;
			else
			PE <= E8;
			end if;
			when E8 => hexseq <= "1000"; 
			if stop = '0' then
			PE <= E8;
			else
			PE <= E9;
			end if;
			when E9 => hexseq <= "1001"; 
			if stop = '0' then
			PE <= E9;
			else
			PE <= E10;
			end if;
			when E10 => hexseq <= "1010"; 
			if stop = '0' then
			PE <= E10;
			else
			PE <= E11;
			end if;
			when E11 => hexseq <= "1011"; 
			if stop = '0' then
			PE <= E11;
			else
			PE <= E12;
			end if;
			when E12 => hexseq <= "1100"; 
			if stop = '0' then
			PE <= E12;
			else
			PE <= E13;
			end if;
			when E13 => hexseq <= "1101"; 
			if stop = '0' then
			PE <= E13;
			else
			PE <= E14;
			end if;
			when E14 => hexseq <= "1110"; 
			if stop = '0' then
			PE <= E14;
			else
			PE <= E15;
			end if;
			when E15 => hexseq <= "1111"; 
			if stop = '0' then
			PE <= E15;
			else
			PE <= E0;
			end if;

		end case;
	end process;
end architecture;
