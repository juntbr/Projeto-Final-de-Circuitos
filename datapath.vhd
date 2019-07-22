-- Instituicao: UFSC
-- Data: 04/07/2019 
-- Autores: Victor Hugo Schneider de Almeida(19100548) / Leonardo Gideão Costa Rocha (19102922)
library ieee;
use IEEE.std_logic_1164.all;

entity datapath is
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
end entity;

architecture data of datapath is
signal clkt: std_logic;
signal tiime: std_logic_vector(3 downto 0);
signal clk05,clk1,clk2,clk4,clk10,clkhz: std_logic;
signal hexseq: std_logic_vector(3 downto 0);
signal overf1: std_logic;
signal u1_point,u0_point: std_logic_vector(5 downto 0);
signal u1_29,win_point1,overf0,u0_29,win_point0,over: std_logic;
signal level: std_logic_vector(1 downto 0);
signal round: std_logic_vector(3 downto 0);
signal U0_point_BCD,U1_point_BCD: std_logic_vector(7 downto 0);
signal hexseq7,round7,win17,level7: std_logic_vector(6 downto 0);
signal uo_pointBCD71: std_logic_vector(6 downto 0);
signal uo_pointBCD72: std_logic_vector(6 downto 0);
signal u1_pointBCD71: std_logic_vector(6 downto 0);
signal u1_pointBCD72: std_logic_vector(6 downto 0);
signal send_game,send_time,swin0,swin1: std_logic;
signal user: std_logic; 



component comp29 is
port (I: in std_logic_vector(5 downto 0);
		O: out std_logic
		);
end component;

component comp is
port (uo,ui: in std_logic_vector(5 downto 0);
      endgame: in std_logic;
      O,I: out std_logic
		);
end component;

component counter_round is port
(reset,en,clock : in std_logic;
endgame: out std_logic;
round: out std_logic_vector(3 downto 0)
);
end component;

component countertime is port(
CLK,reset,enable: in std_logic;
Q: out std_logic;
T: out std_logic_vector(3 downto 0));
end component;

component decodBCD is
port(e: in std_logic_vector(5 downto 0);
	  s: out std_logic_vector(7 downto 0)
);
end component;

component decoder is
port (e: in std_logic_vector(3 downto 0);
		s: out std_logic_vector(9 downto 0)
);
end component;

component FSM_clock is port(
CLK,RST,EN: in std_logic;
c1hz,c05hz,c2hz,c4hz,c10hz: out std_logic
);
end component;

component mux is
port (a,b,c,d: in std_logic_vector(6 downto 0);
		sel: in std_logic_vector(1 downto 0);
		s: out std_logic_vector(6 downto 0)
);
end component;

component sequencer is 
port	(reset,enable,stop,clock: in std_logic;
		hexseq: out std_logic_vector(3 downto 0)
);
end component;

component mux_FSM_Clock is
port (a,b,c,d: in std_logic;
		sel: in std_logic_vector(1 downto 0);
		s: out std_logic
);
end component;

component Counter_point is port (
CLK: in std_logic;
reset: in std_logic;
enable: in std_logic;
D: in std_logic_vector(3 downto 0);
T: out std_logic_vector(5 downto 0);
Q: out std_logic
);
end component;

component reg is port (
CLK: in std_logic;
RST: in std_logic;
EN: in std_logic;
D: in std_logic_vector(1 downto 0);
Q: out std_logic_vector(1 downto 0)
 );
end component;

component dec7seg is
port (e: in std_logic_vector(3 downto 0);
		s: out std_logic_vector(6 downto 0)
);
end component;

begin



DECHEX5: dec7seg port map(hexseq,hexseq7);
DECHEX4_ROUND: dec7seg port map(round(3 downto 0),round7);
DECHEX4_WIN: dec7seg port map(("000" & swin1),win17);
DECHEX3: dec7seg port map((u0_point_BCD(7 downto 4)),uo_pointBCD71);
DECHEX2: dec7seg port map((u0_point_BCD(3 downto 0)),uo_pointBCD72);
DECHEX1: dec7seg port map((u1_point_BCD(7 downto 4)),u1_pointBCD71);
DECHEX0_level: dec7seg port map(("00" & level),level7);
DECHEX0_BCD: dec7seg port map(u1_point_BCD(3 downto 0),u1_pointBCD72);
SQ: sequencer port map(r1, e4,BTN2,clkhz,hexseq);
CT: countertime port map(clkt,r2,e4,send_time,tiime);
FC: FSM_clock port map(CLOCK_50,r1,e1,clk1,clk05,clk2,clk4,clk10);
CP1: Counter_point port map(CLOCK_50,r1,(user and e3),hexseq,u1_point,u1_29);
CP0: Counter_point port map(CLOCK_50,r1,((not user) and e3),hexseq,u0_point,u0_29);
registrador: reg port map(CLOCK_50,r1,e2,SW(1 downto 0),level);
MUXFSM: mux_FSM_Clock port map(clk1,clk2,clk4,clk10,level,clkhz);
DECLED: decoder port map(tiime,LEDR(9 downto 0));
CR: counter_round port map(r1,e3,CLOCK_50,send_game,round);
COMP29_CP1: comp29 port map(u1_point,overf1);
COMP29_CP0: comp29 port map(u0_point,overf0);
LC: comp port map(u0_point,u1_point,send_game,win_point0,win_point1);
DECBCDU0: decodBCD port map(u0_point,u0_point_BCD);
DECBCDU1: decodBCD port map(u1_point,u1_point_BCD);
MUXHEX5: mux port map("1111111","1000111",hexseq7,"1100001",sel,HEX5);
MUXHEX4: mux port map("0010010","0000110",round7,win17,sel,HEX4);
MUXHEX3: mux port map("0000111","1100011",uo_pointBCD71,uo_pointBCD71,sel,HEX3);
MUXHEX2: mux port map("0001000","0000110",uo_pointBCD72,uo_pointBCD72,sel,HEX2);
MUXHEX1: mux port map("0101111","1000111",u1_pointBCD71,u1_pointBCD71,sel,HEX1);
MUXHEX0: mux port map("0000111",level7,u1_pointBCD72,u1_pointBCD72,sel,HEX0);

swin0 <= ((win_point0 or overf1) or u0_29) or (user and send_time);
swin1 <= ((win_point1 or overf0) or u1_29) or ((not user) and send_time);
win1 <= swin1;
win0 <= swin0;
end_game <= send_game;
end_time <= send_time;
user <= round(0);
overflow <= (overf0 or overf1);
clkt <= clk05;
end architecture;
