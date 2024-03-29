#pragma once
#include <inc.h>
namespace fn
{
	extern bool executing;

	extern bool setup();
	extern bool hook(LPVOID offset, LPVOID exchangee, LPVOID* backup);
	extern void send_packet(ByteBuffer p, int opc, int size);
	typedef uint64_t(__fastcall* t_packet_outbound)(void*, uint16_t, uint8_t, uint8_t, uint64_t, const CHAR*);
	extern t_packet_outbound o_packet_outbound;
	extern uint64_t __fastcall f_packet_outbound(void* pack, uint16_t size, uint8_t enc, uint8_t unk, uint64_t unk2, const CHAR* xkey);
	typedef uint64_t(__fastcall* t_lua_to_string)(void*);
	extern t_lua_to_string o_lua_to_string;
	extern uint64_t __fastcall f_lua_to_string(void* a1);
	extern uint64_t f_lua_dobuffer(void*, const char*);
	typedef uint64_t(__stdcall* t_lua_dobuffer)(void* arg1, const char* arg2);
	extern t_lua_dobuffer o_lua_dobuffer;
	extern bool f_self_gm();
	typedef uint64_t(__fastcall* t_strc_pack)(uint64_t);
	extern t_strc_pack o_strc_pack;
	extern uint64_t f_strc_pack(uint64_t a);
	typedef uint64_t(__fastcall* t_proxy_deadbody)(uint64_t, uint64_t, int);
	extern t_proxy_deadbody o_proxy_deadbody;
	extern uint64_t f_proxy_deadbody(uint64_t a, uint64_t b, int c);
	typedef bool(__fastcall* t_proxy_delete)(uint64_t, int);
	extern t_proxy_delete o_proxy_delete;
	extern bool f_proxy_delete(uint64_t a, int b);
	typedef int(__fastcall* t_reset_input_class)(uint64_t);
	extern t_reset_input_class o_reset_input_class;
	extern int __fastcall f_reset_input_class(uint64_t a);
	typedef bool(__fastcall* t_is_key_pressed)(uint64_t, int, BYTE);
	extern t_is_key_pressed o_is_key_ressed;
	extern bool __fastcall f_is_key_pressed(uint64_t a, int b, BYTE c);
	extern HWND __fastcall f_get_focus();
	typedef HWND(__fastcall* t_get_active_window)();
	extern t_get_active_window o_get_active_window;
	extern HWND f_get_active_window();
	//char __fastcall sub_1419044E0(__int64 a1, HWND a2)
	typedef bool(__fastcall* t_focus_validator)(uint64_t, HWND);
	extern t_focus_validator o_focus_validator;
	extern bool __fastcall f_focus_validator(uint64_t a, HWND b);
	//int __fastcall sub_140B25B00(__int64 a1, __int64 a2, __int64 a3, __int64 a4, int a5, __int64 a6, unsigned __int8 a7)
	typedef int(__fastcall* t_adddamage)(__int64 a1, __int64 a2, __int64 a3, __int64 a4, int a5, __int64 a6, __int8 a7, __int64 a8);
	extern t_adddamage o_adddamage;
	extern int __fastcall f_adddamage(__int64 a1, __int64 a2, __int64 a3, __int64 a4, int a5, __int64 a6, __int8 a7, __int64 a8);
	//__int64 __fastcall sub_140946740(__int64 a1, __int64 a2, __int64 a3)
	typedef uint64_t(__fastcall* t_damageregister)(uint64_t, uint64_t, uint64_t);
	extern t_damageregister o_damageregister;
	extern uint64_t __fastcall f_damageregister(uint64_t t, uint64_t a2, uint64_t pack);
	//__int64 __usercall sub_14162BD20@<rax>(__int64 a1@<rcx>, __int64 a2@<rdx>, __int64 a3@<r8>, __int64 a4@<r9>, float xmm1_4_0@<xmm1>, __int64 a5, _DWORD *a6, float *a7)
	typedef uint64_t(__stdcall* t_canjump)(uint64_t x410x8, uint64_t a2, uint64_t a3, uint64_t a4, float& pos1, float& a6, float& a7, uint64_t a8);
	extern t_canjump o_canjump;
	extern uint64_t __stdcall f_canjump(uint64_t x410x8, uint64_t a2, uint64_t a3, uint64_t a4, float& pos1, float& a6, float& a7, uint64_t a8);
	//
	//char __fastcall sub_14085C010(__int64 a1, int a2)
	typedef bool(__fastcall* t_set_action)(uint64_t, int);
	extern t_set_action o_set_action;
	extern bool __fastcall f_set_action(uint64_t self, int actid);
	//
	extern int  traffic_bytes;
	extern int  buffer_traffic_bytes;
	extern bool log_dobuffer;
	extern bool block_test;
	extern sys::s_cfg_v* ibypass_trial;
	extern sys::s_cfg_v* iteleport_gen2;
	extern sys::s_cfg_v* iloot_enable;
	extern sys::s_cfg_v* ikey_ctp;
	extern sys::s_cfg_v* ilock_key;
	extern sys::s_cfg_v* reconnectorienable;
	//
	extern ULONGLONG execution_time;
	extern ULONGLONG time_since_player_playable;
	extern ULONGLONG traffic_timer;
	//
	extern std::unordered_map<std::string, int> kill_stats;
	extern std::vector<std::string> lua_log;
	extern std::vector<s_packet_log> packet_log;
}