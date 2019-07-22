-- Instituicao: UFSC
-- Data: 04/07/2019 
-- Autores: Victor Hugo Schneider de Almeida(19100548) / Leonardo Gideão Costa Rocha (19102922)

library ieee;
use ieee.std_logic_1164.all;

entity dec7seg is
port (e: in std_logic_vector(3 downto 0);
		s: out std_logic_vector(6 downto 0)
);
end entity;

architecture dec of dec7seg is
begin
			s <= "1000000" when e = "0000" else
				  "1111001" when e = "0001" else
				  "0100100" when e = "0010" else
				  "0110000" when e = "0011" else
				  "0011001" when e = "0100" else
				  "0010010" when e = "0101" else
				  "0000010" when e = "0110" else
				  "1111000" when e = "0111" else
				  "0000000" when e = "1000" else
				  "0011000" when e = "1001" else
				  "0001000" when e = "1010" else
				  "0000011" when e = "1011" else
				  "1000110" when e = "1100" else
				  "0100001" when e = "1101" else
				  "0000110" when e = "1110" else
				  "0001110" when e = "1111";
end architecture;
