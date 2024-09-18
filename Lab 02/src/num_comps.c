#include <stdio.h>
int main() {
    int val1 = -22;
    int val2 = 33;
    int val3 = -11;
    int val4 = 12;
    int val5 = 3;
    int val6 = 10;
    int res;
    unsigned int res_unsigned;
    float res_float;
    double res_double;

    res = val1 * val2; // -22*33
    printf("%d\n", res); // int
    res_unsigned = (unsigned int)val1 * (unsigned int)val2; // -22*33
    printf("%u\n", res_unsigned); // unsigned int
    res_float = (float)val1 * (float)val2; // -22*33
    printf("%f\n", res_float); // float
    res_double = (double)val1 * (double)val2; // -22*33
    printf("%f\n", res_double); // double

    res = val4 / val5; // 12/3
    printf("%d\n", res); // int
    res_unsigned = (unsigned int)val4 / (unsigned int)val5; // 12/3
    printf("%u\n", res_unsigned); // unsigned int
    res_float = (float)val4 / (float)val5; // 12/3
    printf("%f\n", res_float); // float
    res_double = (double)val4 / (double)val5; // 12/3    
    printf("%f\n", res_double); // double

    res = val6 / val5; // 10/3
    printf("%d\n", res); // int
    res_unsigned = (unsigned int)val6 / (unsigned int)val5; // 10/3
    printf("%u\n", res_unsigned); // unsigned int
    res_float = (float)val6 / (float)val5; // 10/3
    printf("%f\n", res_float); // float
    res_double = (double)val6 / (double)val5; // 10/3
    printf("%f\n", res_double); // double

    res = val3 % val5; // -11 % 3
    printf("%d\n", res); // int
    
    res = val4 % val5; // 12 % 3
    printf("%d\n", res); // int

    return 0;
}
