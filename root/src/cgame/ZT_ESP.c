/*
 * ZT_ESP.c
 *
 *  Created on: Nov 9, 2010
 *      Author: john
 */
#include "cg_local.h"

void ZT_SpawnHack( void )
{
	int w;
	char buffer[1024];

	vec4_t buildcolor  = { 1.0f, 1.0f, 0.0f, 1.0f };
	vec4_t aliencolor  = { 1.0f, 0.0f, 0.0f, 1.0f };


	if ( !ZT_ESP_Display_Mode.integer ) { return; }

	Com_sprintf( buffer, MAX_STRING_CHARS, "%d eggs", cgs.numAlienSpawns );
	w = CG_Text_Width( buffer, 0.25f, 0 );
	CG_Text_Paint( ZT_ESP_Display_X.integer + 3, ZT_ESP_Display_Y.integer - 33, 0.25f,
	aliencolor, buffer, 0, 0, ITEM_TEXTSTYLE_SHADOWED );

	Com_sprintf( buffer, MAX_STRING_CHARS, "%d nodes", cgs.numHumanSpawns );
	w = CG_Text_Width( buffer, 0.25f, 0 );
	CG_Text_Paint( ZT_ESP_Display_X.integer + 45, ZT_ESP_Display_Y.integer - 33, 0.25f,
	buildcolor, buffer, 0, 0, ITEM_TEXTSTYLE_SHADOWED );

}
void ZT_StageHack( void )
{
    int w, kills;
    char buffer[1024];


    vec4_t buildcolor  = { 1.0f, 1.0f, 0.0f, 1.0f };
    vec4_t aliencolor  = { 1.0f, 0.0f, 0.0f, 1.0f };


    if ( !ZT_ESP_Display_Mode.integer ) { return; }


	Com_sprintf( buffer, MAX_STRING_CHARS, "%d stage", cgs.alienStage + 1 );
	w = CG_Text_Width( buffer, 0.25f, 0 );
	CG_Text_Paint( ZT_ESP_Display_X.integer + 3, ZT_ESP_Display_Y.integer - 22, 0.25f,
	aliencolor, buffer, 0, 0, ITEM_TEXTSTYLE_SHADOWED );

	kills = abs(cgs.alienNextStageThreshold - cgs.alienKills);
	Com_sprintf( buffer, MAX_STRING_CHARS, "%d kns", kills );
	w = CG_Text_Width( buffer, 0.25f, 0 );
	CG_Text_Paint( ZT_ESP_Display_X.integer + 3, ZT_ESP_Display_Y.integer - 11, 0.25f,
	aliencolor, buffer, 0, 0, ITEM_TEXTSTYLE_SHADOWED );


	Com_sprintf( buffer, MAX_STRING_CHARS, "%d stage", cgs.humanStage + 1 );
	w = CG_Text_Width( buffer, 0.25f, 0 );
	CG_Text_Paint( ZT_ESP_Display_X.integer + 45, ZT_ESP_Display_Y.integer - 22, 0.25f,
	buildcolor, buffer, 0, 0, ITEM_TEXTSTYLE_SHADOWED );

	kills = abs(cgs.humanNextStageThreshold - cgs.humanKills);
	Com_sprintf( buffer, MAX_STRING_CHARS, "%d kns", kills );
	w = CG_Text_Width( buffer, 0.25f, 0 );
	CG_Text_Paint( ZT_ESP_Display_X.integer + 45, ZT_ESP_Display_Y.integer - 11, 0.25f,
	buildcolor, buffer, 0, 0, ITEM_TEXTSTYLE_SHADOWED );
}


// copy and paste of cg_buildable.c: CG_BuildableHealthBar

#define ZT_HEALTH_BAR_WIDTH  50.0f
#define ZT_HEALTH_BAR_HEIGHT 5.0f

