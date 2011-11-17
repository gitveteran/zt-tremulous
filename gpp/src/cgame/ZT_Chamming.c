/*
 * ZT_Chamming.c
 *
 *  Created on: Nov 9, 2010
 *      Author: john
 */
#include "cg_local.h"

void ZT_TargetGlow( refEntity_t *re)
{
	re->customShader = cgs.media.humanSpawningShader;
}

void ZT_PlayerGlowHack( refEntity_t *re, int team )
{
	if( ZT_Chamming_DiffGlow.integer)
	{
		if(team == TEAM_HUMANS){
			re->customShader = cgs.media.greenBuildShader;
		}
		else
		{
			re->customShader = cgs.media.redBuildShader;
		}
	}
	else if ( ZT_Chamming_Glow.integer )
	{
		re->customShader = cgs.media.humanSpawningShader;
	}
}

void ZT_SeeGrenade( refEntity_t *re)
{
	if ( ZT_Chamming_GlowGren.integer )
	{
		re->customShader = cgs.media.greenBuildShader;
	}
}
