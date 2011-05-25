/*
 * ZT_Common.c
 *
 *  Created on: Oct 22, 2010
 *      Author: john
 *
 *      Functions shared between modules, alter carefully
 *
 */
#include "cg_local.h"


#define ANG_CLIP(ang) if(ang>180.0f)ang-=360.0f;else if(ang<-180.0f)ang+=360.0f

void ZT_VectorAngles(const vec3_t forward, vec3_t angles)
{
    float tmp, yaw, pitch;

    if (forward[1] == 0 && forward[0] == 0) {
    	yaw = 0;
    	if (forward[2] > 0)
    		pitch = 90;
    	else
    		pitch = 270;
    }
    else {
    	yaw = (atan2(forward[1], forward[0]) * 180 / M_PI);
    	if (yaw < 0)
    		yaw += 360;

    	tmp = sqrt(forward[0] * forward[0] + forward[1] * forward[1]);
    	pitch = (atan2(forward[2], tmp) * 180 / M_PI);
    	if (pitch < 0)
    		pitch += 360;
	}

    angles[0] = pitch;
    angles[1] = yaw;
    angles[2] = 0;
}
int ZT_CheckFov(vec3_t origin, float fov)
{
    vec3_t vec, ang;
    VectorSubtract(origin, cg.refdef.vieworg, vec);
    ZT_VectorAngles(vec, ang);
    ANG_CLIP(ang[YAW]);
    ANG_CLIP(ang[PITCH]);
    ang[PITCH] = -ang[PITCH];
    ang[0] -= cg.refdefViewAngles[0];
    ang[1] -= cg.refdefViewAngles[1];
    ANG_CLIP(ang[YAW]);
    ANG_CLIP(ang[PITCH]);
    if((ang[0] * ang[0] + ang[1] * ang[1])<=( fov*fov))
    {
	    return 1;
    }
    return 0;
}

//int ZT_CheckVisible( float *pos )//was
int ZT_CheckVisible( vec3_t pos )
{
	trace_t t;

	CG_Trace(&t, pos, NULL, NULL, cg.refdef.vieworg, cg.clientNum, MASK_SHOT & ~CONTENTS_BODY);

	if (t.fraction == 1.0f)
	{
		return 1;
	}

	return 0;
}

