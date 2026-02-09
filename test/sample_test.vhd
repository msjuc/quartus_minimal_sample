library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sample_test is
end entity sample_test;
architecture behavior of sample_test is
  signal x, y, z, w : std_logic := '0';
  signal f          : std_logic;
begin
  -- Инстанциируем устройство
  UUT: entity work.sample(rtl)
      port map (
          x => x,
          y => y,
          z => z,
          w => w,
          f => f
      );
  stimulus: process
    -- таблица истинности
    variable etalon : std_logic_vector(0 to 15) 
      := ('1','0','1','0','1','0','1','1',
      '1','1','1','1','1','1','1','0');
  begin
    for i in 0 to 15 loop
      (x,y,z,w) <= std_logic_vector(to_unsigned(i, 4));
      wait for 10 ns;-- Ожидание отработки устройства
      assert f = etalon(i)
      report "Mismatch at vector " & to_string(i) &
              " (x,y,z,w)=" & to_string(x) & "," 
              & to_string(y) & "," & to_string(z) 
              & "," & to_string(w) 
              & " expected=" & to_string(etalon(i)) 
              & " got=" & to_string(f)
      severity error;
    end loop;
    report "All vectors tested." severity note;
    wait;
  end process stimulus;
end architecture behavior;