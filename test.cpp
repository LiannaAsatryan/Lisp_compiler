#include <iostream>
#include <fstream>

int main(int argc, char *argv[])
{
        std::fstream o_file; //output
        std::fstream r_file; //result
        std::fstream g_file; //golden
	o_file.open(argv[1], std::ios::in);
	g_file.open(argv[2], std::ios::in);
        r_file.open(argv[3], std::ios::out);
	std::string o_str;
	std::string g_str;
	int count = 0;
        while(!o_file.eof() && !g_file.eof()) {
		count++;
                getline(o_file, o_str);
		if(o_str == "") {
			continue;
		}
		getline(g_file, g_str);
                if(o_file.eof() || g_file.eof()) {
                        break;
                }
		if(o_str == g_str) { 
			r_file << "test " << count << " passed!" << std::endl;
		} else {
			r_file << "test " << count << " didn't pass!" << std::endl;
		}
        }
        r_file.close();
        o_file.close();
        g_file.close();
}



