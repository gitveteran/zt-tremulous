/*
 * ZT_AutoRTD.c
 *
 *  Created on: May 24, 2011
 *      Author: john
 */
/*#include "cg_local.h"

int autoRtdState = 0;
int nextrtdsay = -1;

void ZT_RTDChangeState( void )
{
	if ( autoRtdState == 0 )
	{
		autoRtdState = 1;
	}
	else
	{
		autoRtdState = 0;
	}
}

void ZT_RtdCheck( void )
{
	if (autoRtdState == 0) { return; }

	if( cg.snap->ps.persistant[ PERS_TEAM ] == TEAM_SPECTATOR ) { return; }
	if(cg.snap->ps.pm_flags & PMF_FOLLOW) { return ; }
	if( cg.predictedPlayerState.stats[ STAT_HEALTH ] <= 0 ) { return; }

	if (nextrtdsay == -1)
	{
		nextrtdsay = cg.snap->serverTime + 30000;
		trap_SendConsoleCommand( "say !rtd;" );
	}
	else
	{
		if (cg.snap->serverTime > nextrtdsay )
		{
			nextrtdsay = cg.snap->serverTime + 30000;
			trap_SendConsoleCommand( "say !rtd;" );
		}
	}

}*/
