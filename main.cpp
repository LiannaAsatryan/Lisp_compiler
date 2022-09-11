#include "functions.h"

int main(int argc, char* argv[]) {
        std::ifstream i_file;
        i_file.open(argv[1]);
        std::vector<token> objs = parser(i_file);
        interpreter(objs);
}

