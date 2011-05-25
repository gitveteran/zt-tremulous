/*
 * ZT_Aimbot.c
 *
 *  Created on: Oct 22, 2010
 *      Author: john
 *
 */
#include "cg_local.h"

int t_num;

void ZT_GetTarget2( void )
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
					t_num = cg.snap->entities[ i ].number;

				}
			}
		}
	}
}

void ZT_Headshot( centity_t *cent, vec3_t result )
{
	  clientInfo_t  *ci;
	  refEntity_t   legs;
	  refEntity_t   torso;
	  refEntity_t   head;
	  int           clientNum;
	  entityState_t *es = &cent->currentState;
	  pClass_t      class = ( es->powerups >> 8 ) & 0xFF;
	  float         scale;
	  vec3_t        tempAxis[ 3 ], tempAxis2[ 3 ];
	  vec3_t        angles;
	  int           held = es->modelindex;
	  vec3_t        surfNormal = { 0.0f, 0.0f, 1.0f };


	  clientNum = es->clientNum;
	  if( clientNum < 0 || clientNum >= MAX_CLIENTS )
	    CG_Error( "Bad clientNum on player entity" );

	  ci = &cgs.clientinfo[ clientNum ];

	  if( !ci->infoValid )
	    return;

	  if( es->eFlags & EF_NODRAW )
	    return;

	  memset( &legs,    0, sizeof( legs ) );
	  memset( &torso,   0, sizeof( torso ) );
	  memset( &head,    0, sizeof( head ) );

	  VectorCopy( cent->lerpAngles, angles );
	  AnglesToAxis( cent->lerpAngles, tempAxis );

	  if( es->eFlags & EF_WALLCLIMB &&
	      BG_RotateAxis( es->angles2, tempAxis, tempAxis2, qtrue, es->eFlags & EF_WALLCLIMBCEILING ) )
	    AxisToAngles( tempAxis2, angles );
	  else
	    VectorCopy( cent->lerpAngles, angles );

	  if( angles[ PITCH ] < -180.0f )
	    angles[ PITCH ] += 360.0f;

	  if( !ci->nonsegmented )
	    CG_PlayerAngles( cent, angles, legs.axis, torso.axis, head.axis );
	  else
	    CG_PlayerNonSegAngles( cent, angles, legs.axis );

	  AxisCopy( legs.axis, tempAxis );

	  //rotate the legs axis to back to the wall
	  if( es->eFlags & EF_WALLCLIMB &&
	      BG_RotateAxis( es->angles2, legs.axis, tempAxis, qfalse, es->eFlags & EF_WALLCLIMBCEILING ) )
	    AxisCopy( tempAxis, legs.axis );

	  //smooth out WW transitions so the model doesn't hop around
	  CG_PlayerWWSmoothing( cent, legs.axis, legs.axis );

	  AxisCopy( tempAxis, cent->pe.lastAxis );


	  if( !ci->nonsegmented )
	  {
	    legs.hModel = ci->legsModel;
	  }
	  else
	  {
	    legs.hModel = ci->nonSegModel;
	    legs.customSkin = ci->nonSegSkin;
	  }

	  VectorCopy( cent->lerpOrigin, legs.origin );

	  VectorCopy( cent->lerpOrigin, legs.lightingOrigin );

	  VectorCopy( legs.origin, legs.oldorigin ); // don't positionally lerp at all

	  //move the origin closer into the wall with a CapTrace
	  if( es->eFlags & EF_WALLCLIMB && !( es->eFlags & EF_DEAD ) && !( cg.intermissionStarted ) )
	  {
	    vec3_t  start, end, mins, maxs;
	    trace_t tr;

	    if( es->eFlags & EF_WALLCLIMBCEILING )
	      VectorSet( surfNormal, 0.0f, 0.0f, -1.0f );
	    else
	      VectorCopy( es->angles2, surfNormal );

	    BG_FindBBoxForClass( class, mins, maxs, NULL, NULL, NULL );

	    VectorMA( legs.origin, -32.0, surfNormal, end );
	    VectorMA( legs.origin, 1.0f, surfNormal, start );
	    CG_CapTrace( &tr, start, mins, maxs, end, es->number, MASK_PLAYERSOLID );

	    //if the trace misses completely then just use legs.origin
	    //apparently capsule traces are "smaller" than box traces
	    if( tr.fraction != 1.0f )
	      VectorMA( legs.origin, tr.fraction * -32.0, surfNormal, legs.origin );

	    VectorCopy( legs.origin, legs.lightingOrigin );
	    VectorCopy( legs.origin, legs.oldorigin ); // don't positionally lerp at all
	  }

	  //rescale the model
	  scale = BG_FindModelScaleForClass( class );

	  if( scale != 1.0f )
	  {
	    VectorScale( legs.axis[ 0 ], scale, legs.axis[ 0 ] );
	    VectorScale( legs.axis[ 1 ], scale, legs.axis[ 1 ] );
	    VectorScale( legs.axis[ 2 ], scale, legs.axis[ 2 ] );

	    legs.nonNormalizedAxes = qtrue;
	  }

	  //offset on the Z axis if required
	  VectorMA( legs.origin, BG_FindZOffsetForClass( class ), surfNormal, legs.origin );
	  VectorCopy( legs.origin, legs.lightingOrigin );
	  VectorCopy( legs.origin, legs.oldorigin ); // don't positionally lerp at all

	  // if the model failed, allow the default nullmodel to be displayed
	  if( !legs.hModel )
	    return;

	  if( !ci->nonsegmented )
	  {
	    //
	    // add the torso
	    //
	    torso.hModel = ci->torsoModel;

	    if( held & ( 1 << UP_LIGHTARMOUR ) )
	      torso.customSkin = cgs.media.larmourTorsoSkin;
	    else
	      torso.customSkin = ci->torsoSkin;

	    if( !torso.hModel )
	      return;

	    VectorCopy( cent->lerpOrigin, torso.lightingOrigin );

	    CG_PositionRotatedEntityOnTag( &torso, &legs, ci->legsModel, "tag_torso" );

	    //
	    // add the head
	    //
	    head.hModel = ci->headModel;

	    if( !head.hModel )
	      return;

	    VectorCopy( cent->lerpOrigin, head.lightingOrigin );

	    CG_PositionRotatedEntityOnTag( &head, &torso, ci->torsoModel, "tag_head" );

	  }
	  VectorCopy( head.origin, result );
}
void ZT_LagPredict( int number, const vec3_t input, vec3_t result )
{

}
void ZT_DeltaPredict( int number, const vec3_t input, vec3_t result )
{

}
void ZT_FaceEnemy( int number, const vec3_t input, vec3_t result )
{

}
void ZT_BarbAttack( int number, const vec3_t input, vec3_t result )
{

}
void ZT_GoonLanding( int number, const vec3_t input, vec3_t result )
{

}


/*** bot modes ***/

void ZT_DistanceBot( )
{

}
void ZT_AutoShoot( void )
{
	trap_SendConsoleCommand( "+attack;" );
	trap_SendConsoleCommand( "-attack;" );
}
void ZT_ClickBot( void )
{
	vec3_t aim;
	ZT_GetTarget( );

	Com_Printf("target is %s", cgs.clientinfo[ t_num ].name);

	ZT_Headshot( &cg_entities[ t_num ], aim );

	ZT_AimAt( cg.refdef.vieworg, aim );
	//trap_SendConsoleCommand( "+attack;" );
	//trap_SendConsoleCommand( "-attack;" );

}
void ZT_AutoAim( )
{

}
