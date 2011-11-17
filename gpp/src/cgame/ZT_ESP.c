/*
 * ZT_ESP.c
 *
 *  Created on: Nov 9, 2010
 *      Author: john
 */
#include "cg_local.h"

void ZT_PlayerInfo( centity_t *cent )
{
	entityState_t   *es = &cent->currentState;
	vec3_t          origin;
	float           progress, health;
	vec3_t          pmax, pmin;
	float		    x, y;
	qhandle_t       shader;
	class_t  	    playerclass = ( es->misc >> 8 ) & 0xFF;

	char            s[ MAX_STRING_CHARS ] = { 0 };
	int             w;
	float           classHealth;
	vec4_t	  color = { 0.0f, 0.0f, 1.0f, 1.0f };
	int c;
	float dist;
	int showh;

	if ( !ZT_ESP_PlayerInfo_Mode.integer ) { return; }

	if ( cent->currentState.eType != ET_PLAYER ) { return; }

	VectorClear( origin );
	VectorSubtract( cent->lerpOrigin, cg.refdef.vieworg, origin );
	dist = VectorLength(origin);

	showh = 1;
	classHealth = BG_Class( playerclass )->health;
	health = cgs.clientinfo[ es->clientNum ].health;
	if ( health == 0 )
	{
		showh = 0;
	}
	progress = health / classHealth;

	VectorCopy( cent->lerpOrigin, origin );
	BG_ClassBoundingBox( es->modelindex, pmin, pmax, NULL, NULL, NULL );
	origin[2] = origin[2] + pmax[2] + 20;
	if( !CG_WorldToScreen( origin, &x, &y ) )
	{
		return;
	}

	if( progress < 0.0f )
	progress = 0.0f;
	else if( progress > 1.0f )
	progress = 1.0f;

	if( progress < 0.33f )
	{
		shader = cgs.media.redBuildShader;
		c = 1;
	}else {
		shader = cgs.media.greenBuildShader;
		c = 5;
	}

	if (showh)
	{
		Com_sprintf(s, MAX_STRING_CHARS, "^7%s ^7[^%i%.0f^7]", cgs.clientinfo[es->clientNum].name, c, health );
		w = UI_Text_Width( s, 0.30f );

		if (dist < 1000)
		{
			CG_DrawPic( x - w / 2, y, 50, 5, cgs.media.outlineShader );
			CG_DrawPic( x - w / 2, y, 50 * progress , 5, shader );
		}

		if (dist < 2000)
		{
			UI_Text_Paint( x - w / 2, y, 0.25f, color, s, 0, 0, ITEM_TEXTSTYLE_NORMAL );
		}
	}
	else
	{
		Com_sprintf(s, MAX_STRING_CHARS, "^7%s", cgs.clientinfo[es->clientNum].name );
		w = UI_Text_Width( s, 0.30f );
		if (dist < 2000)
			UI_Text_Paint( x - w / 2, y, 0.25f, color, s, 0, 0, ITEM_TEXTSTYLE_NORMAL );
	}

}

void ZT_NadeInfo( centity_t *cent )
{
	//entityState_t   *es = &cent->currentState;
	vec3_t          origin;
	//vec3_t          pmax, pmin;
	float		    x, y;
	char            s[ MAX_STRING_CHARS ] = { 0 };
	int             w;
	vec4_t	  color = { 0.0f, 0.0f, 1.0f, 1.0f };

	int timeleft;

	if ( !ZT_ESP_NadeInfo_Mode.integer ) { return; }

	if ( cent->currentState.eType != ET_MISSILE ) { return; }
	if ( cent->currentState.weapon != WP_GRENADE ) { return; }

	VectorCopy( cent->lerpOrigin, origin );
	//BG_FindBBoxForClass( playerclass, pmin, pmax, NULL, NULL, NULL );
	//origin[2] = origin[2] + pmax[2] + 20;
	origin[2] = origin[2] + 20;

	if( !CG_WorldToScreen( origin, &x, &y ) )
	{
		return;
	}


	timeleft = (cg.snap->serverTime - cent->currentState.time );
	timeleft = 5000 - timeleft;
	timeleft = timeleft / 1000;

	Com_sprintf(s, MAX_STRING_CHARS, "^7%i", timeleft);

	w = UI_Text_Width( s, 0.30f );

	UI_Text_Paint( x - w / 2, y, 0.25f, color, s, 0, 0, ITEM_TEXTSTYLE_NORMAL );

}