int ZT_AttackDistance( void )
{
    switch(cg.snap->ps.stats[ STAT_PCLASS ])
    {
    case PCL_ALIEN_BUILDER0_UPG:
        return LEVEL0_BITE_RANGE;

    case PCL_ALIEN_LEVEL1:
    case PCL_ALIEN_LEVEL1_UPG:
        return LEVEL1_CLAW_RANGE;

    case PCL_ALIEN_LEVEL2:
    	return LEVEL2_CLAW_RANGE;
    case PCL_ALIEN_LEVEL2_UPG:
		if ( ZT_Triggerbot_MaraSpit.integer == 1 )
		{
			return 131072;
		}
		else
		{
			return LEVEL2_CLAW_RANGE;
		}

    case PCL_ALIEN_LEVEL3:
    case PCL_ALIEN_LEVEL3_UPG:
        return LEVEL3_CLAW_RANGE;

    case PCL_ALIEN_LEVEL4:
        return LEVEL4_CLAW_RANGE;

    case PCL_HUMAN:
        return 131072;

    default:
        return 0;
    }
}
void ZT_DoAimbot(vec3_t target)
{
    vec3_t org, ang;
    float x, y;
    VectorSubtract(target, cg.refdef.vieworg, org);
    ZT_VectorAngles(org, ang);
    ang[PITCH] = -ang[PITCH];
    if (ang[YAW] > 180.0f)
	ang[YAW] -= 360.0f;
    else if (ang[YAW] < -180.0f)
	ang[YAW] += 360.0f;
    if (ang[PITCH] > 180.0f)
	ang[PITCH] -= 360.0f;
    else if (ang[PITCH] < -180.0f)
	ang[PITCH] += 360.0f;
    AnglesToAxis(ang,cg.refdef.viewaxis);
    ang[YAW] -= cg.refdefViewAngles[YAW];
    if (ang[YAW] > 180.0f)
	ang[YAW] -= 360.0f;
    else if (ang[YAW] < -180.0f)
	ang[YAW] += 360.0f;
    ang[PITCH] -= cg.refdefViewAngles[PITCH];
    if (ang[PITCH] > 180.0f)
	ang[PITCH] -= 360.0f;
    else if (ang[PITCH] < -180.0f)
	ang[PITCH] += 360.0f;
    x = ang[YAW];
    y = ang[PITCH];
    trap_SetSmooth( &y, &x );
}
void ZT_AimAtC( vec3_t target)
{
	vec3_t org, ang;
	float y,p;

	VectorSubtract(target, cg.refdef.vieworg, org);
	vectoangles( org, ang );

	if (ang[YAW] > 180.0f)
		ang[YAW] -= 360.0f;
	else if (ang[YAW] < -180.0f)
		ang[YAW] += 360.0f;
	if (ang[PITCH] > 180.0f)
		ang[PITCH] -= 360.0f;
	else if (ang[PITCH] < -180.0f)
		ang[PITCH] += 360.0f;

	ang[YAW] -= cg.refdefViewAngles[YAW];
	ang[PITCH] -= cg.refdefViewAngles[PITCH];

	if (ang[YAW] > 180.0f)
		ang[YAW] -= 360.0f;
	else if (ang[YAW] < -180.0f)
		ang[YAW] += 360.0f;
	if (ang[PITCH] > 180.0f)
		ang[PITCH] -= 360.0f;
	else if (ang[PITCH] < -180.0f)
		ang[PITCH] += 360.0f;

	y = ang[YAW];
	p = ang[PITCH];

	// TODO set smooth speed based on the amount of change of ViewAngles from the new ang
	//go by angles of 15
	/*if (ang[YAW] <= 15) {  }
	else if (ang[YAW] <= 30) {  }
	else if (ang[YAW] <= 45) {  }
	else if (ang[YAW] <= 60) {  }
	else if (ang[YAW] <= 75) {  }
	*/

	trap_SetSmooth( &y, &p);
}
void ZT_AimAt( vec3_t aim_org, vec3_t aim_target )
{
	vec3_t origin;
	vec3_t target_coords;
	vec3_t org;
	vec3_t ang;
	float y,p;
	float sy,sp;

	VectorCopy(aim_target, target_coords);
	VectorCopy(aim_org,origin);
	VectorSubtract(target_coords,origin,org);
	ZT_VectorAngles(org, ang);

	ang[PITCH] = -ang[PITCH];
	//ang[PITCH] += .3;/*not sure what this is*/
	if (ang[YAW] > 180.0f)
		ang[YAW] -= 360.0f;
	else if (ang[YAW] < -180.0f)
		ang[YAW] += 360.0f;
	if (ang[PITCH] > 180.0f)
		ang[PITCH] -= 360.0f;
	else if (ang[PITCH] < -180.0f)
		ang[PITCH] += 360.0f;

	AnglesToAxis(ang,cg.refdef.viewaxis);

	ang[YAW] -= cg.refdefViewAngles[YAW];
	if (ang[YAW] > 180.0f)
		ang[YAW] -= 360.0f;
	else if (ang[YAW] < -180.0f)
		ang[YAW] += 360.0f;

	ang[PITCH] -= cg.refdefViewAngles[PITCH];
	if (ang[PITCH] > 180.0f)
		ang[PITCH] -= 360.0f;
	else if (ang[PITCH] < -180.0f)
		ang[PITCH] += 360.0f;

	y = ang[YAW];
	p = ang[PITCH];
	//CG_Printf("yaw: %f\npitch: %f\n",y,p);
	//trap_SetYaw( &p );
	//trap_SetPitch( &y );
	if (ang[YAW] <= 15) {
		sy = 4;
		trap_SmoothSpeedY( &sy );
	}
	else if (ang[YAW] <= 30) {
		sy = 2.7;
		trap_SmoothSpeedY( &sy );
	}
	else if (ang[YAW] <= 45) {
		sy = 1.5;
		trap_SmoothSpeedY( &sy );
	}
	else if (ang[YAW] <= 60) {
		sy = 1;
		trap_SmoothSpeedY( &sy );
	}

	if (ang[PITCH] <= 15) {
		sp = 4;
		trap_SmoothSpeedY( &sp );
	}
	else if (ang[PITCH] <= 30) {
		sp = 2.7;
		trap_SmoothSpeedY( &sp );
	}
	else if (ang[PITCH] <= 45) {
		sp = 1.5;
		trap_SmoothSpeedY( &sp );
	}
	else if (ang[PITCH] <= 60) {
		sp = 1;
		trap_SmoothSpeedY( &sp );
	}
	trap_SetSmooth( &y, &p);
}

typedef struct ZT_weaponSpeeds_s
{
	float ZT_ALEVEL0_SPEED;
	float ZT_ALEVEL1_SPEED;
	float ZT_ALEVEL1_UPG_SPEED;
	float ZT_ALEVEL2_SPEED;
	float ZT_ALEVEL2_UPG_SPEED;
	float ZT_ALEVEL3_SPEED;
	float ZT_ALEVEL3_UPG_SPEED;
	float ZT_ALEVEL4_SPEED;
	float ZT_BLASTER_SPEED;
	float ZT_RIFLE_SPEED;
	float ZT_PAINSAW_SPEED;
	float ZT_GRENADE_SPEED;
	float ZT_SHOTGUN_SPEED;
	float ZT_LASGUN_SPEED;
	float ZT_MDRIVER_SPEED;
	float ZT_CHAINGUN_SPEED;
	float ZT_PRIFLE_SPEED;
	float ZT_FLAMER_SPEED;
	float ZT_LCANNON_SPEED;
} ZT_weaponSpeeds_t;

