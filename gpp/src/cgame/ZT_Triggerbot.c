/*
 * ZT_Triggerbot.c
 *
 *  Created on: Oct 22, 2010
 *      Author: john
 */

#include "cg_local.h"

int ZT_TriggerSnap = -1;
void ZT_TriggerAttack( void )
{
	//only check the fast guns if your on human aliens dont have guns
	if ( cg.snap->ps.stats[ STAT_TEAM] == TEAM_HUMANS )
	{
		if ( cg.snap->ps.weapon == WP_HBUILD){ return; }//will engage the build menu making it so you cant move
		else{
			if ( ZT_Triggerbot_DisableFastGuns.integer == 1 )
			{
				//weapons that we dont what to attack with
				if ( cg.snap->ps.weapon == WP_MACHINEGUN ){ return; }
				else if ( cg.snap->ps.weapon == WP_HBUILD ){ return; }
				else if ( cg.snap->ps.weapon == WP_LAS_GUN ){ return; }
				else if ( cg.snap->ps.weapon == WP_CHAINGUN ){ return; }
				else if (cg.snap->ps.weapon == WP_FLAMER ){ return; }
				else if (cg.snap->ps.weapon == WP_PAIN_SAW ){ return; }
				else if (cg.snap->ps.weapon == WP_PULSE_RIFLE ){ return; }
				else if (cg.snap->ps.weapon == WP_LUCIFER_CANNON )
				{
					if ( ZT_Triggerbot_Cannnon.integer == 1 )
					{
						if ( ZT_Triggerbot_Cannon_ShortRangeOnly.integer != 0)
						{
							trace_t   trace;
							centity_t *cent = NULL;
							vec3_t    start, end;
							int       distance = ZT_AttackDistance();
							vec3_t    relOrigin;
							float temp;

							VectorCopy( cg.refdef.vieworg, start );
							VectorMA( start, distance, cg.refdef.viewaxis[ 0 ], end );

							CG_Trace( &trace, start, vec3_origin, vec3_origin, end,
									cg.snap->ps.clientNum, CONTENTS_SOLID|CONTENTS_BODY|CONTENTS_STRUCTURAL );
							cent = &cg_entities[ trace.entityNum ];
							VectorClear( relOrigin );
							VectorSubtract( cent->lerpOrigin, cg.refdef.vieworg, relOrigin );
							temp = VectorLength(relOrigin);
							if (ZT_Triggerbot_Cannon_ShortRangeOnly.integer <= temp)
							{
								trap_SendConsoleCommand( "-attack;" );
							}
						} else {
							trap_SendConsoleCommand( "-attack;" );
						}
					}
				}
				else if (cg.snap->ps.weapon == WP_MGTURRET) { return; }
				//any thing not listed is ok
				else
				{
					trap_SendConsoleCommand( "+attack;" );
					trap_SendConsoleCommand( "-attack;" );
				}
			}
			else
			{
				trap_SendConsoleCommand( "+attack;" );
				trap_SendConsoleCommand( "-attack;" );
			}
		}
	}
	else if ( cg.snap->ps.stats[ STAT_TEAM ] == TEAM_ALIENS )
	{
		if ( cg.snap->ps.stats[ STAT_CLASS ] == PCL_ALIEN_BUILDER0 )
		{
			return;
		}
		//current player is a level 2 alien builder
		else if ( cg.snap->ps.stats[ STAT_CLASS ] == PCL_ALIEN_BUILDER0_UPG )
		{
			if ( ZT_Triggerbot_GrangerSpit.integer == 1 )
			{
				trap_SendConsoleCommand( "+button2;" );
				trap_SendConsoleCommand( "-button2;" );
			}
			else if ( ZT_Triggerbot_GrangerClaw.integer == 1 )
			{
				trap_SendConsoleCommand( "+button3;" );
				trap_SendConsoleCommand( "-button3;" );
			}
			else
			{
				return;
			}
		}
		//mara lightning
		else if (cg.snap->ps.stats[ STAT_CLASS] == PCL_ALIEN_LEVEL2_UPG )
		{
			if ( ZT_Triggerbot_MaraLightning.integer == 1)
			{
				trap_SendConsoleCommand( "+button5;");
				trap_SendConsoleCommand( "-button5;");
			}
			else if (ZT_Triggerbot_MaraSpit.integer == 1)
			{
				trap_SendConsoleCommand( "+button2;" );
				trap_SendConsoleCommand( "-button2;" );
			}
			else
			{
				trap_SendConsoleCommand( "+attack;" );
				trap_SendConsoleCommand( "-attack;" );
			}
		}

		//current player is any class else
		else
		{
			trap_SendConsoleCommand( "+attack;" );
			trap_SendConsoleCommand( "-attack;" );
		}
	}
}
//---------------
/*features
 * attack both players and buildings
 * disable guns that could get you caught
 * granger spit trigger(but no predict)
 * choose what team you want to attack(if you like pissing your team off)
 *
 * features to work on --a predict trigger
 * add a charge function to the luci cannon
 */
