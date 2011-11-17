/*
 * ZT_Targeting.c
 *
 *  Created on: Jan 17, 2011
 *      Author: john
 */

#include "cg_local.h"

int t_num = -1;
int outOfRange = -1;
int ForceNewTarget = 0;

int ZT_Targ( void )
{
	return t_num;
}
void NewTarget( void )
{
	Com_Printf("new targ\n");
	ForceNewTarget = 1;
}

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
	team_t AimTeam;
	entityState_t   *es;
	centity_t *cent = NULL;
	int t_f=-1;

	if (!ZT_Aimbot_Mode.integer)
	{
		return;
	}

	if ( !cg.snap ){ return; }//no snapshot

	//auto determine the enemy's team
	if ( ZT_Aimbot_Team.integer == 0 )
	{
		if ( cg.snap->ps.stats[ STAT_TEAM ] == TEAM_ALIENS ){ AimTeam = TEAM_HUMANS;}//aim at humans because we are aliens
		if ( cg.snap->ps.stats[ STAT_TEAM ] == TEAM_HUMANS ){ AimTeam = TEAM_ALIENS; }//aim at aliens because we are humans
	}
	//manually determine the ememy's team
	else if ( ZT_Aimbot_Team.integer != 0 )
	{
		if (ZT_Aimbot_Team.integer == 1)
			AimTeam = TEAM_ALIENS;
		if (ZT_Aimbot_Team.integer == 2)
			AimTeam = TEAM_HUMANS;
	}

	t_f = -1;
	for( i = 0; i < cg.snap->numEntities; i++ )
	{
		cent = &cg_entities[ cg.snap->entities[ i ].number ];
		es = &cent->currentState;

		if (!cent->currentValid)
		{
			continue;
		}

		//this entry is a player
		if( cent->currentState.eType == ET_PLAYER )
		{
			//this entry team
			team = cent->currentState.misc & 0x00FF;

			if ( es->eFlags & EF_DEAD )
			{
				continue;
			}

			//if the entry's team, and our enemy team are different, continue on the loop
			if (team != AimTeam)
			{
				continue;
			}

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
					t_f = cg.snap->entities[ i ].number;
				}
			}
		}
	}

	if (ForceNewTarget == 1)
	{
		outOfRange = -1;
		t_num = t_f;
		return;
	}

	if (t_num == -1)
	{
		t_num = t_f;
	}
	else
	{
		if (t_f != t_num)
		{
			if (outOfRange == -1)
			{
				outOfRange = cg.latestSnapshotTime;
			}
			else
			{
				if ( cg_entities[ t_num ].currentState.eFlags & EF_DEAD )
				{
					outOfRange = -1;
					t_num = t_f;
				}
				else if ( (cg.latestSnapshotTime - outOfRange) >= 1300 )
				{
					outOfRange = -1;
					t_num = t_f;
				}
			}
		}
		else
		{
			outOfRange = -1;
		}
	}

}
