#pragma once
#include <inc.h>
namespace sys
{
	struct s_cfg_v
	{
		s_cfg_v(std::string a, std::string b, std::string c)
		{
			table = a; val = b; rval = c;
			auto type = b.front();
			switch (type)
			{
			case 'i':
			{
				iv = std::stoi(c);
				t = 1;
				break;
			}
			case 'f':
			{
				fv = std::stof(c);
				t = 2;
				break;
			}
			default: break;
			}
			if (t == 0) strcpy(cin, rval.c_str());
			//sdk::util::log->add(std::string(a).append(":").append(b).append(":").append(c).append(":").append(std::to_string(t)), sdk::util::e_info, true);
		}
		std::string table;
		std::string val;
		std::string rval;
		char		cin[2048] = "none";
		int iv = 0; float fv = 0.f; int t = 0; bool local = false; bool btn_toggle = false;
	};
	class c_config
	{
	private:
		std::vector<s_cfg_v*> cfg_list;
	public:
		void reset() { this->cfg_list.clear(); this->vars(); this->read(); };
		bool proc(std::string a, std::string b, std::string c, bool local = false);
		s_cfg_v* gvar(std::string t, std::string v);
		void read();
		void save();
		void vars();
		int gsize() { return this->cfg_list.size(); }
	};
	extern c_config* config;
}