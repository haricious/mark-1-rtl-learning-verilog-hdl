module tb();

integer file=0;

initial begin
    file=$fopen("location","type - w, r");
    $fclose(file);
end

endmodule