module tb;

reg [2:0] data;
integer i=0;

task gen_ran_data;   
    begin
         for(i=0;i<20;i=i+1)
         begin
            data=$urandom();
            #20;
         end   
    end
endtask

task data_with_range;

    begin
        for(i=0;i<20;i=i+1) begin
            data=$urandom_range(0,10);
            #10;
        end
    end
endtask


initial begin
    #20;
    gen_ran_data();
    #50;
    data_with_range();
end

endmodule