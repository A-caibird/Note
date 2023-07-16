#include <bits/stdc++.h>

#define  valid_header1
#ifndef  valid_header

#include <any>                //(C++17) std::any class
#include <bitset>             //std::bitset class template
#include <chrono>             //(C++11)C++ time utilites
#include <compare>            //(C++20)Three-way comparison operator support
#include <csetjmp>            //Macro (and function) that saves (and jumps) to an execution context
#include <csignal>            //Functions and macro constants for signal management
#include <cstdarg>            //Handling of variable length argument lists
#include <cstddef>            //Standard macros and typedefs
#include <cstdlib>            //General purpose utilities: program control, dynamic memory allocation, random numbers, sort and search
#include <ctime>              //C-style time/date utilites
// #include <expected>           //c++23 	std::expected class template
#include <functional>         //Function objects, Function invocations, Bind operations and Reference wrappers
#include <initializer_list>   //(C++11)
#include <optional>           //(C++17)	std::optional class template
// #include <source_location>    //(C++20) Supplies means to obtain source code location
#include <tuple>              //(C++11) std::tuple class template
#include <type_traits>        //(C++11)  Compile-time type information
#include <typeindex>          //(C++11) std::type_index
#include <typeinfo>           //Runtime type information utilities
#include <utility>            //Various utility components
#include <version>            //(C++20) Supplies implementation-dependent library information
#include <variant>            //(C++17) std::variant class template>
#include <memory>             //High-level memory management utilities
// #include <memory_resource>    //(C++17) Polymorphic allocators and memory resources
#include <scoped_allocator>   //(C++11) Nested allocator class
#include <scoped_allocator>   //(C++11) Nested allocator class
#include <cfloat>             //Limits of floating-point types
#include <cinttypes>          //(C++11) Formatting macros, intmax_t and uintmax_t math and conversions
#include <climits>            //Limits of integral types
#include <cstdint>            //(C++11) Fixed-width integer types and limits of other types
#include <limits>             //Uniform way to query properties of arithmetic types
// #include <stdfloat>           //(C++23) Optional extended floating-point types
#include <cassert>            //Conditionally compiled macro that compares its argument to zero
#include <cerrno>             //Macro containing the last error number
#include <exception>          //Exception handling utilities
#include <stdexcept>          //Standard exception objects
#include <system_error>       //(C++11) Defines std::error_code, a platform-dependent error code
#include <cctype>             //Functions to determine the category of narrow characters
#include <charconv>           //(C++17) std::to_chars and std::from_chars
#include <cstring>            //Various narrow character string handling functions
// #include <cuchar>             //(C++11)C-style Unicode character conversion functions
#include <cwchar>             //Various wide and multibyte string handling functions
#include <cwctype>            //Functions to determine the catagory of wide characters
//#include <format>             //(C++20) Formatting library including std::format
#include <string>             //std::basic_string class template
#include <array>              //(C++11) std::array container
#include <deque>              //std::deque container
// #include <flat_map>           //(C++23) std::flat_map and std::flat_multimap container adaptors
#include <forward_list>       //(C++11) std::forward_list container
#include <list>               //std::list container
#include <map>                //std::map and std::multimap associative containers
// #include <mdspan>             //(C++23) std::mdspan view
#include <queue>              //std::queue and std::priority_queue container adaptors
#include <set>                //std::set and std::multiset associative containers
#include <span>               //(C++20) std::span view
#include <stack>              //std::stack container adaptor
#include <unordered_map>      //(C++11) std::unordered_map and std::unordered_multimap unordered associative containers
#include <unordered_set>      //(C++11) std::unordered_set and std::unordered_multiset unordered associative containers
#include <vector>             //std::vector container
#include <iterator>           //Range iterators
// #include <generator>          //(C++23) std::generator class template
#include <ranges>             //(C++20) Range access, primitives, requirements, utilities and adaptors
#include <algorithm>          //Algorithms that operate on ranges
#include <execution>          //(C++17) Predefined execution policies for parallel versions of the algorithms
#include <bit>                //(C++20) Bit manipulation functions
#include <cfenv>              //(C++11) Floating-point environment access functions
#include <cmath>              //Common mathematics functions
#include <complex>            //Complex number type
#include <numeric>            //Numeric operations on values in ranges
#include <random>             //(C++11) Random number generators and distributions
#include <ratio>              //(C++11)  Compile-time rational arithmetic
#include <valarray>           //Class for representing and manipulating arrays of values
#include <clocale>            //C localization utilities
#include <codecvt>            //(C++11) (deprecated in C++17) Unicode conversion facilities
#include <locale>             //Localization utilities
#include <cstdio>             //C-style input-output functions
#include <fstream>            //std::basic_fstream, std::basic_ifstream, std::basic_ofstream class templates and several typedefs
#include <iomanip>            //Helper functions to control the format of input and output
#include <ios>                //std::ios_base class, std::basic_ios class template and several typedefs
#include <iosfwd>             //Forward declarations of all classes in the input/output library
#include <iostream>           //Several standard stream objects
#include <istream>            //std::basic_istream class template and several typedefs
#include <ostream>            //std::basic_ostream, std::basic_iostream class templates and several typedefs
// #include <print>              //(C++23) Formatted output library including std::print
// #include <spanstream>         //(C++23) std::basic_spanstream, std::basic_ispanstream, std::basic_ospanstream class templates and typedefs
#include <sstream>            //std::basic_stringstream, std::basic_istringstream, std::basic_ostringstream class templates and several typedefs
#include <streambuf>          //std::basic_streambuf class template
#include <strstream>          //(deprecated in C++98) std::strstream, std::istrstream, std::ostrstream
// #include <syncstream>         //(C++20) std::basic_osyncstream, std::basic_syncbuf, and typedefs
#include <filesystem>         //(C++17) std::path class and supporting functions
#include <regex>              //(C++11) Classes, algorithms and iterators to support regular expression processing
#include <atomic>             //(C++11) Atomic operations library
#include <barrier>            //(C++20) Barriers
#include <condition_variable> //(C++11) Thread waiting conditions
#include <latch>              //(C++20) Latches
#include <mutex>              //(C++11) Mutual exclusion primitives
#include <semaphore>          //(C++20) Semaphores
#include <shared_mutex>       //(C++14)Shared mutual exclusion primitives
// #include <stop_token>         //(C++20) Stop tokens for std::jthread
#include <thread>             //(C++11) std::thread class and supporting functions
#include <stdbool.h>          //(C++11) Defines one compatibility macro constant
#include <stdalign.h>         //(C++11) Defines one compatibility macro constant
#include <iso646.h>           //Has no effect
#include <ciso646>            //(removed in C++20) Empty header. The macros that appear in iso646.h in C
#include <cstdalign>          //(C++11)(deprecated in C++17)(removed in C++20) Defines one compatibility macro constant
#include <iso646.h>           //Has no effect
#include <numbers>            //
#endif