void ZT_BuildingHealthBar( centity_t *cent )
{

	vec3_t          origin, origin2, down, right, back, downLength, rightLength;
	float           rimWidth = ZT_HEALTH_BAR_HEIGHT / 15.0f;
	float           doneWidth, leftWidth, progress;
	int             health;
	qhandle_t       shader;
	entityState_t   *es;
	vec3_t          mins, maxs;

	if ( !ZT_ESP_BuildHealth_Mode.integer ) { return; }

	if ( cent->currentState.eType != ET_BUILDABLE ) { return; }

	Com_Printf("hmmm.... wtf\n");

	es = &cent->currentState;

	health = es->generic1 & ~( B_POWERED_TOGGLEBIT | B_DCCED_TOGGLEBIT | B_SPAWNED_TOGGLEBIT );
	progress = (float)health / B_HEALTH_SCALE;

	if( progress < 0.0f )
	progress = 0.0f;
	else if( progress > 1.0f )
	progress = 1.0f;

	if( progress < 0.33f )
	shader = cgs.media.redBuildShader;
	else
	shader = cgs.media.greenBuildShader;

	doneWidth = ( ZT_HEALTH_BAR_WIDTH - 2 * rimWidth ) * progress;
	leftWidth = ( ZT_HEALTH_BAR_WIDTH - 2 * rimWidth ) - doneWidth;

	VectorCopy( cg.refdef.viewaxis[ 2 ], down );
	VectorInverse( down );
	VectorCopy( cg.refdef.viewaxis[ 1 ], right );
	VectorInverse( right );
	VectorSubtract( cg.refdef.vieworg, cent->lerpOrigin, back );
	VectorNormalize( back );
	VectorCopy( cent->lerpOrigin, origin );

	BG_FindBBoxForBuildable( es->modelindex, mins, maxs );
	VectorMA( origin, 48.0f, es->origin2, origin );
	VectorMA( origin, -ZT_HEALTH_BAR_WIDTH / 2.0f, right, origin );

	//HACKME
	VectorMA( origin, maxs[ 0 ] + 8.0f, back, origin ); //was +8

	VectorCopy( origin, origin2 );
	VectorScale( right, rimWidth + doneWidth, rightLength );
	VectorScale( down, ZT_HEALTH_BAR_HEIGHT, downLength );
	CG_DrawPlane( origin2, downLength, rightLength, shader );

	VectorMA( origin, rimWidth + doneWidth, right, origin2 );
	VectorScale( right, leftWidth, rightLength );
	VectorScale( down, rimWidth, downLength );
	CG_DrawPlane( origin2, downLength, rightLength, shader );

	VectorMA( origin, rimWidth + doneWidth, right, origin2 );
	VectorMA( origin2, ZT_HEALTH_BAR_HEIGHT - rimWidth, down, origin2 );
	VectorScale( right, leftWidth, rightLength );
	VectorScale( down, rimWidth, downLength );
	CG_DrawPlane( origin2, downLength, rightLength, shader );

	VectorMA( origin, ZT_HEALTH_BAR_WIDTH - rimWidth, right, origin2 );
	VectorScale( right, rimWidth, rightLength );
	VectorScale( down, ZT_HEALTH_BAR_HEIGHT, downLength );
	CG_DrawPlane( origin2, downLength, rightLength, shader );

	if( !( es->generic1 & B_POWERED_TOGGLEBIT ) &&
	  BG_FindTeamForBuildable( es->modelindex ) == BIT_HUMANS )
	{
		VectorMA( origin, 15.0f, right, origin2 );
		VectorMA( origin2, ZT_HEALTH_BAR_HEIGHT + 5.0f, down, origin2 );
		VectorScale( right, ZT_HEALTH_BAR_WIDTH / 2.0f - 5.0f, rightLength );
		VectorScale( down,  ZT_HEALTH_BAR_WIDTH / 2.0f - 5.0f, downLength );
		CG_DrawPlane( origin2, downLength, rightLength, cgs.media.noPowerShader );
	}

}
void ZT_PlayerInfo( centity_t *cent )
{
	entityState_t   *es = &cent->currentState;
	pClass_t  	    playerclass = ( es->powerups >> 8 ) & 0xFF;
	vec3_t          origin;
	float           progress, health;
	vec3_t          pmax, pmin;
	float		    x, y;
	qhandle_t       shader;

	char            s[ MAX_STRING_CHARS ] = { 0 };
	int             w;
	float           classHealth;
	vec4_t	  color = { 0.0f, 0.0f, 1.0f, 1.0f };
	int c;
	float dist;

	if ( !ZT_ESP_PlayerInfo_Mode.integer ) { return; }

	if ( cent->currentState.eType != ET_PLAYER ) { return; }

	VectorClear( origin );
	VectorSubtract( cent->lerpOrigin, cg.refdef.vieworg, origin );
	dist = VectorLength(origin);


	classHealth = (float) BG_FindHealthForClass( playerclass );
	health = cgs.clientinfo[ es->clientNum ].health;
	progress = health / classHealth;

	VectorCopy( cent->lerpOrigin, origin );
	BG_FindBBoxForClass( playerclass, pmin, pmax, NULL, NULL, NULL );
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

	Com_sprintf(s, MAX_STRING_CHARS, "^7%s ^7[^%i%.0f^7]", cgs.clientinfo[es->clientNum].name, c, health );
	w = CG_Text_Width( s, 0.30f, 0 );

	if (dist < 1000)
	{
		CG_DrawPic( x - w / 2, y, 50, 5, cgs.media.outlineShader );
		CG_DrawPic( x - w / 2, y, 50 * progress , 5, shader );
	}

	if (dist < 2000)
	{
		CG_Text_Paint( x - w / 2, y, 0.25f, color, s, 0, 0, ITEM_TEXTSTYLE_NORMAL );
	}

}

