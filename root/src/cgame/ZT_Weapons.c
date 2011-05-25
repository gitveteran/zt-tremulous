/*
 * ZT_Weapons.c
 *
 *  Created on: Feb 16, 2011
 *      Author: john
 */

#include "cg_local.h"


void ZT_GrangerAutoEvo( void )
{
	if ( ZT_Weapons_AutoGrangerEvo.integer == 0) { return; }
	if ( cg.snap->ps.weapon != WP_ALEVEL1 ) { return; }

	if ( cgs.alienStage == 0) { return; }

	trap_SendConsoleCommand("evo s1upgrd");//definly wrong but easy to fix in testing
}

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
	float dist;
	vec3_t relOrigin;
    vec3_t origin      = {0.0f, 0.0f, 0.0f};
    int g;
    int found = 0;

    int ammo, clips;
    int maxAmmo, maxClips;

	if ( cg.snap->ps.stats[ STAT_PTEAM ] == PTE_ALIENS ) { return; }
	if ( cg.snap->ps.weapon == WP_HBUILD ) { return; }
	if ( cg.snap->ps.weapon == WP_HBUILD2 ) { return; }

    if ( cg.snap->ps.persistant[ PERS_TEAM ] == TEAM_SPECTATOR ) { return; }
    if(cg.snap->ps.pm_flags & PMF_FOLLOW) { return ; }

	for( i = 0; i < cg.snap->numEntities; i++ )
	{
		cent = &cg_entities[ cg.snap->entities[ i ].number ];

		if (cent->currentState.eType == ET_BUILDABLE)
		{
			if ( cent->currentState.modelindex == BA_H_ARMOURY )
			{
				g = cent->currentState.generic1;

				if ( !( g & B_SPAWNED_TOGGLEBIT ) ) { continue; }//check if spawned
				if ( !(g & B_POWERED_TOGGLEBIT ) ) { continue; }//check if powered

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
					BG_FindAmmoForWeapon( cg.snap->ps.weapon, &maxAmmo, &maxClips );
					BG_UnpackAmmoArray( cg.snap->ps.weapon, cg.snap->ps.ammo, cg.snap->ps.powerups, &ammo, &clips );
					//if (clips == 0)
					//{
						if ( ammo <= (maxAmmo * .3) )//better for spamming
						{
							ZT_BuyAmmo( );
							break;
						}
					//}
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
//TODO fix for some reason when ever you buy a builder it auto triggers once
int ZT_sblaster = 1;
void ZT_AutoBlaster( void )
{
    int ammo, clips;
    BG_UnpackAmmoArray( cg.snap->ps.weapon, cg.snap->ps.ammo, cg.snap->ps.powerups, &ammo, &clips );
    if ( cg.snap->ps.stats[ STAT_PTEAM ] == PTE_HUMANS )
    {
    	if ( cg.snap->ps.weapon == WP_BLASTER ) { return; }
    	if ( cg.snap->ps.weapon == WP_PAIN_SAW ) { return; }
    	if ( cg.snap->ps.weapon == WP_GRENADE ) { return; }
    	if ( cg.snap->ps.weapon == WP_MGTURRET ) { return; }
    	if ( cg.snap->ps.weapon == WP_HBUILD ) { return; }

    	if ( ( ammo > 0) && ( clips > 0) )
    		ZT_sblaster = 0;

    	if ( ( ammo <= 0 ) && ( clips <= 0 ) )
    	{
    		if ( !ZT_sblaster )
    		{
    			ZT_sblaster = 1;
    			trap_SendConsoleCommand( "itemtoggle blaster;" );
    		}
    	}
    }
}
