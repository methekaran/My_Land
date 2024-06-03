

/*Q. 
   my_sequencer sqr_q[$];
   my_sequencer sqr[];
   int num_sqr; //allowed values are [3:5]
   
   for(int i=0; i<num_sqr; i++) begin
     sqr = new[i];
     sqr_q.push_back(sqr[i]);
   end
   
   How will you start multiple sequences on sequencers from sqr_q such that all sequences
   start parallely and we should wait for all sequences to end before the simulation ends.*/

    my_seq seq_q[$];

    for(int j=0;j<sqr_q.size();j++)begin//0 to 4
      fork
        automatic int a =j;
        seq_q[j].start(sqr_q[j]);
      join_none
    end
    wait fork;//wait fork has to be after the for loop
    


