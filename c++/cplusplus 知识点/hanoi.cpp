#include<bits/stdc++.h>

using namespace std;

void hanoi(int n, char one, char two, char three);

void move(char x, char y);

int main() {
    int m;
    printf("input the number of the diskes:");
    cin >> m;
    printf("the step to move %d diskes:\n");
    hanoi(m, 'A', 'B', 'C');
    return 0;
}

void hanoi(int n, char one, char two, char three) {
    if (n == 1) {
        move(one, three);

    } else {
        hanoi(n-1,one ,three,two);
        move(one ,three);
        hanoi(n-1,two,one,three);
    }
}

void move(char x, char y) {
    printf("%c-->%c\n", x, y);
}

