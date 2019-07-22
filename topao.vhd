-- Instituicao: UFSC
-- Data: 04/07/2019 
-- Autores: Victor Hugo Schneider de Almeida(19100548) / Leonardo Gideão Costa Rocha (19102922)


library ieee;
use ieee.std_logic_1164.all;

entity topao is
port(SW: in std_logic_vector(1 downto 0);
	  KEY: in std_logic_vector(3 downto 0);
	  CLOCK_50: in std_logic;
	  HEX5: out std_logic_vector(6 downto 0);
	  HEX4: out std_logic_vector(6 downto 0);
	  HEX3: out std_logic_vector(6 downto 0);
	  HEX2: out std_logic_vector(6 downto 0);
	  HEX1: out std_logic_vector(6 downto 0);
	  HEX0: out std_logic_vector(6 downto 0);
	  LEDR: out std_logic_vector(9 downto 0)
); 
end entity;

architecture topo of topao is

signal sBTN0,sBTN1,sBTN2,sBTN3: std_logic;
signal sr1,sr2,se1,se2,se3,se4,soverflow,send_game,send_time,swin0,swin1: std_logic;
signal ssel: std_logic_vector(1 downto 0);

component datapath is
port(r1,r2,e1,e2,e3,e4,BTN2,CLOCK_50: in std_logic;
sel,sw: in std_logic_vector(1 downto 0);
overflow,end_game,end_time,win0,win1: out std_logic;
LEDR: out std_logic_vector(9 downto 0);
HEX5: out std_logic_vector(6 downto 0);
HEX4: out std_logic_vector(6 downto 0);
HEX3: out std_logic_vector(6 downto 0);
HEX2: out std_logic_vector(6 downto 0);
HEX1: out std_logic_vector(6 downto 0);
HEX0: out std_logic_vector(6 downto 0)
);
end component;

component FSM is 
port	(clock: in std_logic;
		reset,enter,stop: in std_logic;
		overflow, end_game, end_time, win0, win1: in std_logic;
		R1, R2, E1, E2, E3, E4: out std_logic;
		SEL: out std_logic_vector(1 downto 0)
		);
end component;

component ButtonSync is
	port
	(
		KEY0, KEY1, KEY2, KEY3, CLK: in std_logic;
		BTN0, BTN1, BTN2, BTN3: out std_logic
	);
end component;

begin

B: ButtonSync port map(KEY(0),KEY(1),KEY(2),KEY(3),CLOCK_50,sBTN0,sBTN1,sBTN2,sBTN3);
CONTROLE: FSM port map(CLOCK_50,sBTN0,sBTN1,sBTN2,soverflow,send_game,send_time,swin0,swin1,sr1,sr2,se1,se2,se3,se4,ssel);
DF: datapath port map(sr1,sr2,se1,se2,se3,se4,sBTN2,CLOCK_50,ssel,SW(1 downto 0),soverflow,send_game,send_time,swin0,swin1,LEDR(9 downto 0),HEX5(6 downto 0),HEX4(6 downto 0),HEX3(6 downto 0),HEX2(6 downto 0),HEX1(6 downto 0),HEX0(6 downto 0));
end architecture;
