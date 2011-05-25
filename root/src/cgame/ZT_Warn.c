/*
 * ZT_Warn.c
 *
 *  Created on: Feb 6, 2011
 *      Author: john
 */

#include "cg_local.h"

/*
 * auto tell your team if u see a nade
 */

int ZT_NadePending = 0;
int ZT_NadeWarnCoolDown = 0;
int ZT_NadeDelay = 0;

void ZT_SendWarningNade( void )
{
	trap_SendConsoleCommand( "say_team \"^1Nade!\";");
	return;
}

void ZT_NadeWarn( void )
{
	int i;
	centity_t *cent;

	if ( ZT_Warn_Mode.integer == 0) { return; }
	if ( ZT_Warn_Nades.integer != 1 ){ return; }

	if (ZT_NadeWarnCoolDown == 0 )
	{
		ZT_NadeWarnCoolDown = cg.time;
	}

	if (ZT_NadePending == 1)
	{
		if (ZT_NadeDelay <= cg.time )
		{
			ZT_SendWarningNade( );
			ZT_NadePending = 0;
			ZT_NadeWarnCoolDown = cg.time + 10000;
		}
	}

	for( i = 0; i < cg.snap->numEntities; i++ )
	{
		cent = &cg_entities[ cg.snap->entities[ i ].number ];

		if ( ( cent->currentState.eType == ET_MISSILE )
				&& ( cent->currentState.weapon == WP_GRENADE ) )
		{
			if (ZT_NadeWarnCoolDown <= cg.time)
			{
				ZT_NadePending = 1;
				ZT_NadeDelay = cg.time + 20;
			}

		}
	}
}

/*
 * auto tell your team if you just killed om/ rc
 */

int ZT_warnCountOM = 0;
int ZT_warnCountRC = 0;

void ZT_SentWarningRC_OM( int w )
{
	switch( w )
	{
	case 1:
		trap_SendConsoleCommand( "say_team \"^2Their RC is down.\";" );
		return;
	case 2:
		trap_SendConsoleCommand( "say_team \"^2Our RC is down.\";" );
		return;
	case 3:
		trap_SendConsoleCommand( "say_team \"^2Their OM is down.\";" );
		return;
	case 4:
		trap_SendConsoleCommand( "say_team \"^2Our OM is down.\";" );
		return;
	}
}

void ZT_WarnDC( void )
{
	int i;
	centity_t *cent;
    int team = -1;
    int health;
    int spawned;
    int cteam;
    int TargetTeam;
    vec3_t relOrigin;
    float temp;

    if ( ZT_Warn_Mode.integer == 0) { return; }
    if ( ZT_Warn_DC.integer == 0) { return; }

    if ( cg.snap->ps.persistant[ PERS_TEAM ] == TEAM_SPECTATOR ) { return; }
    if(cg.snap->ps.pm_flags & PMF_FOLLOW) { return ; }

	if ( cg.snap->ps.stats[ STAT_PTEAM ] == PTE_ALIENS )
	{
		team = 0;
	}

	if ( cg.snap->ps.stats[ STAT_PTEAM ] == PTE_HUMANS )
	{
		team = 1;
	}

	if ( team == -1 ) { return; }

	for( i = 0; i < cg.snap->numEntities; i++ )
	{
		cent = &cg_entities[ cg.snap->entities[ i ].number ];

		if (cent->currentState.eType == ET_BUILDABLE)
		{
			if ( !ZT_CheckVisible(cent->currentState.pos.trBase)
					|| !ZT_CheckFov(cent->currentState.pos.trBase, 30.0) )
			{ continue; }

			VectorClear( relOrigin );
			VectorSubtract( cent->lerpOrigin, cg.refdef.vieworg, relOrigin );
			temp = VectorLength(relOrigin);

			if (temp > 200){
				ZT_warnCountRC = 1;
				ZT_warnCountOM = 1;
				continue;
			}

			health = cent->currentState.generic1 & ~( B_POWERED_TOGGLEBIT | B_DCCED_TOGGLEBIT | B_SPAWNED_TOGGLEBIT );
			spawned = cent->currentState.generic1 & ( B_SPAWNED_TOGGLEBIT );
			if ( cent->currentState.modelindex == BA_H_REACTOR )
			{
				//if ( cent->currentState.legsAnim & BANIM_DESTROY1 )

				if ( !spawned ) { continue; }
				if ( health <= 0 )
				{
					if ( ZT_warnCountRC == 1 ) { return; }
					if ( team == 0 ) { ZT_SentWarningRC_OM(1); }
					if ( team == 1 ) { ZT_SentWarningRC_OM(2); }
					ZT_warnCountRC ++;
				}
				else
				{
					ZT_warnCountRC = 0;
				}
			}
			else if ( cent->currentState.modelindex == BA_A_OVERMIND )
			{
				if ( !spawned ) { continue; }
				if ( health <= 0 )
				{
					if ( ZT_warnCountOM == 1 ) { return; }
					if ( team == 0 ) { ZT_SentWarningRC_OM(4); }
					if ( team == 1 ) { ZT_SentWarningRC_OM(3); }
					ZT_warnCountOM ++;
				}
				else
				{
					ZT_warnCountOM = 0;
				}
			}
		}
	}
}
