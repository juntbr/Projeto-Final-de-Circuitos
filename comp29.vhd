-- Instituicao: UFSC
-- Data: 04/07/2019 
-- Autores: Victor Hugo Schneider de Almeida(19100548) / Leonardo Gideão Costa Rocha (19102922)
library IEEE;
use IEEE.Std_Logic_1164.all;

entity comp29 is
port (I: in std_logic_vector(5 downto 0);
		O: out std_logic
		);
end comp29;

architecture comp of comp29 is
begin
O <= '1' when 	I > "011101" else
	  '0';
end architecture;
