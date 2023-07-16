//#include "DIY.h"
#include "func.h"

int main() {

    int ci = showmenu();
    int yourchoice = inputmychoice();
    do {

        switch (yourchoice) {
            case 1:
                AddNewLog(ci);
                break;
            case 2:
                ListAllLog(ci);
                break;
            case 3:
                QueryLastLog(ci);
                break;
            case 4:
                UpdateLog(4);
                break;
            case 0:
                cout << "Exit" << endl;
                return 0;
        }
        cout << "Will you continue to operate?if you will,please input 1,else input 0.\n""Your Input: ";
        cin >> yourchoice;
        if (yourchoice) {
            yourchoice = inputmychoice();
            ci = 0;
        }
        else return 0;

    } while (1);
    return 0;
}



