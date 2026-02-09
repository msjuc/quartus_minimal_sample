library IEEE;
use IEEE.std_logic_1164.all;
library altera;
use altera.altera_syn_attributes.all;
entity sample is
  port (
    x,y,z,w: in std_logic;
    f: out std_logic
  );
end entity sample;
architecture rtl of sample is
attribute chip_pin of x : signal is "AC9";
attribute chip_pin of y : signal is "AE10";
attribute chip_pin of z : signal is "AD13";
attribute chip_pin of w : signal is "AC8";
attribute chip_pin of f : signal is "F7";
begin
  f <= (x XOR (y AND z)) OR (NOT w);
end architecture rtl;