// PERMUTE_ARGS:

import std.c.stdio;
import std.intrinsic;

/*****************************************************/

void test1()
{   
    uint array[2];
    uint x;

    array[0] = 2;
    array[1] = 0x100;

    x = btc(array.ptr, 35);
    printf("btc(array, 35) = %d\n", x);
    printf("array = [0]:x%x, [1]:x%x\n", array[0], array[1]);
    assert(x == 0);
    assert(array[0] == 2 && array[1] == 0x108);


    x = btc(array.ptr, 35);
    printf("btc(array, 35) = %d\n", x);
    printf("array = [0]:x%x, [1]:x%x\n", array[0], array[1]);
    assert(x != 0);
    assert(array[0] == 2 && array[1] == 0x100);

    x = bts(array.ptr, 35);
    printf("bts(array, 35) = %d\n", x);
    printf("array = [0]:x%x, [1]:x%x\n", array[0], array[1]);
    assert(x == 0);
    assert(array[0] == 2 && array[1] == 0x108);

    x = btr(array.ptr, 35);
    printf("btr(array, 35) = %d\n", x);
    printf("array = [0]:x%x, [1]:x%x\n", array[0], array[1]);
    assert(x != 0);
    assert(array[0] == 2 && array[1] == 0x100);

    x = bt(array.ptr, 1);
    printf("bt(array, 1) = %d\n", x);
    printf("array = [0]:x%x, [1]:x%x\n", array[0], array[1]);
    assert(x != 0);
    assert(array[0] == 2 && array[1] == 0x100);
} 

/*****************************************************/

void test2()
{   
    uint v;
    int x;

    v = 0x21;
    x = bsf(v);
    printf("bsf(x%x) = %d\n", v, x);
    assert(x == 0);

    x = bsr(v);
    printf("bsr(x%x) = %d\n", v, x);
    assert(x == 5);
} 

/*****************************************************/

void test3()
{   uint v;
    int b;

    b = inp(b);
    b = inpw(b);
    b = inpl(b);

    b = outp(v, cast(ubyte)b);
    b = outpw(v, cast(ushort)b);
    b = outpl(v, b);
}

/*****************************************************/

void test4()
{
    uint i = 0x12_34_56_78;
    i = bswap(i);
    assert(i == 0x78_56_34_12);
}

/*****************************************************/
	
void test5()
{   
    uint array[2];

    array[0] = 2;
    array[1] = 0x100;

    printf("btc(array, 35) = %d\n", btc(array.ptr, 35));
    printf("array = [0]:x%x, [1]:x%x\n", array[0], array[1]);

    printf("btc(array, 35) = %d\n", btc(array.ptr, 35));
    printf("array = [0]:x%x, [1]:x%x\n", array[0], array[1]);

    printf("bts(array, 35) = %d\n", bts(array.ptr, 35));
    printf("array = [0]:x%x, [1]:x%x\n", array[0], array[1]);

    printf("btr(array, 35) = %d\n", btr(array.ptr, 35));
    printf("array = [0]:x%x, [1]:x%x\n", array[0], array[1]);

    printf("bt(array, 1) = %d\n", bt(array.ptr, 1));
    printf("array = [0]:x%x, [1]:x%x\n", array[0], array[1]);
} 


/*****************************************************/

class Node {
  uint leaf = 0;

  int m() {
        return leaf ? 0 : bsf(leaf);
  }
}

void test6()
{
    Node n = new Node();
}

/*****************************************************/

int main()
{   
    test1();
    test2();
    //test3();
    test4();
    test5();
    test6();

    printf("Success\n");
    return 0;
}