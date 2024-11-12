
Logic d_tvalid_signal;

Always_ff@(posedge vif.clk)begin
	d_tvalid_signal <= vif.tvalid;
end

Realtime t1,t2;

Assign tvalid_assert = vif.tvalid & ~d_tvalid_signal;
Assign tvalid_deassert = ~vif.tvalid & d_tvalid_signal;
 
Always_ff@(posedge vif.clk)begin
	if(tvalid_assert===1) t1=$realtime();
	if(tvalid_deassert===1) t2=$realtime();
end

Longint num_of_pkts;

Always_ff@(posedge vif.clk)begin
	if(vif.tvalid && vif.tready)begin
		num_of_pkts++;
	end
end

Real bandwidth_value;
Final begin
	bandwidth_value = num_of_pkts*4/(t2-t1);
end
