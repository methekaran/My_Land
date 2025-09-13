// Code your testbench here
// or browse Examples

//Find out endianness of your machine

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

int main() {
    uint32_t num = 0x12345678; // A 4-byte integer
    uint8_t *ptr = (uint8_t *)&num; // Pointer to the first byte of num

    if (*ptr == 0x78) {
        printf("System is Little-Endian\n");
    } else if (*ptr == 0x12) {
        printf("System is Big-Endian\n");
    } else {
        printf("Unknown Endianness\n");
    }

    // You can also print the bytes to visualize
    printf("Bytes in memory: ");
    for (int i = 0; i < sizeof(num); i++) {
        printf("0x%02X ", ptr[i]);
    }
    printf("\n");

    return 0;
}