using namespace std;
using namespace std::numbers;
#pragma GCC optimize(1)
#pragma GCC optimize(2)
#pragma GCC optimize(3,"ofast","inline")

typedef unsigned long long ull;
typedef long double doubleL;
typedef long long ll;
#define _SILENCE_CXX20_CISO646_REMOED_WARNING
#define fspr(n) fixed << setprecision(n)
#define spr(n) setprecision(n)
#define sci setiosflags(ios::scientific)
#define siosf setiosflags
#define fspr(n) fixed << setprecision(n)
#define spr(n) setprecision(n)
#define sci setiosflags(ios::scientific)
#define siosf setiosflags
#define endl '\n'
#define ifor(i, l, r) for (int  i = l; i <= r; ++i)
#define rfor(i, r, l) for (int i = r; i >= l; --i)
#define npos string::npos
#define fir first
#define sec second
#define pb push_back
#define pf push_front
#define type decltype
#define inlast(a) a.size()-1
#define itlast(a) prev(a.end(),1)
#define all(v) v.begin(),v.end()
template <class T, class Container = vector<T>,
	class Compare = less<typename Container::value_type> >
using priqueue = priority_queue<T, Container, Compare>;

namespace cus {
	//standard output
	template<typename container>
	void print(container& a2) {
		for (auto i = a2.begin(); i != a2.end(); i++) {
			cout << *i << " \n"[i == prev(a2.end(), 1)];
		}
	}

	template<typename T1>
	auto print(T1 a, ll l, ll r) -> void {
		for (long i = l; i <= r; ++i) {
			cout << a[i] << " /n"[i == r];
		}
	}
	//__int128 write
	template<typename T>
	void  read(T& w) {
		w = 0;
		T f = 1;
		char ch = getchar();
		while (ch < '0' || ch > '9') {
			if (ch == '-')
				f = -1;
			ch = getchar();
		}
		while (ch <= '9' && ch >= '0') {
			w = w * 10 + ch - '0';
			ch = getchar();
		}
	}
	template<typename T>
	void print128(T x) {
		if (x < 0) {
			putchar('-');
		}
		x = -x;
		if (x > 9) print128(x / 10);
		putchar(x % 10 + '0');
	}
}

const int IINF = 0x3f3f3f3f;
const long LINF = 0x3f3f3f3f3f3f3f3f;
const double EPS = 1.0e-9;
const long MOD = 1e9 + 7;
const int N = 2e5 + 100;

int main(int args, char* argv[])
{
	//ios::sync_with_stdio(false);
	//cin.tie(nullptr);
	//cin.tie(nullptr);
	//auto start = std::chrono::steady_clock::now();
	//auto end = std::chrono::steady_clock::now();
	//std::chrono::duration<double> diff = end - start;
	//std::cout << diff.count() << " s\n";

	return 0;
}
