#ifndef bits_stdc__h

#include<bits/stdc++.h>

#endif

#include <cassert>
#include <iostream>
#include <fstream>
#include <string>
#include <cmath>
#include <cstdlib>
#include <numeric>
#include <cstring>
#include <queue>

using namespace std;
namespace DIY {
    template<typename T, typename C = std::vector<T>, typename Compare = std::less<typename C::value_type>>
    using pq = std::priority_queue<T, C, Compare>;

    template<typename T>
    void out(const T &arg) {
        std::cout << arg;
    }

    template<typename T1, typename ...Args>
    void out(const T1 &arg1, const Args &... args) {
        std::cout << arg1 << " ";
        out(args...);
    }

#define  DEBUG(...) \
do { \
std::cerr << "DEBUG:  line:"<<__LINE__<<","; \
print_var_value(#__VA_ARGS__, __VA_ARGS__); \
std::cerr << std::endl; \
} while (0)

    template<typename T>
    void print_var_value(const char *name, const T &value) {
        std::cerr << name << " = " << value << ";" << endl;
    }

    template<typename T, typename... Args>
    void print_var_value(const char *names, const T &value, Args... args) {
        const char *comma = strchr(names + 1, ',');
        std::cerr.write(names, comma - names) << " = " << value << " ";
        print_var_value(comma, args...);
    }

    template<typename...args>
    tuple<args...> read(args...Args) {
        return make_tuple(Args...);
    }

}
using namespace DIY;

#define all(x) (x).begin(), (x).end()
#define sz(x) ((int)x.size())
#define pb push_back
#define mp make_pair
#define foreach(it, v) for(auto it = (v).begin(); it != (v).end(); ++it)
#define rep(i, a, b) for(int i = (a); i <= (b); ++i)
#define rrep(i, a, b) for(int i = (a); i >= (b); --i)
#define fi first
#define se second
#define pb push_back
#define eb emplace_back
#define debug(x) cout<<"DEBUG: line: "<<__LINE__<<","<<#x<<": "<<x<<";"

int day[] = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};


