data
export ZT_TriggerSnap
align 4
LABELV ZT_TriggerSnap
byte 4 -1
export ZT_TriggerAttack
code
proc ZT_TriggerAttack 132 28
ADDRGP4 cg+36
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2
NEI4 $118
ADDRGP4 cg+36
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 26
NEI4 $121
ADDRGP4 $117
JUMPV
LABELV $121
ADDRGP4 ZT_Triggerbot_DisableFastGuns+12
INDIRI4
CNSTI4 1
NEI4 $124
ADDRGP4 cg+36
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 10
NEI4 $127
ADDRGP4 $117
JUMPV
LABELV $127
ADDRGP4 cg+36
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 26
NEI4 $130
ADDRGP4 $117
JUMPV
LABELV $130
ADDRGP4 cg+36
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 13
NEI4 $133
ADDRGP4 $117
JUMPV
LABELV $133
ADDRGP4 cg+36
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 15
NEI4 $136
ADDRGP4 $117
JUMPV
LABELV $136
ADDRGP4 cg+36
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 16
NEI4 $139
ADDRGP4 $117
JUMPV
LABELV $139
ADDRGP4 cg+36
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 11
NEI4 $142
ADDRGP4 $117
JUMPV
LABELV $142
ADDRGP4 cg+36
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 17
NEI4 $145
ADDRGP4 $117
JUMPV
LABELV $145
ADDRGP4 cg+36
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 18
NEI4 $148
ADDRGP4 ZT_Triggerbot_Cannnon+12
INDIRI4
CNSTI4 1
NEI4 $119
ADDRGP4 ZT_Triggerbot_Cannon_ShortRangeOnly+12
INDIRI4
CNSTI4 0
EQI4 $154
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRLP4 108
ADDRGP4 ZT_AttackDistance
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 108
INDIRI4
ASGNI4
ADDRLP4 20
ADDRGP4 cg+128116+24
INDIRB
ASGNB 12
ADDRLP4 112
ADDRLP4 4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 32
ADDRLP4 20
INDIRF4
ADDRGP4 cg+128116+36
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 20+4
INDIRF4
ADDRGP4 cg+128116+36+4
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32+8
ADDRLP4 20+8
INDIRF4
ADDRGP4 cg+128116+36+8
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRLP4 44
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 116
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
CNSTI4 301989889
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
ADDRLP4 0
CNSTI4 17888
ADDRLP4 44+52
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
ADDRLP4 120
CNSTF4 0
ASGNF4
ADDRLP4 8+8
ADDRLP4 120
INDIRF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 120
INDIRF4
ASGNF4
ADDRLP4 8
ADDRLP4 120
INDIRF4
ASGNF4
ADDRLP4 124
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 124
INDIRP4
CNSTI4 1564
ADDP4
INDIRF4
ADDRGP4 cg+128116+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 124
INDIRP4
CNSTI4 1568
ADDP4
INDIRF4
ADDRGP4 cg+128116+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 0
INDIRP4
CNSTI4 1572
ADDP4
INDIRF4
ADDRGP4 cg+128116+24+8
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8
ARGP4
ADDRLP4 128
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 104
ADDRLP4 128
INDIRF4
ASGNF4
ADDRGP4 ZT_Triggerbot_Cannon_ShortRangeOnly+12
INDIRI4
CVIF4 4
ADDRLP4 104
INDIRF4
GTF4 $119
ADDRGP4 $188
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $119
JUMPV
LABELV $154
ADDRGP4 $188
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $119
JUMPV
LABELV $148
ADDRGP4 cg+36
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 23
NEI4 $189
ADDRGP4 $117
JUMPV
LABELV $189
ADDRGP4 $192
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $188
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $119
JUMPV
LABELV $124
ADDRGP4 $192
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $188
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $119
JUMPV
LABELV $118
ADDRGP4 cg+36
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 1
NEI4 $193
ADDRGP4 cg+36
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 1
NEI4 $196
ADDRGP4 $117
JUMPV
LABELV $196
ADDRGP4 cg+36
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 2
NEI4 $199
ADDRGP4 ZT_Triggerbot_GrangerSpit+12
INDIRI4
CNSTI4 1
NEI4 $202
ADDRGP4 $205
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $206
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $200
JUMPV
LABELV $202
ADDRGP4 ZT_Triggerbot_GrangerClaw+12
INDIRI4
CNSTI4 1
NEI4 $117
ADDRGP4 $210
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $211
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $200
JUMPV
LABELV $199
ADDRGP4 cg+36
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 7
NEI4 $212
ADDRGP4 ZT_Triggerbot_MaraLightning+12
INDIRI4
CNSTI4 1
NEI4 $215
ADDRGP4 $218
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $219
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $213
JUMPV
LABELV $215
ADDRGP4 ZT_Triggerbot_MaraSpit+12
INDIRI4
CNSTI4 1
NEI4 $220
ADDRGP4 $205
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $206
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $213
JUMPV
LABELV $220
ADDRGP4 $192
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $188
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $213
JUMPV
LABELV $212
ADDRGP4 $192
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $188
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
LABELV $213
LABELV $200
LABELV $193
LABELV $119
LABELV $117
endproc ZT_TriggerAttack 132 28
export ZT_Triggerbot
proc ZT_Triggerbot 124 28
ADDRLP4 16
CNSTP4 0
ASGNP4
ADDRLP4 108
ADDRGP4 ZT_AttackDistance
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 108
INDIRI4
ADDRGP4 ZT_Triggerbot_Distance+12
INDIRI4
ADDI4
ASGNI4
ADDRLP4 40
CNSTI4 -1
ASGNI4
ADDRLP4 36
CNSTI4 -1
ASGNI4
ADDRLP4 32
CNSTI4 -1
ASGNI4
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $225
ADDRGP4 $223
JUMPV
LABELV $225
ADDRGP4 ZT_TriggerSnap
INDIRI4
ADDRGP4 cg+28
INDIRI4
LTI4 $228
ADDRGP4 $223
JUMPV
LABELV $228
ADDRGP4 ZT_TriggerSnap
ADDRGP4 cg+28
INDIRI4
ASGNI4
ADDRGP4 ZT_Triggerbot_Mode+12
INDIRI4
CNSTI4 1
EQI4 $232
ADDRGP4 $223
JUMPV
LABELV $232
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $235
ADDRGP4 $223
JUMPV
LABELV $235
ADDRGP4 cg+36
INDIRP4
CNSTI4 312
ADDP4
INDIRI4
CNSTI4 0
EQI4 $237
ADDRGP4 $223
JUMPV
LABELV $237
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $240
ADDRGP4 $223
JUMPV
LABELV $240
ADDRLP4 0
ADDRGP4 cg+128116+24
INDIRB
ASGNB 12
ADDRLP4 112
ADDRLP4 12
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 20
ADDRLP4 0
INDIRF4
ADDRGP4 cg+128116+36
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+128116+36+4
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+128116+36+8
INDIRF4
ADDRLP4 12
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRLP4 44
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 116
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
CNSTI4 301989889
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
ADDRLP4 16
CNSTI4 17888
ADDRLP4 44+52
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 12
NEI4 $259
ADDRGP4 $261
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
ADDRGP4 $223
JUMPV
LABELV $259
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $262
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 1
NEI4 $264
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 $263
JUMPV
LABELV $264
ADDRLP4 16
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 2
NEI4 $263
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $263
JUMPV
LABELV $262
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $268
ADDRLP4 120
CNSTI4 1
ASGNI4
ADDRLP4 40
ADDRLP4 120
INDIRI4
ASGNI4
ADDRLP4 104
ADDRLP4 16
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
ADDRLP4 104
INDIRI4
ADDRLP4 120
INDIRI4
NEI4 $270
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 $271
JUMPV
LABELV $270
ADDRLP4 104
INDIRI4
CNSTI4 2
NEI4 $272
ADDRLP4 36
CNSTI4 1
ASGNI4
LABELV $272
LABELV $271
LABELV $268
LABELV $263
ADDRGP4 ZT_Triggerbot_Team+12
INDIRI4
CNSTI4 0
NEI4 $274
ADDRGP4 cg+36
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 1
NEI4 $277
ADDRLP4 32
CNSTI4 1
ASGNI4
LABELV $277
ADDRGP4 cg+36
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2
NEI4 $275
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $275
JUMPV
LABELV $274
ADDRGP4 ZT_Triggerbot_Team+12
INDIRI4
CNSTI4 1
NEI4 $283
ADDRLP4 32
CNSTI4 1
ASGNI4
LABELV $283
ADDRGP4 ZT_Triggerbot_Team+12
INDIRI4
CNSTI4 2
NEI4 $286
ADDRLP4 32
CNSTI4 0
ASGNI4
LABELV $286
LABELV $275
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $223
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $291
ADDRGP4 ZT_Triggerbot_Structures+12
INDIRI4
CNSTI4 1
NEI4 $291
ADDRGP4 ZT_TriggerAttack
CALLV
pop
ADDRGP4 $290
JUMPV
LABELV $291
ADDRLP4 120
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRI4
ADDRLP4 120
INDIRI4
NEI4 $294
ADDRGP4 ZT_Triggerbot_Structures+12
INDIRI4
ADDRLP4 120
INDIRI4
NEI4 $294
ADDRGP4 $223
JUMPV
LABELV $294
ADDRLP4 40
INDIRI4
CNSTI4 1
NEI4 $290
ADDRGP4 ZT_TriggerAttack
CALLV
pop
LABELV $290
LABELV $223
endproc ZT_Triggerbot 124 28
import trap_ZTAimbutton
import trap_ZTMoveAim
import ZT_ToLeet
import ZT_GrangerAutoEvo
import ZT_lookForArmory
import ZT_WarnDC
import ZT_NadeWarn
import ZT_WallHack
import NewTarget
import ZT_GetTarget
import ZT_Targ
import ZT_DrawScanner
import ZT_RenderMissile
import ZT_RenderBuildable
import ZT_RenderPlayer
import ZT_ESP
import VectorAngles
import ZT_CheckFov
import ZT_CheckVisible
import ZT_AttackDistance
import ZT_GetWeaponSpeed
import ZT_SetWeaponSpeedDefault
import ZT_AimAt
import GetPlayerLoc
import Findloc
import ZT_Command
import ZT_SeeGrenade
import ZT_PlayerGlowHack
import ZT_TargetGlow
import ZT_RtdCheck
import ZT_RTDChangeState
import ZT_ClickBot
import ZT_ClickCheck
import ZT_Aimbot
import ZT_PredictTarget
import ZT_Extrapolation
import ZT_DoAimbot
import CG_BuildableStatusDisplay
import entityPositions
import trap_GetDemoName
import trap_GetDemoPos
import trap_GetDemoState
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_RealTime
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetOverstrikeMode
import trap_Key_SetOverstrikeMode
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddAdditiveLightToScene
import trap_R_AddLightToScene
import trap_R_inPVS
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBiSphereTrace
import trap_CM_BiSphereTrace
import trap_CM_TransformedCapsuleTrace
import trap_CM_CapsuleTrace
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_GetFileList
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_LiteralArgs
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_TutorialText
import CG_WritePTRCode
import CG_ReadPTRCode
import CG_DestroyTestTS_f
import CG_TestTS_f
import CG_AddTrails
import CG_IsTrailSystemValid
import CG_DestroyTrailSystem
import CG_SpawnNewTrailSystem
import CG_RegisterTrailSystem
import CG_LoadTrailSystems
import CG_DestroyTestPS_f
import CG_TestPS_f
import CG_ParticleSystemEntity
import CG_AddParticles
import CG_SetParticleSystemNormal
import CG_IsParticleSystemValid
import CG_IsParticleSystemInfinite
import CG_DestroyParticleSystem
import CG_SpawnNewParticleSystem
import CG_RegisterParticleSystem
import CG_LoadParticleSystems
import CG_SetAttachmentOffset
import CG_SetAttachmentParticle
import CG_SetAttachmentTag
import CG_SetAttachmentCent
import CG_SetAttachmentPoint
import CG_AttachToParticle
import CG_AttachToTag
import CG_AttachToCent
import CG_AttachToPoint
import CG_Attached
import CG_AttachmentCentNum
import CG_AttachmentVelocity
import CG_AttachmentAxis
import CG_AttachmentDir
import CG_AttachmentPoint
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_ShaderStateChanged
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_RequestScores
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_ProcessSnapshots
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_AlienSense
import CG_Scanner
import CG_UpdateEntityPositions
import CG_DrawItemSelectText
import CG_DrawItemSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_ShotgunFire
import CG_Bullet
import CG_MissileHitEntity
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterWeapon
import CG_InitWeapons
import CG_RegisterUpgrade
import CG_InitUpgrades
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_DrawBoundingBox
import CG_PainEvent
import CG_EntityEvent
import CG_CheckEvents
import CG_PredictPlayerState
import CG_BiSphereTrace
import CG_CapTrace
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_ModelDoor
import CG_AnimMapObj
import CG_RunLerpFrame
import CG_AlienBuildableExplosion
import CG_HumanBuildableExplosion
import CG_InitBuildables
import CG_DrawBuildableStatus
import CG_BuildableStatusParse
import CG_Buildable
import CG_GhostBuildable
import CG_GetPlayerLocation
import CG_Bleed
import CG_PlayerDisconnect
import CG_CustomSound
import CG_PrecacheClientInfo
import CG_NewClientInfo
import CG_ResetPlayerEntity
import CG_Corpse
import CG_Player
import CG_DrawField
import CG_ResetPainBlend
import CG_UpdateMediaFraction
import CG_DrawLoadingScreen
import CG_Text_PaintChar
import CG_GetKillerText
import CG_GetTeamColor
import CG_SetPrintString
import CG_RunMenuScript
import CG_GetValue
import CG_OwnerDraw
import CG_DrawActive
import CG_CenterPrint
import CG_AddSpeed
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import CG_GetColorCharForHealth
import CG_KeyBinding
import CG_WorldToScreen
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import CG_ColorForHealth
import CG_TileClear
import CG_FadeColor
import CG_DrawStrlen
import CG_ClearClipRegion
import CG_SetClipRegion
import CG_DrawFadePic
import CG_DrawPic
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawPlane
import CG_OffsetShoulderView
import CG_OffsetThirdPersonView
import CG_OffsetFirstPersonView
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_addSmoothOp
import CG_AddNotifyText
import CG_RemoveNotifyLine
import CG_FileExists
import CG_BuildSpectatorString
import CG_ClientIsReady
import CG_SetScoreSelection
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_PlayerCount
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import ZT_Weapons_BuyAmmo
import ZT_Weapons_AutoGrangerEvo
import ZT_Aimbot_CutOff
import ZT_Aimbot_WeaponSpeed
import ZT_Aimbot_PingPredict
import ZT_Aimbot_Unlagged
import ZT_Aimbot_ThroughWalls
import ZT_Aimbot_FieldOfView
import ZT_Aimbot_Team
import ZT_Aimbot_AutoAim
import ZT_Aimbot_Mode
import ZT_ESP_PainGlow_Mode
import ZT_ESP_AdvGlow_Mode
import ZT_ESP_ClassInfo_Mode
import ZT_ESP_NadeInfo_Mode
import ZT_ESP_Display_Y
import ZT_ESP_Display_X
import ZT_ESP_Display_Mode
import ZT_ESP_BuildHealth_Mode
import ZT_ESP_PlayerInfo_Mode
import ZT_ESP_Mode
import ZT_Triggerbot_Distance
import ZT_Triggerbot_MaraSpit
import ZT_Triggerbot_Cannon_ShortRangeOnly
import ZT_Triggerbot_Cannnon
import ZT_Triggerbot_MaraLightning
import ZT_Triggerbot_GrangerClaw
import ZT_Triggerbot_GrangerSpit
import ZT_Triggerbot_DisableFastGuns
import ZT_Triggerbot_Structures
import ZT_Triggerbot_Team
import ZT_Triggerbot_Mode
import ZT_Chamming_GlowGren
import ZT_Chamming_DiffGlow
import ZT_Chamming_Glow
import ZT_Scanner_Range
import ZT_Scanner_Y
import ZT_Scanner_X
import ZT_Scanner_Height
import ZT_Scanner_Width
import ZT_Scanner_Mode
import ZT_Warn_Nades
import ZT_Warn_DC
import ZT_Warn_Mode
import ZT_Walls_Mode
import cg_chatTeamPrefix
import cg_emoticons
import cg_voice
import cg_projectileNudge
import cg_optimizePrediction
import cg_debugRandom
import ui_humanTeamVoteActive
import ui_alienTeamVoteActive
import ui_voteActive
import ui_dialog
import ui_stages
import ui_carriage
import ui_currentClass
import cg_debugVoices
import cg_unlagged
import cg_sprintToggle
import cg_stickySpec
import cg_painBlendZoom
import cg_painBlendScale
import cg_painBlendMax
import cg_painBlendDownRate
import cg_painBlendUpRate
import cg_tutorial
import cg_disableScannerPlane
import cg_disableCommandDialogs
import cg_disableBuildDialogs
import cg_disableUpgradeDialogs
import cg_disableWarningDialogs
import cg_debugPVS
import cg_debugTrails
import cg_debugParticles
import cg_lightFlare
import cg_consoleLatency
import cg_bounceParticles
import cg_depthSortParticles
import cg_disableBlueprintErrors
import cg_wwSmoothTime
import cg_drawBBOX
import cg_drawSurfNormal
import cg_noTaunt
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraMode
import pmove_msec
import pmove_fixed
import cg_smoothClients
import cg_hudFiles
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_blood
import cg_paused
import cg_stats
import cg_synchronousClients
import cg_drawSpeed
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPersonRange
import cg_thirdPersonPitchFollow
import cg_staticDeathCam
import cg_thirdPersonShoulderViewMode
import cg_thirdPersonAngle
import cg_thirdPerson
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_drawGun
import cg_viewsize
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_debugMove
import cg_nopredict
import cg_errorDecay
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_teamOverlayUserinfo
import cg_teamOverlayMaxPlayers
import cg_teamOverlaySortMode
import cg_drawTeamOverlay
import cg_crosshairSize
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawChargeBar
import cg_drawSnapshot
import cg_drawDemoState
import cg_drawFPS
import cg_drawClock
import cg_drawTimer
import cg_shadows
import cg_swingSpeed
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_teslaTrailTime
import cg_markPolys
import cg_buildables
import cg_upgrades
import cg_weapons
import cgDC
import cg_entities
import cg
import cgs
import g_nameBind2
import g_nameBind1
import BindingFromName
import trap_Parse_SourceFileAndLine
import trap_Parse_ReadToken
import trap_Parse_FreeSource
import trap_Parse_LoadSource
import trap_Parse_AddGlobalDefine
import UI_EscapeEmoticons
import UI_Text_IsEmoticon
import UI_Text_EmHeight
import UI_Text_EmWidth
import UI_Text_Height
import UI_Text_Width
import UI_Text_Paint_Limit
import UI_Text_Paint
import UI_DrawTextBlock
import Item_Text_Wrap
import Item_Text_Wrapped_Paint
import trap_R_SetClipRegion
import Controls_SetDefaults
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Alloc
import UI_RemoveCaptureFunc
import UI_InstallCaptureFunc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menu_Update
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_FindByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_ReplaceActive
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ReplaceActiveByName
import Menus_ActivateByName
import Menu_PaintAll
import Menu_UpdateAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
import cmdcmp
import BG_TeamName
import BG_LoadEmoticons
import BG_VoiceTrackFind
import BG_VoiceTrackByNum
import BG_VoiceCmdByNum
import BG_VoiceCmdFind
import BG_VoiceByName
import BG_PrintVoices
import BG_VoiceInit
import BG_PrimaryWeapon
import BG_BuildableIsAllowed
import BG_ClassIsAllowed
import BG_UpgradeIsAllowed
import BG_WeaponIsAllowed
import BG_InitAllowedGameElements
import BG_ParseCSVBuildableList
import BG_ParseCSVClassList
import BG_ParseCSVEquipmentList
import atoi_neg
import atof_neg
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_MemoryInfo
import BG_DefragmentMemory
import BG_Free
import BG_InitMemory
import BG_Alloc
import BG_UpgradeAllowedInStage
import BG_Upgrade
import BG_UpgradeByName
import BG_WeaponAllowedInStage
import BG_Weapon
import BG_WeaponByName
import BG_InitClassConfigs
import BG_AlienCanEvolve
import BG_ClassCanEvolveFromTo
import BG_ClassHasAbility
import BG_ClassBoundingBox
import BG_ClassConfig
import BG_ClassAllowedInStage
import BG_Class
import BG_ClassByName
import BG_InitBuildableConfigs
import BG_BuildableBoundingBox
import BG_BuildableConfig
import BG_BuildableAllowedInStage
import BG_Buildable
import BG_BuildableByEntityName
import BG_BuildableByName
import BG_UnpackEntityNumbers
import BG_PackEntityNumbers
import BG_HasEnergyWeapon
import BG_GetPlayerWeapon
import BG_PlayerPoisonCloudTime
import BG_PlayerCanChangeWeapon
import BG_GetValueOfPlayer
import BG_PositionBuildableRelativeToPlayer
import BG_GetClientViewOrigin
import BG_GetClientNormal
import BG_RotateAxis
import BG_UpgradeIsActive
import BG_DeactivateUpgrade
import BG_ActivateUpgrade
import BG_InventoryContainsUpgrade
import BG_RemoveUpgradeFromInventory
import BG_AddUpgradeToInventory
import BG_SlotsForInventory
import BG_InventoryContainsWeapon
import BG_WeaponIsFull
import BG_EventName
import Pmove
import PM_UpdateViewAngles
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import Com_TruncateLongString
import va
import Q_CountChar
import Q_ParseNewlines
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_stristr
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isintegral
import Q_isanumber
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_ClientListParse
import Com_ClientListString
import Com_ClientListRemove
import Com_ClientListAdd
import Com_ClientListContains
import Com_RandomBytes
import Com_SkipCharset
import Com_SkipTokens
import Com_sprintf
import Com_HexStrToInt
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_GetExtension
import COM_SkipPath
import Com_Clamp
import DistanceBetweenLineSegments
import DistanceBetweenLineSegmentsSquared
import VectorMaxComponent
import VectorMinComponent
import pointToLineDistance
import VectorDistance
import ProjectPointOntoVector
import GetPerpendicularViewVector
import Q_isnan
import PerpendicularVector
import AngleVectors
import VectorMatrixMultiply
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoundsIntersectPoint
import BoundsIntersectSphere
import BoundsIntersect
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AxisToAngles
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import Q_StripIndentMarker
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Hunk_Alloc
import FloatSwap
import LongSwap
import ShortSwap
import rint
import pow
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import Q_snprintf
import Q_vsnprintf
import strtol
import _atoi
import atoi
import strtod
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strrchr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import bsearch
import rand
import srand
import qsort
lit
align 1
LABELV $261
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 102
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $219
byte 1 45
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 53
byte 1 59
byte 1 0
align 1
LABELV $218
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 53
byte 1 59
byte 1 0
align 1
LABELV $211
byte 1 45
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 51
byte 1 59
byte 1 0
align 1
LABELV $210
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 51
byte 1 59
byte 1 0
align 1
LABELV $206
byte 1 45
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 50
byte 1 59
byte 1 0
align 1
LABELV $205
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 50
byte 1 59
byte 1 0
align 1
LABELV $192
byte 1 43
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 59
byte 1 0
align 1
LABELV $188
byte 1 45
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 59
byte 1 0