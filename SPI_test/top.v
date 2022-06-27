module SPI_slave(SCK, MOSI, MISO, SSEL);

    input SCK, SSEL, MOSI;
    output MISO;

    reg[8:0] v; // 8 bit vector

    reg[8:0] u;

    reg[3:0] counter; // 8 bit counter
    always @(posedge !SSEL)
        counter <= 0;

    // carousel
    always @(posedge  SCK)
        counter <= counter + 1;

    always @(posedge  SCK)
        v[0] <= MOSI;
    always @(posedge  SCK)
        v[1] <= v[0];
    always @(posedge  SCK)
        v[2] <= v[1];
    always @(posedge  SCK)
        v[3] <= v[2];
    always @(posedge  SCK)
        v[4] <= v[3];
    always @(posedge  SCK)
        v[5] <= v[4];
    always @(posedge  SCK)
        v[6] <= v[5];
    always @(posedge  SCK)
        v[7] <= v[6];

    // combinatorial process
    always @(counter == 7)
        u[8:0] <= v[8:4] * v[4:0];

    // anti-carousel
    always @(posedge  SCK)
        MISO <= u[0];
    always @(posedge  SCK)
        u[0] <= u[1];
    always @(posedge  SCK)
        u[1] <= u[2];
    always @(posedge  SCK)
        u[2] <= u[3];
    always @(posedge  SCK)
        u[3] <= u[4];
    always @(posedge  SCK)
        u[4] <= u[5];
    always @(posedge  SCK)
        u[5] <= u[6];
    always @(posedge  SCK)
        u[6] <= u[7];
endmodule

// look in pins.pcf for all the pin names on the TinyFPGA BX board
module top (
    input SPI_SCK,
    input SPI_IO0,
    input SPI_SS,

    output SPI_IO1
);

  // use IO0 for MOSI
  // and IO1 for MISO

  SPI_slave u0(.SCK(SPI_SCK), .MOSI(SPI_IO0), .MISO(SPI_IO1), .SSEL(SPI_SS));
endmodule
