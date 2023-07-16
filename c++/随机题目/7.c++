#include <iostream>
using namespace std;
struct waimai {
	char a[100];
	int weight;
	int hao;
	int price;

}en[150];
int i;

int main()
{
	bool pan(waimai a, waimai b);
	do {
		int all;
	    cin >> all;
		cout << endl;
		for (int j = 0; j < all; j++)
		{
			cin >> en[j].a >> en[j].weight >> en[j].hao >> en[j].price;

		}
		for (i = 0; i < all - 1; i++)
		{
			waimai c;
			if (pan(en[i], en[i + 1])) {

				c = en[i];
				en[i] = en[i + 1];
				en[i + 1] = c;
			}
		}
		cout << en[all - 1].a;
		cout << endl;
	} while (1);
	return 0;
}
bool pan(waimai a, waimai b)
{
	if (a.weight != b.weight) return a.hao > b.hao;
	if (a.hao != b.hao) return a.price < b.price;
	if (a.price != b.price) return a.price < b.price;
}
//结构体多条件排序，结合bool类型函数。