void ZT_Triggerbot( void ){
	trace_t   trace;
	centity_t *cent = NULL;
	vec3_t    start, end;
	int       team;
	int       distance = ZT_AttackDistance()+ZT_Triggerbot_Distance.integer;
	int 	  TargetType=-1;//0 building, 1 player
	int       TargetTeam=-1;
	int       aimTeam=-1;
    if ( !cg.snap ){ return; }//no snapshot
    if ( ZT_TriggerSnap >= cg.latestSnapshotNum ){ return; }//already did this snapshot
    ZT_TriggerSnap = cg.latestSnapshotNum;

	if ( ZT_Triggerbot_Mode.integer != 1 ){ return; }
	if( !distance ) return;
	//if( cg.snap->ps.persistant[ PERS_TEAM ] == TEAM_SPECTATOR ) { return; }
	if( cg.snap->ps.persistant[ PERS_SPECSTATE ] != SPECTATOR_NOT )//really != SPECTATOR_NOT, who the hell came up with that crap
		return;
	if(cg.snap->ps.pm_flags & PMF_FOLLOW) { return ; }

	VectorCopy( cg.refdef.vieworg, start );
	VectorMA( start, distance, cg.refdef.viewaxis[ 0 ], end );

	CG_Trace( &trace, start, vec3_origin, vec3_origin, end,
			cg.snap->ps.clientNum, CONTENTS_SOLID|CONTENTS_BODY|CONTENTS_STRUCTURAL );

	//grab a reference to the entry we just hit
	cent = &cg_entities[ trace.entityNum ];


	//classify the entity the trace hit
	if (cent->currentState.eType == ET_INVISIBLE)
	{
		CG_Printf("entity is invisible trigger off for it\n");
		return;
	}
	else if (cent->currentState.eType == ET_BUILDABLE)
	{
		TargetType = 0;//building
		if (cent->currentState.modelindex2 == TEAM_ALIENS){ TargetTeam = 0;}
		else if( cent->currentState.modelindex2 == TEAM_HUMANS ){ TargetTeam = 1;}
	}
	else if( cent->currentState.eType == ET_PLAYER )
	{
		TargetType = 1;//player
		team = cent->currentState.misc & 0x00FF;

		if( team == TEAM_ALIENS ) { TargetTeam = 0; }
		else if( team == TEAM_HUMANS ) { TargetTeam = 1; }
	}

	//auto select the aim team
	if ( ZT_Triggerbot_Team.integer == 0 ){
		if ( cg.snap->ps.stats[ STAT_TEAM ] == TEAM_ALIENS ){ aimTeam = 1; }//aim at humans because we are aliens
		if ( cg.snap->ps.stats[ STAT_TEAM ] == TEAM_HUMANS ){ aimTeam = 0; }//aim at aliens because we are humans
	}
	//manually select team
	else
	{
		if ( ZT_Triggerbot_Team.integer == 1 ){ aimTeam = 1; }//humans
		if ( ZT_Triggerbot_Team.integer == 2 ){ aimTeam = 0; }//aliens
	}

	//we are aiming at the right team
	if (TargetTeam == aimTeam)
	{
		//kill buildings
		if ( ( TargetType == 0 ) && ( ZT_Triggerbot_Structures.integer == 1 ) )
		{
			ZT_TriggerAttack();
		}
		//we don't want to kill buildings
		else if ( ( TargetType == 0 ) && ( ZT_Triggerbot_Structures.integer == 0 ) )
		{
			return;
		}
		//attack a player
		else if ( TargetType == 1 )
		{
			ZT_TriggerAttack();
		}
	}
	else
	{
		return;
	}
}