void ZT_NadeInfo( centity_t *cent )
{
	//entityState_t   *es = &cent->currentState;
	vec3_t          origin;
	vec3_t          pmax, pmin;
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
	origin[2] = origin[2] + pmax[2] + 20;

	if( !CG_WorldToScreen( origin, &x, &y ) )
	{
		return;
	}


	timeleft = (cg.snap->serverTime - cent->currentState.time );
	timeleft = 5000 - timeleft;
	timeleft = timeleft / 1000;

	Com_sprintf(s, MAX_STRING_CHARS, "^7%i", timeleft);

	w = CG_Text_Width( s, 0.30f, 0 );

	CG_Text_Paint( x - w / 2, y, 0.25f, color, s, 0, 0, ITEM_TEXTSTYLE_NORMAL );

}



void ZT_ClassInfo( centity_t *cent )
{
	entityState_t   *es = &cent->currentState;
	vec3_t          origin;
	float		    x, y;
	char            s[ MAX_STRING_CHARS ] = { 0 };
	int             w;
	weapon_t      weaponNum;
	pClass_t  	    playerclass = ( es->powerups >> 8 ) & 0xFF;
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
		weaponNum = cent->currentState.weapon;
		if( held & ( 1 << UP_HELMET ) )
		{
			if( held & ( 1 << UP_LIGHTARMOUR ) )
			{
				Com_sprintf(s, MAX_STRING_CHARS, "^7%s %s", "Helmet+Armour", BG_FindNameForWeapon(weaponNum) );
			}
			else
			{
				Com_sprintf(s, MAX_STRING_CHARS, "^7%s %s", "Helmet only", BG_FindNameForWeapon(weaponNum) );
			}
		}
		if( held & ( 1 << UP_LIGHTARMOUR ) )
		{
			Com_sprintf(s, MAX_STRING_CHARS, "^7%s %s", "Armour only", BG_FindNameForWeapon(weaponNum) );
		}
	}
	else if (playerclass == PCL_HUMAN_BSUIT )
	{
		Com_sprintf(s, MAX_STRING_CHARS, "^7%s %s", "Battle Suit", BG_FindNameForWeapon(weaponNum) );
	}
	else
	{
		Com_sprintf(s, MAX_STRING_CHARS, "^7%s", "NONE");
	}

	w = CG_Text_Width( s, 0.30f, 0 );

	CG_Text_Paint( x - w / 2, y, 0.25f, color, s, 0, 0, ITEM_TEXTSTYLE_NORMAL );

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

		//wtf this should work
		if ( ZT_ESP_BuildHealth_Mode.integer == 1)
		{
			if ( cent->currentState.eType == ET_BUILDABLE )
			{
				//ZT_BuildingHealthBar( cent );
				//CG_BuildableHealthBar( cent );
				//moved this to cg_buildable.c:1005, because it failed to show the health bar,
				//but seemingly compiled fine
			}
		}
	}


	ZT_SpawnHack( );
	ZT_StageHack( );
}
