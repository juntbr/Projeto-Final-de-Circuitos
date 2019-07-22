-- Instituicao: UFSC
-- Data: 04/07/2019 
-- Autores: Victor Hugo Schneider de Almeida(19100548) / Leonardo Gideão Costa Rocha (19102922)

library ieee;
use ieee.std_logic_1164.all;

entity mux is
port (a,b,c,d: in std_logic_vector(6 downto 0);
		sel: in std_logic_vector(1 downto 0);
		s: out std_logic_vector(6 downto 0)
);
end entity;
		
architecture arcmux of mux is
begin
s <= a when sel = "00" else
b when sel = "01" else
c when sel = "10" else
d;

end architecture;
		
