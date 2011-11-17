/*
 * ZT_Render.c
 *
 *  Created on: Jan 17, 2011
 *      Author: john
 */

#include "cg_local.h"

void ZT_AdvGlowDiff(refEntity_t *re, centity_t *cent)
{
	class_t playerclass = ( cent->currentState.misc >> 8 ) & 0xFF;

	if (ZT_ESP_AdvGlow_Mode.integer != 1) { return; }

	if (playerclass == PCL_ALIEN_LEVEL3_UPG )
	{
		re->customShader = cgs.media.humanSpawningShader;
	}

}

void ZT_PainGlowDiff(refEntity_t *re, centity_t *cent)
{
	weapon_t weaponNum = cent->currentState.weapon;

	if (ZT_ESP_PainGlow_Mode.integer != 1) { return; }

	if ( Q_stricmpn( BG_Weapon( weaponNum )->name ,"psaw",4) == 0 )
	{
		//cgs.media.whiteShader
		re->customShader = cgs.media.humanSpawningShader;
	}
}

void ZT_RenderPlayer(refEntity_t *re, centity_t *cent)
{
 	int team;
 	team = cent->currentState.misc & 0x00FF;
 	ZT_WallHack(re);
 	ZT_PlayerGlowHack( re, team );
 	ZT_AdvGlowDiff( re, cent);
 	ZT_PainGlowDiff( re, cent);

 	if ( ZT_Targ() == -1 ) { return; }
 	if ( ZT_Targ() == cent->currentState.clientNum )
 	{
 		ZT_TargetGlow( re );
 	}
}
void ZT_RenderBuildable(refEntity_t *re, centity_t *cent)
{
 	ZT_WallHack(re);
}
void ZT_RenderMissile(refEntity_t *re, centity_t *cent)
{
	int weapon = cent->currentState.weapon;

 	ZT_WallHack(re);
 	if (weapon == WP_GRENADE )
 	{
 		ZT_SeeGrenade( re );
 	}

}

