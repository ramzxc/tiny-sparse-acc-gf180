// Generated only for binary-proved reset D inputs; no Q initialization.
always @(*) begin
  if (user_project.core.receiver.rst_n === 1'b1 && user_project.core.receiver.HFSNET_10 === 1'b0) force user_project.core.receiver.n98 = 1'b0;
  else release user_project.core.receiver.n98;
end
always @(*) begin
  if (user_project.core.receiver.rst_n === 1'b1 && user_project.core.receiver.HFSNET_10 === 1'b0) force user_project.core.receiver.n92 = 1'b0;
  else release user_project.core.receiver.n92;
end
always @(*) begin
  if (user_project.core.receiver.rst_n === 1'b1 && user_project.core.receiver.HFSNET_10 === 1'b0) force user_project.core.receiver.n101 = 1'b0;
  else release user_project.core.receiver.n101;
end
always @(*) begin
  if (user_project.core.receiver.rst_n === 1'b1 && user_project.core.receiver.HFSNET_10 === 1'b0) force user_project.core.receiver.n100 = 1'b0;
  else release user_project.core.receiver.n100;
end
always @(*) begin
  if (user_project.core.transmitter.rst_n === 1'b1 && user_project.core.transmitter.HFSNET_2 === 1'b0) force user_project.core.transmitter.n42 = 1'b0;
  else release user_project.core.transmitter.n42;
end
always @(*) begin
  if (user_project.core.transmitter.rst_n === 1'b1 && user_project.core.transmitter.HFSNET_2 === 1'b0) force user_project.core.transmitter.n50 = 1'b0;
  else release user_project.core.transmitter.n50;
end
always @(*) begin
  if (user_project.core.serial_memory.rst_n === 1'b1 && user_project.core.serial_memory.HFSNET_28 === 1'b0) force user_project.core.serial_memory.n217 = 1'b0;
  else release user_project.core.serial_memory.n217;
end
always @(*) begin
  if (user_project.core.serial_memory.rst_n === 1'b1 && user_project.core.serial_memory.HFSNET_28 === 1'b0) force user_project.core.serial_memory.n222 = 1'b0;
  else release user_project.core.serial_memory.n222;
end
