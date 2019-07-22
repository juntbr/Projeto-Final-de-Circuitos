-- Instituicao: UFSC
-- Data: 04/07/2019 
-- Autores: Victor Hugo Schneider de Almeida(19100548) / Leonardo Gideão Costa Rocha (19102922)
library ieee;
use ieee.std_logic_1164.all;

entity decoder is
port (e: in std_logic_vector(3 downto 0);
		s: out std_logic_vector(9 downto 0)
);
end entity;

architecture dec of decoder is
begin
s <= "1111111111" when e = "0000" else
"1111111110" when e = "0001" else
"1111111100" when e = "0010" else
"1111111000" when e = "0011" else
"1111110000" when e = "0100" else
"1111100000" when e = "0101" else
"1111000000" when e = "0110" else
"1110000000" when e = "0111" else
"1100000000" when e = "1000" else
"1000000000" when e = "1001" else
"0000000000";
end architecture;
