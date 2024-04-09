virtual task count_pulse_a();

int count;

fork 
begin

  forever begin
	wait(event_a.ptrigger());
	count++;
  end
end
begin
	wait(event_b.ptrigger());
end
join_any
disable fork

$display(“final count=%d”,count);

endtask : count_pulse_a