void ZT_ClassInfo( centity_t *cent )
{
	entityState_t   *es = &cent->currentState;
	vec3_t          origin;
	float		    x, y;
	char            s[ MAX_STRING_CHARS ] = { 0 };
	int             w;
	weapon_t      weaponNum = cent->currentState.weapon;
	class_t  	    playerclass = ( es->misc >> 8 ) & 0xFF;
	int           held = es->modelindex;
	vec4_t	  color = { 0.0f, 0.0f, 1.0f, 1.0f };


	if ( !ZT_ESP_ClassInfo_Mode.integer ) { return; }

	if( es->eType != ET_PLAYER ) { return; }

	VectorCopy( cent->lerpOrigin, origin );
	origin[2] = origin[2] + 20;

	if( !CG_WorldToScreen( origin, &x, &y ) )
	{
		return;
	}


	if (playerclass == PCL_ALIEN_BUILDER0 )
	{
		Com_sprintf(s, MAX_STRING_CHARS, "^7%s", "granger");
	}
	else if (playerclass == PCL_ALIEN_BUILDER0_UPG )
	{
		Com_sprintf(s, MAX_STRING_CHARS, "^7%s", "adv. granger");
	}
	else if (playerclass == PCL_ALIEN_LEVEL0 )
	{
		Com_sprintf(s, MAX_STRING_CHARS, "^7%s", "dretch");
	}
	else if (playerclass == PCL_ALIEN_LEVEL1 )
	{
		Com_sprintf(s, MAX_STRING_CHARS, "^7%s", "lisk");
	}
	else if (playerclass == PCL_ALIEN_LEVEL1_UPG )
	{
		Com_sprintf(s, MAX_STRING_CHARS, "^7%s", "adv. lisk");
	}
	else if (playerclass == PCL_ALIEN_LEVEL2 )
	{
		Com_sprintf(s, MAX_STRING_CHARS, "^7%s", "mara");
	}
	else if (playerclass == PCL_ALIEN_LEVEL2_UPG )
	{
		Com_sprintf(s, MAX_STRING_CHARS, "^7%s", "adv. mara");
	}
	else if (playerclass == PCL_ALIEN_LEVEL3 )
	{
		Com_sprintf(s, MAX_STRING_CHARS, "^7%s", "goon");
	}
	else if (playerclass == PCL_ALIEN_LEVEL3_UPG )
	{
		Com_sprintf(s, MAX_STRING_CHARS, "^7%s", "adv. goon");
	}
	else if (playerclass == PCL_ALIEN_LEVEL4 )
	{
		Com_sprintf(s, MAX_STRING_CHARS, "^7%s", "tyrant");
	}
	else if (playerclass == PCL_HUMAN )
	{
		if( held & ( 1 << UP_HELMET ) )
		{
			if( held & ( 1 << UP_LIGHTARMOUR ) )
			{
				Com_sprintf(s, MAX_STRING_CHARS, "^7%s %s", "Helmet+Armour", BG_Weapon( weaponNum )->name );
			}
			else
			{
				Com_sprintf(s, MAX_STRING_CHARS, "^7%s %s", "Helmet only", BG_Weapon( weaponNum )->name );
			}
		}
		if( held & ( 1 << UP_LIGHTARMOUR ) )
		{
			Com_sprintf(s, MAX_STRING_CHARS, "^7%s %s", "Armour only", BG_Weapon( weaponNum )->name );
		}
	}
	else if (playerclass == PCL_HUMAN_BSUIT )
	{
		Com_sprintf(s, MAX_STRING_CHARS, "^7%s %s", "Battle Suit", BG_Weapon( weaponNum )->name );
	}
	else
	{
		Com_sprintf(s, MAX_STRING_CHARS, "^7%s", "NONE");
	}

	w = UI_Text_Width( s, 0.30f );

	UI_Text_Paint( x - w / 2, y, 0.25f, color, s, 0, 0, ITEM_TEXTSTYLE_NORMAL );

}


void ZT_ESP( void )
{
	int i;
	centity_t *cent;

	if ( !ZT_ESP_Mode.integer ) { return; }

	for( i = 0; i < cg.snap->numEntities; i++ )
	{
		cent = &cg_entities[ cg.snap->entities[ i ].number ];

		ZT_PlayerInfo( cent );
		ZT_NadeInfo( cent );
		ZT_ClassInfo( cent );

		if ( ZT_ESP_BuildHealth_Mode.integer == 1)
		{
			if (cent->currentState.eType == ET_BUILDABLE )
				CG_BuildableStatusDisplay(cent);
		}
	}
}
