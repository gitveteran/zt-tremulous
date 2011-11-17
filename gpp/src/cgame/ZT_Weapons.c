/*
 * ZT_Weapons.c
 *
 *  Created on: Feb 16, 2011
 *      Author: john
 */

#include "cg_local.h"

int ZT_wasoutofrange = 1;
void ZT_BuyAmmo( void )
{
	//Com_Printf("buying ammo\n");
	trap_SendConsoleCommand("buy ammo;");
}

void ZT_lookForArmory( void )
{
	int i;
	centity_t *cent;
	entityState_t   *es;
	float dist;
	vec3_t relOrigin;
	int found = 0;
	int ammo, clips;
	int maxAmmo, maxClips;


	if ( ZT_Weapons_BuyAmmo.integer == 0 ) { return; }

	if ( cg.snap->ps.stats[ STAT_TEAM ] == TEAM_ALIENS ) { return; }
	if ( cg.snap->ps.weapon == WP_HBUILD ) { return; }

	if( cg.snap->ps.persistant[ PERS_SPECSTATE ] != SPECTATOR_NOT )
		return;
	if(cg.snap->ps.pm_flags & PMF_FOLLOW) { return ; }

	for( i = 0; i < cg.snap->numEntities; i++ )
	{
		cent = &cg_entities[ cg.snap->entities[ i ].number ];
		es = &cent->currentState;

		if (cent->currentState.eType == ET_BUILDABLE)
		{
			if ( cent->currentState.modelindex == BA_H_ARMOURY )
			{
				if ( !( es->eFlags & EF_B_SPAWNED ) ) { continue; }//check if spawned
				if ( !( es->eFlags & EF_B_POWERED ) ) { continue; }//check if powered

				VectorClear( relOrigin );
				VectorSubtract( cent->currentState.pos.trBase, cg.refdef.vieworg, relOrigin );
				dist = VectorLength(relOrigin);

				if ( dist > 100 ) { continue; }//check if in range

				found = 1;

				if (ZT_wasoutofrange)//last time ran we were out of range of an armory
				{
					ZT_BuyAmmo( );
					break;
				}
				else
				{
					//check to see if we are low on ammo
					maxAmmo = BG_Weapon(cg.snap->ps.weapon)->maxAmmo;
					maxClips = BG_Weapon(cg.snap->ps.weapon)->maxClips;
					ammo = cg.snap->ps.ammo;
					clips = cg.snap->ps.clips;
					if ( ammo <= (maxAmmo * .3) )
					{
						ZT_BuyAmmo( );
						break;
					}
				}
			}
		}
	}

	ZT_wasoutofrange = 0;
	if (!found)
	{
		ZT_wasoutofrange = 1;
	}
}
