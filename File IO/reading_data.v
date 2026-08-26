module tb();

integer file=0;
integer i=0;
reg [4:0]mem[25:0];
initial begin
    // write operation
    file=$fopen("location","w");
    for(i=0;i<=18;i=i+1) begin
        $display(file, "format spec", "source of data") // 1. file id
    end
    $fclose(file);
    // read operation
    file=$fopen("location","r");
    // $readmemh to read the file in hex 
    // $readmemb to read the file in binary
    $readmemh("location", mem); //location, array
    $fclose(file);

    for(i=0;i<=18;i=i+1) begin
        $display("%d", mem[i]);
    end
end

endmodule