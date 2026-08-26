module tb();

integer file=0;
integer i=0;

initial begin
    file=$fopen("location","type - w, r");
    for(i=0;i<=18;i=i+1) begin
        $display(file, "format spec", "source of data") // 1. file id
    end



    $fclose(file);
end

endmodule