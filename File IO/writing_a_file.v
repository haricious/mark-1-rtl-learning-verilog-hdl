module tb();

integer file=0;
integer i=0;

initial begin
    file=$fopen("location","type - w, r");




    $fclose(file);
end

endmodule