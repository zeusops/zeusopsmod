#include "BIS_AddonInfo.hpp"
class CfgPatches
{
	class NB40mm
	{
		units[]={};
		weapons[]={};
		author="Caboose";
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Weapons_F",
			"rhs_c_weapons",
			"rhsusf_c_weapons"
		};
	};
};
class CfgAmmo
{
	class SmokeShell;
	class SmokeShellBlue;
	class SmokeShellGreen;
	class SmokeShellOrange;
	class SmokeShellPurple;
	class SmokeShellRed;
	class SmokeShellYellow;
	class rhs_g_vog25;
	
	//Vanilla
	class G_40mm_Smoke: SmokeShell
	{
		simulation="shotSmoke";
		deflectionSlowDown=0.1;
	};
	
	//RHS USAF
	class rhs_40mm_m714_white: SmokeShell
	{
		simulation="shotSmoke";
		deflectionSlowDown=0.1;
	};
	class rhs_40mm_m713_red: SmokeShellRed
	{
		simulation="shotSmoke";
		deflectionSlowDown=0.1;
	};
	class rhs_40mm_m715_green: SmokeShellGreen
	{
		simulation="shotSmoke";
		deflectionSlowDown=0.1;
	};
	class rhs_40mm_m716_yellow: SmokeShellYellow
	{
		simulation="shotSmoke";
		deflectionSlowDown=0.1;
	};
	
	//RHS AFRF
	class rhs_g_vg40md_green: rhs_g_vog25
	{
		simulation="shotSmoke";
		deflectionSlowDown=0.1;
	};
	class rhs_g_vg40md_red: rhs_g_vog25
	{
		simulation="shotSmoke";
		deflectionSlowDown=0.1;
	};
	class rhs_g_vg40md_white: rhs_g_vog25
	{
		simulation="shotSmoke";
		deflectionSlowDown=0.1;
	};
};