/*
 * i used a stuct and then declared it globally the idea is that some servers
 * in trem. mod the weapon speeds; by having the values in a struct, they can
 * be changed, if your playing a mod. These values are normally defined in
 * tremulous.h
 */

ZT_weaponSpeeds_t ZT_weaponSpeeds;
int ZT_weaponSpeed_init = 0;

void ZT_SetWeaponSpeedDefault( void )
{
	ZT_weaponSpeeds.ZT_ALEVEL0_SPEED = 0.0;
	ZT_weaponSpeeds.ZT_ALEVEL1_SPEED = 0.0;
	ZT_weaponSpeeds.ZT_ALEVEL1_UPG_SPEED = 0.0;
	ZT_weaponSpeeds.ZT_ALEVEL2_UPG_SPEED = 0.0;
	ZT_weaponSpeeds.ZT_ALEVEL2_SPEED = 0.0;
	ZT_weaponSpeeds.ZT_ALEVEL2_UPG_SPEED = 0.0;
	ZT_weaponSpeeds.ZT_ALEVEL3_SPEED = 0.0;
	ZT_weaponSpeeds.ZT_ALEVEL3_UPG_SPEED = 0.0;
	ZT_weaponSpeeds.ZT_ALEVEL4_SPEED = 0.0;
	ZT_weaponSpeeds.ZT_BLASTER_SPEED = 1400.0;
	ZT_weaponSpeeds.ZT_RIFLE_SPEED = 0.0;
	ZT_weaponSpeeds.ZT_PAINSAW_SPEED = 0.0;
	ZT_weaponSpeeds.ZT_GRENADE_SPEED = -1.0;
	ZT_weaponSpeeds.ZT_SHOTGUN_SPEED = 0.0;
	ZT_weaponSpeeds.ZT_LASGUN_SPEED = 0.0;
	ZT_weaponSpeeds.ZT_MDRIVER_SPEED = 0.0;
	ZT_weaponSpeeds.ZT_CHAINGUN_SPEED = 0.0;
	ZT_weaponSpeeds.ZT_PRIFLE_SPEED = 1200.0;
	ZT_weaponSpeeds.ZT_FLAMER_SPEED = 300.0;
	ZT_weaponSpeeds.ZT_LCANNON_SPEED = 700.0;
}

float ZT_GetWeaponSpeed( weapon_t wp)
{
	if (!ZT_weaponSpeed_init)
	{
		ZT_SetWeaponSpeedDefault();
		ZT_weaponSpeed_init = 1;
	}
	switch( wp )
	{
	/*alien weapons*/
	case WP_ALEVEL0:
		return ZT_weaponSpeeds.ZT_ALEVEL0_SPEED;
	case WP_ALEVEL1:
		return ZT_weaponSpeeds.ZT_ALEVEL1_SPEED;
	case WP_ALEVEL1_UPG:
		return ZT_weaponSpeeds.ZT_ALEVEL1_UPG_SPEED;
	case WP_ALEVEL2:
		return ZT_weaponSpeeds.ZT_ALEVEL2_SPEED;
	case WP_ALEVEL2_UPG:
		return ZT_weaponSpeeds.ZT_ALEVEL2_UPG_SPEED;
	case WP_ALEVEL3:
		return ZT_weaponSpeeds.ZT_ALEVEL3_SPEED;
	case WP_ALEVEL3_UPG:
		return ZT_weaponSpeeds.ZT_ALEVEL3_UPG_SPEED;
	case WP_ALEVEL4:
		return ZT_weaponSpeeds.ZT_ALEVEL4_SPEED;
	/*human weapons*/
	case WP_BLASTER:
		return ZT_weaponSpeeds.ZT_BLASTER_SPEED;
	case WP_MACHINEGUN:
		return ZT_weaponSpeeds.ZT_RIFLE_SPEED;
	case WP_PAIN_SAW:
		return ZT_weaponSpeeds.ZT_PAINSAW_SPEED;
	case WP_SHOTGUN:
		return ZT_weaponSpeeds.ZT_SHOTGUN_SPEED;
	case WP_LAS_GUN:
		return ZT_weaponSpeeds.ZT_LASGUN_SPEED;
	case WP_MASS_DRIVER:
		return ZT_weaponSpeeds.ZT_MDRIVER_SPEED;
	case WP_CHAINGUN:
		return ZT_weaponSpeeds.ZT_CHAINGUN_SPEED;
	case WP_PULSE_RIFLE:
		return ZT_weaponSpeeds.ZT_PRIFLE_SPEED;
	case WP_FLAMER:
		return ZT_weaponSpeeds.ZT_FLAMER_SPEED;
	case WP_LUCIFER_CANNON:
		return ZT_weaponSpeeds.ZT_LCANNON_SPEED;
	case WP_GRENADE:
		return ZT_weaponSpeeds.ZT_GRENADE_SPEED;
	case WP_ABUILD:
	case WP_ABUILD2:
	case WP_HBUILD:
		return -1.0;//tells use that this weapon should not be used
	default:
		return -1.0;
	}
}
