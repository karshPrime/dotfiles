
// Defines

#pragma once

#include <iostream>

#if !defined(_WIN32) && !defined(_WIN64)
    #define TERM_RED     "\033[31m" <<
    #define TERM_BLUE    "\033[34m" <<
    #define TERM_GRAY    "\033[36m" <<
    #define TERM_YELLOW  "\033[33m" <<
    #define TERM_RESET   "\033[0m"  <<
#else
    #define TERM_RED     ""  <<
    #define TERM_BLUE    ""  <<
    #define TERM_GRAY    ""  <<
    #define TERM_YELLOW  ""  <<
    #define TERM_RESET   ""  <<
#endif

#define ERROR std::cerr << TERM_RED    "ERROR: "   << TERM_GRAY
#define WARN  std::cerr << TERM_YELLOW "WARNING: " << TERM_GRAY
#define LOG   std::cout << TERM_BLUE   "LOG: "     << TERM_GRAY
#define ENDLOG << TERM_RESET std::endl;

using std::string;
using std::ostream;
using uint = unsigned int;

