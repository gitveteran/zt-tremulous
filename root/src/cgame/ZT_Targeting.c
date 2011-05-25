/*
 * ZT_Targeting.c
 *
 *  Created on: Jan 17, 2011
 *      Author: john
 */

#include "cg_local.h"

int targ_num;
void ZT_GetTarget( void )
{
	int i;
	vec3_t origin      = {0.0f, 0.0f, 0.0f};
	vec3_t relOrigin   = {0.0f, 0.0f, 0.0f};
	vec3_t target_coords = {0.0f, 0.0f, 0.0f};
	int target_found = 0;
	float dist_temp;
	float best_distance = 999999;
	int team;
	int AimTeam;



	centity_t *cent = NULL;


	if ( !cg.snap ){ return; }//no snapshot

	targ_num = -1;
	for( i = 0; i < cg.snap->numEntities; i++ )
	{
		cent = &cg_entities[ cg.snap->entities[ i ].number ];

		//this entry is a player
		if( cent->currentState.eType == ET_PLAYER )
		{
			//this entry team
			team = cent->currentState.powerups & 0x00FF;
			team -= 1;

			//auto determine the enemy's team
			if ( ZT_Aimbot_Team.integer == 0 )
			{
				if ( cg.snap->ps.stats[ STAT_PTEAM ] == PTE_ALIENS ){ AimTeam = 1; }//aim at humans because we are aliens
				if ( cg.snap->ps.stats[ STAT_PTEAM ] == PTE_HUMANS ){ AimTeam = 0; }//aim at aliens because we are humans
			}
			//manually determine the ememy's team
			else if ( ZT_Aimbot_Team.integer != 0 )
			{
				if ((ZT_Aimbot_Team.integer != 1)
						&& (ZT_Aimbot_Team.integer != 2))
				{
					return;
				}
				AimTeam = ZT_Aimbot_Team.integer - 1;
			}

			//if the entry's team, and our enemy team are different, continue on the loop
			if (team != AimTeam)
				continue;

			//is the entry's position in our fov
			if (ZT_CheckFov(cent->lerpOrigin, ZT_Aimbot_FieldOfView.value))
			{
				if ( ZT_Aimbot_ThroughWalls.integer == 0)
				{
					//is it visible
					if ( ZT_CheckVisible(cent->lerpOrigin) == 0 )
					{
						continue;
					}
				}

				//find a entry with the closes distance
				VectorClear( relOrigin );
				VectorSubtract( cent->lerpOrigin, cg.refdef.vieworg, relOrigin );
				dist_temp = VectorLength(relOrigin);

				if( dist_temp < best_distance )
				{
					target_found = 1;
					best_distance = dist_temp;
					VectorCopy(cent->lerpOrigin, target_coords);
					targ_num = cg.snap->entities[ i ].number;

				}
			}
		}
	}
}

void DrawTargetSpot( void )
{
	vec3_t org;
	vec4_t color = {1.0f,0.0f,1.0f, 1.0f};
	float x,y;
	//looks like my attempt to use external tools to track a spot on screen has failed :-(
	//no reason to go pass this point now
	return;

	ZT_GetTarget( );
	if (targ_num == -1)
	{
		return;
	}
	VectorCopy(cg_entities[ targ_num ].lerpOrigin, org);

	if( !CG_WorldToScreen( org, &x, &y ) )
	{
		return;
	}

	trap_R_SetColor( color );
	CG_DrawPic( x, y, 4.0f,4.0f, cgs.media.whiteShader );
	trap_R_SetColor( NULL );

}
