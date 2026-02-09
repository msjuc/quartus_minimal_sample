`timescale 1ns/1ps
module sample_test;
  reg x, y, z, w;
  wire f;
  reg etalon;
  integer i;
  //Инстанциируем устройство
  sample uut (
    .x(x),
    .y(y),
    .z(z),
    .w(w),
    .f(f)
  );
  initial begin
    for (i = 0; i < 16; i = i + 1) begin
      {x, y, z, w} = i;
      // Эталонная функция
      etalon = (x ^ (y & z)) | !w; 
      #10;// Ожидание отработки устройства
      if (f !== etalon) begin
        $error("Mismatch at vector %0d: \
(x,y,z,w)=%b%b%b%b expected=%b got=%b",
          i, x, y, z, w, etalon, f);
      end
    end
    $display("All vectors tested.");
    $finish; // Завершение и выход
  end
endmodule