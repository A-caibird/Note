//dynamic linked list
#include<iostream>

using namespace std;

#include<cstdlib>

typedef struct student {
    int id;
    int grade;
    student *NEXT;
} stu;

struct student *enter(void) {
    struct student *head = NULL, *p1, *p2;
    p1 = p2 = (student *) malloc(sizeof(student));
    cin >> p1->id >> p1->grade;
    int n = 0;
    while (p1->id != 0) {
        n = n + 1;
        if (n == 1)head = p1;
        else p2->NEXT = p1;
        p2 = p1;
        p1 = (stu *) malloc(sizeof(stu));
        cin >> p1->id >> p1->grade;

    }
    p2->NEXT = NULL;
    return (head);

}

struct student *enter(void);

int main(void) {
    stu *p1 = enter();
    do {
        cout << p1->id << " " << p1->grade << endl;
        p1 = p1->NEXT;
    } while (p1->NEXT != NULL);
    return 0;
}


