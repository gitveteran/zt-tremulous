export Svcmd_EntityList_f
code
proc Svcmd_EntityList_f 16 8
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $82
JUMPV
LABELV $79
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $84
ADDRGP4 $80
JUMPV
LABELV $84
ADDRGP4 $86
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $87
ADDRLP4 8
INDIRI4
CNSTI4 19
GTI4 $87
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $131
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $131
address $90
address $92
address $94
address $96
address $98
address $100
address $102
address $104
address $106
address $108
address $110
address $112
address $114
address $116
address $118
address $120
address $122
address $124
address $126
address $128
code
LABELV $90
ADDRGP4 $91
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $92
ADDRGP4 $93
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $94
ADDRGP4 $95
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $96
ADDRGP4 $97
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $98
ADDRGP4 $99
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $100
ADDRGP4 $101
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $102
ADDRGP4 $103
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $104
ADDRGP4 $105
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $106
ADDRGP4 $107
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $108
ADDRGP4 $109
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $110
ADDRGP4 $111
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $112
ADDRGP4 $113
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $114
ADDRGP4 $115
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $116
ADDRGP4 $117
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $118
ADDRGP4 $119
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $120
ADDRGP4 $121
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $122
ADDRGP4 $123
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $124
ADDRGP4 $125
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $126
ADDRGP4 $127
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $128
ADDRGP4 $129
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $87
ADDRGP4 $130
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
LABELV $88
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $132
ADDRGP4 $134
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $132
ADDRGP4 $135
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $80
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1568
ADDP4
ASGNP4
LABELV $82
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $79
LABELV $78
endproc Svcmd_EntityList_f 16 8
proc ClientForString 1032 12
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1028
ADDRGP4 G_ClientNumberFromString
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1028
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $137
ADDRGP4 $134
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $136
JUMPV
LABELV $137
CNSTI4 2540
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
RETP4
LABELV $136
endproc ClientForString 1032 12
proc Svcmd_Status_f 1040 12
ADDRGP4 $140
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $141
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $142
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
NEI4 $147
ADDRGP4 $143
JUMPV
LABELV $147
ADDRGP4 $149
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $150
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 1
NEI4 $151
ADDRGP4 $153
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $152
JUMPV
LABELV $151
ADDRGP4 $149
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 404
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
LABELV $152
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
ADDRLP4 8
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 1032
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $154
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRLP4 8
ARGP4
ADDRGP4 $157
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $156
ARGP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $158
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $143
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2540
ADDP4
ASGNP4
LABELV $145
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $142
LABELV $139
endproc Svcmd_Status_f 1040 12
proc Svcmd_ForceTeam_f 1044 12
ADDRLP4 1032
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 3
EQI4 $160
ADDRGP4 $162
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $159
JUMPV
LABELV $160
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
ADDRLP4 0
ARGP4
ADDRLP4 1036
ADDRGP4 ClientForString
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1036
INDIRP4
ASGNP4
ADDRLP4 1024
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $163
ADDRGP4 $159
JUMPV
LABELV $163
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
ADDRLP4 0
ARGP4
ADDRLP4 1040
ADDRGP4 G_TeamFromString
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1040
INDIRI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 3
NEI4 $165
ADDRGP4 $167
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $159
JUMPV
LABELV $165
CNSTI4 1568
ADDRLP4 1024
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2540
DIVI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_ChangeTeam
CALLV
pop
LABELV $159
endproc Svcmd_ForceTeam_f 1044 12
proc Svcmd_LayoutSave_f 156 12
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 132
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
EQI4 $169
ADDRGP4 $171
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $168
JUMPV
LABELV $169
CNSTI4 1
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
ADDRLP4 0
ADDRLP4 68
ASGNP4
ADDRGP4 $173
JUMPV
LABELV $172
ADDRLP4 136
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 65
LTI4 $178
ADDRLP4 136
INDIRI4
CNSTI4 90
LEI4 $181
LABELV $178
ADDRLP4 140
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 97
LTI4 $179
ADDRLP4 140
INDIRI4
CNSTI4 122
LEI4 $181
LABELV $179
ADDRLP4 144
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 48
LTI4 $180
ADDRLP4 144
INDIRI4
CNSTI4 57
LEI4 $181
LABELV $180
ADDRLP4 148
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 45
EQI4 $181
ADDRLP4 148
INDIRI4
CNSTI4 95
NEI4 $175
LABELV $181
ADDRLP4 152
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 64
ADDRLP4 152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 152
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 64
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
LABELV $175
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $173
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $182
ADDRLP4 64
INDIRI4
CVIU4 4
CNSTU4 59
LTU4 $172
LABELV $182
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $183
ADDRGP4 $185
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $168
JUMPV
LABELV $183
ADDRLP4 4
ARGP4
ADDRGP4 G_LayoutSave
CALLV
pop
LABELV $168
endproc Svcmd_LayoutSave_f 156 12
proc Svcmd_LayoutLoad_f 268 12
ADDRLP4 260
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 2
GEI4 $187
ADDRGP4 $189
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $186
JUMPV
LABELV $187
CNSTI4 1
ARGI4
ADDRLP4 264
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 256
ADDRLP4 264
INDIRP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 256
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $190
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
CNSTI4 2
ARGI4
ADDRGP4 $191
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 level+68
CNSTI4 1
ASGNI4
LABELV $186
endproc Svcmd_LayoutLoad_f 268 12
proc Svcmd_AdmitDefeat_f 16 12
ADDRLP4 8
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
EQI4 $194
ADDRGP4 $196
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $193
JUMPV
LABELV $194
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 G_TeamFromString
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $197
CNSTI4 1
ARGI4
ADDRGP4 $199
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
CNSTI4 -1
ARGI4
ADDRGP4 $200
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
ADDRGP4 $198
JUMPV
LABELV $197
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $201
CNSTI4 2
ARGI4
ADDRGP4 $203
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
CNSTI4 -1
ARGI4
ADDRGP4 $204
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
ADDRGP4 $202
JUMPV
LABELV $201
ADDRGP4 $205
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $193
JUMPV
LABELV $202
LABELV $198
ADDRGP4 level+16116
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_BaseSelfDestruct
CALLV
pop
LABELV $193
endproc Svcmd_AdmitDefeat_f 16 12
proc Svcmd_TeamWin_f 20 12
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
ADDRLP4 0
ARGP4
ADDRLP4 12
ADDRGP4 G_TeamFromString
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $211
ADDRLP4 8
INDIRI4
CNSTI4 2
EQI4 $212
ADDRGP4 $207
JUMPV
LABELV $211
CNSTI4 2
ARGI4
ADDRGP4 G_BaseSelfDestruct
CALLV
pop
ADDRGP4 $209
JUMPV
LABELV $212
CNSTI4 1
ARGI4
ADDRGP4 G_BaseSelfDestruct
CALLV
pop
LABELV $209
LABELV $207
endproc Svcmd_TeamWin_f 20 12
proc Svcmd_Evacuation_f 0 8
CNSTI4 -1
ARGI4
ADDRGP4 $214
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
ADDRGP4 level+15428
CNSTI4 0
ASGNI4
CNSTI4 24
ARGI4
ADDRGP4 $216
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
ADDRGP4 $217
ARGP4
ADDRGP4 LogExit
CALLV
pop
LABELV $213
endproc Svcmd_Evacuation_f 0 8
proc Svcmd_MapRotation_f 76 20
ADDRLP4 64
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 2
EQI4 $219
ADDRGP4 $221
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $218
JUMPV
LABELV $219
ADDRGP4 G_ClearRotationStack
CALLV
pop
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
ADDRLP4 0
ARGP4
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 68
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 G_StartMapRotation
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $222
ADDRGP4 $224
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $222
LABELV $218
endproc Svcmd_MapRotation_f 76 20
proc Svcmd_TeamMessage_f 28 12
ADDRLP4 8
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 3
GEI4 $226
ADDRGP4 $228
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $225
JUMPV
LABELV $226
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
ADDRLP4 0
ARGP4
ADDRLP4 12
ADDRGP4 G_TeamFromString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $229
ADDRGP4 $231
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $225
JUMPV
LABELV $229
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $232
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
CNSTI4 2
ARGI4
ADDRLP4 24
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $233
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
LABELV $225
endproc Svcmd_TeamMessage_f 28 12
proc Svcmd_CenterPrint_f 12 8
ADDRLP4 0
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
GEI4 $235
ADDRGP4 $237
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $234
JUMPV
LABELV $235
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $238
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $234
endproc Svcmd_CenterPrint_f 12 8
proc Svcmd_EjectClient_f 1048 12
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
GEI4 $240
ADDRGP4 $242
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $239
JUMPV
LABELV $240
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
CNSTI4 2
ARGI4
ADDRLP4 1032
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1032
INDIRP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 -1
NEI4 $243
ADDRLP4 1040
CNSTI4 0
ASGNI4
ADDRGP4 $248
JUMPV
LABELV $245
CNSTI4 2540
ADDRLP4 1040
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
NEI4 $250
ADDRGP4 $246
JUMPV
LABELV $250
CNSTI4 2540
ADDRLP4 1040
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 0
EQI4 $252
ADDRGP4 $246
JUMPV
LABELV $252
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
LABELV $246
ADDRLP4 1040
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $248
ADDRLP4 1040
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $245
ADDRGP4 $244
JUMPV
LABELV $243
ADDRLP4 4
ARGP4
ADDRLP4 1044
ADDRGP4 ClientForString
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1044
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $254
ADDRGP4 $239
JUMPV
LABELV $254
ADDRLP4 1040
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 0
EQI4 $256
ADDRGP4 $258
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $239
JUMPV
LABELV $256
ADDRLP4 1040
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2540
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
LABELV $244
LABELV $239
endproc Svcmd_EjectClient_f 1048 12
proc Svcmd_DumpUser_f 18448 12
ADDRLP4 18440
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 18440
INDIRI4
CNSTI4 2
EQI4 $260
ADDRGP4 $262
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $259
JUMPV
LABELV $260
CNSTI4 1
ARGI4
ADDRLP4 16388
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
ADDRLP4 16388
ARGP4
ADDRLP4 18444
ADDRGP4 ClientForString
CALLP4
ASGNP4
ADDRLP4 18436
ADDRLP4 18444
INDIRP4
ASGNP4
ADDRLP4 18436
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $263
ADDRGP4 $259
JUMPV
LABELV $263
ADDRLP4 18436
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2540
DIVI4
ARGI4
ADDRLP4 17412
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
ADDRLP4 0
ADDRLP4 17412
ASGNP4
ADDRGP4 $265
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $267
JUMPV
LABELV $266
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8196
ARGP4
ADDRGP4 Info_NextPair
CALLV
pop
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $269
ADDRGP4 $259
JUMPV
LABELV $269
ADDRGP4 $271
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8196
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $267
ADDRGP4 $266
JUMPV
LABELV $259
endproc Svcmd_DumpUser_f 18448 12
proc Svcmd_Pr_f 28 12
ADDRLP4 8
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 3
GEI4 $273
ADDRGP4 $275
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $272
JUMPV
LABELV $273
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $278
ADDRLP4 0
INDIRI4
CNSTI4 -1
GEI4 $276
LABELV $278
ADDRGP4 $279
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $272
JUMPV
LABELV $276
CNSTI4 2
ARGI4
ADDRLP4 20
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $280
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $272
endproc Svcmd_Pr_f 28 12
proc Svcmd_PrintQueue_f 1040 12
ADDRLP4 1024
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
EQI4 $282
ADDRGP4 $284
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $281
JUMPV
LABELV $282
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 G_TeamFromString
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1032
INDIRI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 1
EQI4 $288
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $290
ADDRGP4 $285
JUMPV
LABELV $288
ADDRGP4 level+15444
ARGP4
ADDRGP4 G_PrintSpawnQueue
CALLV
pop
ADDRGP4 $286
JUMPV
LABELV $290
ADDRGP4 level+15708
ARGP4
ADDRGP4 G_PrintSpawnQueue
CALLV
pop
ADDRGP4 $286
JUMPV
LABELV $285
ADDRGP4 $292
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $286
LABELV $281
endproc Svcmd_PrintQueue_f 1040 12
proc Svcmd_MessageWrapper 32 12
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
ADDRLP4 0
ARGP4
ADDRGP4 $296
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $294
CNSTP4 0
ARGP4
ADDRGP4 Cmd_AdminMessage_f
CALLV
pop
ADDRGP4 $295
JUMPV
LABELV $294
ADDRLP4 0
ARGP4
ADDRGP4 $299
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $297
CNSTP4 0
ARGP4
ADDRGP4 Cmd_PrivateMessage_f
CALLV
pop
ADDRGP4 $298
JUMPV
LABELV $297
ADDRLP4 0
ARGP4
ADDRGP4 $302
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $300
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
ADDRGP4 $301
JUMPV
LABELV $300
ADDRLP4 0
ARGP4
ADDRGP4 $305
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $303
CNSTI4 1
ARGI4
ADDRLP4 28
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
CNSTP4 0
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
LABELV $303
LABELV $301
LABELV $298
LABELV $295
LABELV $293
endproc Svcmd_MessageWrapper 32 12
proc Svcmd_ListMapsWrapper 0 4
CNSTP4 0
ARGP4
ADDRGP4 Cmd_ListMaps_f
CALLV
pop
LABELV $306
endproc Svcmd_ListMapsWrapper 0 4
proc Svcmd_SuddenDeath_f 28 12
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRGP4 level+15432
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 1000
ADDRLP4 0
INDIRI4
MULI4
ADDI4
ASGNI4
ADDRGP4 $311
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $315
ADDRLP4 16
ADDRGP4 $312
ASGNP4
ADDRGP4 $316
JUMPV
LABELV $315
ADDRLP4 16
ADDRGP4 $313
ASGNP4
LABELV $316
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $307
endproc Svcmd_SuddenDeath_f 28 12
proc Svcmd_G_AdvanceMapRotation_f 0 4
CNSTI4 0
ARGI4
ADDRGP4 G_AdvanceMapRotation
CALLV
pop
LABELV $317
endproc Svcmd_G_AdvanceMapRotation_f 0 4
data
export svcmds
align 4
LABELV svcmds
address $296
byte 4 1
address Svcmd_MessageWrapper
address $318
byte 4 0
address Svcmd_AdmitDefeat_f
address $319
byte 4 0
address Svcmd_G_AdvanceMapRotation_f
address $320
byte 4 0
address Svcmd_TeamWin_f
address $305
byte 4 1
address Svcmd_MessageWrapper
address $321
byte 4 1
address Svcmd_CenterPrint_f
address $322
byte 4 0
address Svcmd_DumpUser_f
address $323
byte 4 0
address Svcmd_EjectClient_f
address $324
byte 4 0
address Svcmd_EntityList_f
address $325
byte 4 0
address Svcmd_Evacuation_f
address $326
byte 4 0
address Svcmd_ForceTeam_f
address $327
byte 4 0
address BG_MemoryInfo
address $328
byte 4 0
address Svcmd_TeamWin_f
address $329
byte 4 0
address Svcmd_LayoutLoad_f
address $330
byte 4 0
address Svcmd_LayoutSave_f
address $331
byte 4 1
address Svcmd_ListMapsWrapper
address $332
byte 4 0
address G_LoadCensors
address $299
byte 4 1
address Svcmd_MessageWrapper
address $333
byte 4 0
address Svcmd_MapRotation_f
address $334
byte 4 0
address Svcmd_Pr_f
address $335
byte 4 0
address Svcmd_PrintQueue_f
address $302
byte 4 1
address Svcmd_MessageWrapper
address $336
byte 4 1
address Svcmd_TeamMessage_f
address $337
byte 4 0
address Svcmd_Status_f
address $338
byte 4 0
address G_StopMapRotation
address $339
byte 4 0
address Svcmd_SuddenDeath_f
export ConsoleCommand
code
proc ConsoleCommand 1036 20
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
ADDRLP4 4
ARGP4
ADDRGP4 svcmds
ARGP4
CNSTU4 26
ARGU4
CNSTU4 12
ARGU4
ADDRGP4 cmdcmp
ARGP4
ADDRLP4 1028
ADDRGP4 bsearch
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1028
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $341
CNSTP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 G_admin_cmd_check
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $343
CNSTI4 1
RETI4
ADDRGP4 $340
JUMPV
LABELV $343
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $345
ADDRGP4 $348
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $345
CNSTI4 0
RETI4
ADDRGP4 $340
JUMPV
LABELV $341
ADDRLP4 1032
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 1032
INDIRI4
EQI4 $349
ADDRGP4 g_dedicated+12
INDIRI4
ADDRLP4 1032
INDIRI4
NEI4 $349
CNSTI4 0
RETI4
ADDRGP4 $340
JUMPV
LABELV $349
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
CNSTI4 1
RETI4
LABELV $340
endproc ConsoleCommand 1036 20
export G_RegisterCommands
proc G_RegisterCommands 8 4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $356
JUMPV
LABELV $353
ADDRLP4 4
CNSTI4 0
ASGNI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 svcmds+4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $357
ADDRGP4 g_dedicated+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $357
ADDRGP4 $354
JUMPV
LABELV $357
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 svcmds
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
LABELV $354
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $356
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 26
LTU4 $353
ADDRGP4 G_admin_register_cmds
CALLV
pop
LABELV $352
endproc G_RegisterCommands 8 4
export G_UnregisterCommands
proc G_UnregisterCommands 8 4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $365
JUMPV
LABELV $362
ADDRLP4 4
CNSTI4 0
ASGNI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 svcmds+4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $366
ADDRGP4 g_dedicated+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $366
ADDRGP4 $363
JUMPV
LABELV $366
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 svcmds
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_RemoveCommand
CALLV
pop
LABELV $363
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $365
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 26
LTU4 $362
ADDRGP4 G_admin_unregister_cmds
CALLV
pop
LABELV $361
endproc G_UnregisterCommands 8 4
import trap_RemoveCommand
import trap_AddCommand
import trap_SendGameStat
import trap_SnapVector
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_SetConfigstringRestrictions
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_RealTime
import trap_Milliseconds
import trap_Error
import trap_Print
import g_censorship
import g_allowTeamOverlay
import g_publicAdminMessages
import g_specChat
import g_privateMessages
import g_adminMaxBan
import g_adminTempBan
import g_admin
import g_emoticonsAllowedInNames
import g_layoutAuto
import g_layouts
import g_mapConfigs
import g_shove
import g_floodMinTime
import g_floodMaxDemerits
import g_voiceChats
import g_debugVoices
import g_sayAreaRange
import g_initialMapRotation
import g_nextMap
import g_mapRotationStack
import g_mapRotationNodes
import g_currentMapRotation
import g_debugMapRotation
import g_markDeconstruct
import g_disabledBuildables
import g_disabledClasses
import g_disabledEquipment
import g_unlagged
import g_freeFundPeriod
import g_teamImbalanceWarnings
import g_alienStage3Threshold
import g_alienStage2Threshold
import g_alienMaxStage
import g_alienCredits
import g_alienStage
import g_humanStage3Threshold
import g_humanStage2Threshold
import g_humanMaxStage
import g_humanCredits
import g_humanStage
import g_humanRepeaterMaxZones
import g_humanRepeaterBuildQueueTime
import g_humanRepeaterBuildPoints
import g_humanBuildQueueTime
import g_humanBuildPoints
import g_alienBuildQueueTime
import g_alienBuildPoints
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_teamForceBalance
import g_suddenDeathVoteDelay
import g_suddenDeathVotePercent
import g_voteLimit
import g_allowVote
import g_doWarmup
import g_warmup
import g_motd
import g_synchronousClients
import g_debugDamage
import g_debugMove
import g_inactivity
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_dretchPunt
import g_friendlyBuildableFire
import g_friendlyFire
import g_suddenDeathTime
import g_timelimit
import g_maxNameChanges
import g_minNameChangePeriod
import g_lockTeamsAtStart
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_entities
import level
import G_namelog_cleanup
import G_namelog_update_name
import G_namelog_update_score
import G_namelog_restore
import G_namelog_disconnect
import G_namelog_connect
import G_ClearRotationStack
import G_MapExists
import G_ShutdownMapRotations
import G_InitMapRotations
import G_MapRotationActive
import G_StopMapRotation
import G_StartMapRotation
import G_AdvanceMapRotation
import G_PrintRotations
import G_WriteSessionData
import G_InitSessionData
import G_ReadSessionData
import G_UpdateTeamConfigStrings
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocation
import G_ChangeTeam
import G_LeaveTeam
import OnSameTeam
import G_TeamCommand
import G_TeamFromString
import G_RunClient
import ClientEndFrame
import ClientThink
import G_UnlaggedOff
import G_UnlaggedOn
import G_UnlaggedCalc
import G_UnlaggedClear
import G_UnlaggedStore
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_TimeTilSuddenDeath
import LogExit
import G_CheckVote
import G_ExecuteVote
import G_Vote
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_LogPrintf
import G_AdminMessage
import G_RunThink
import FindIntermissionPoint
import CalculateRanks
import G_MapConfigs
import MoveClientToIntermission
import ScoreboardMessage
import FireWeapon3
import FireWeapon2
import FireWeapon
import SpotWouldTelefrag
import player_die
import ClientSpawn
import BeginIntermission
import respawn
import G_SelectHumanLockSpawnPoint
import G_SelectAlienLockSpawnPoint
import G_SelectSpawnPoint
import G_SelectTremulousSpawnPoint
import G_SetClientViewAngle
import TeamCount
import G_AddCreditToClient
import G_ClearPlayerZapEffects
import G_UpdateZaps
import G_CrushAttack
import G_ChargeAttack
import CheckCkitRepair
import CheckPounceAttack
import CheckGrabAttack
import CheckVenomAttack
import SnapVectorTowards
import CalcMuzzlePoint
import G_GiveClientMaxAmmo
import G_ForceWeaponChange
import ShineTorch
import TeleportPlayer
import G_Checktrigger_stages
import trigger_teleporter_touch
import manualTriggerSpectator
import Touch_DoorTrigger
import G_RunMover
import launch_grenade
import fire_hive
import fire_bounceBall
import fire_slowBlob
import fire_paraLockBlob
import fire_lockblob
import fire_luciferCannon
import fire_pulseRifle
import fire_blaster
import fire_flamer
import G_RunMissile
import G_InitDamageLocations
import G_LogDestruction
import AddScore
import body_die
import G_RewardAttackers
import G_SelectiveRadiusDamage
import G_RadiusDamage
import G_SelectiveDamage
import G_Damage
import CanDamage
import G_ClosestEnt
import G_Visible
import G_CloseMenus
import G_TriggerMenuArgs
import G_TriggerMenu
import G_ClientIsLagging
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_BroadcastEvent
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_SoundIndex
import G_ModelIndex
import G_ShaderIndex
import G_ParticleSystemIndex
import G_AddressCompare
import G_AddressParse
import G_BuildLogRevert
import G_BuildLogAuto
import G_BuildLogSet
import G_BuildLogNew
import G_InPowerZone
import G_RepeaterEntityForPoint
import G_PowerEntityForEntity
import G_PowerEntityForPoint
import G_FindPower
import G_GetMarkedBuildPoints
import G_GetBuildPoints
import G_QueueBuildPoints
import G_NextQueueTime
import G_BaseSelfDestruct
import G_LayoutLoad
import G_LayoutSelect
import G_LayoutList
import G_LayoutSave
import FinishSpawningBuildable
import G_SpawnBuildable
import G_SetIdleBuildableAnim
import G_SetBuildableAnim
import G_BuildIfValid
import G_CanBuild
import G_ClearDeconMarks
import G_BuildableRange
import G_BuildableThink
import G_FindCreep
import G_Overmind
import G_Reactor
import G_FindDCC
import G_IsDCCBuilt
import G_IsPowered
import G_CheckSpawnPoint
import G_Physics
import G_CensorString
import G_LoadCensors
import G_ListCommands
import G_FloodLimited
import Cmd_AdminMessage_f
import Cmd_Test_f
import Cmd_ListMaps_f
import Cmd_PrivateMessage_f
import G_SanitiseString
import G_UnEscapeString
import G_DecolorString
import G_Say
import ConcatArgsPrintable
import ConcatArgs
import G_ClientNumbersFromString
import G_ClientNumberFromString
import G_ToggleFollow
import G_FollowNewClient
import G_FollowLockView
import G_StopFromFollowing
import G_StopFollowing
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import G_PrintSpawnQueue
import G_GetPosInSpawnQueue
import G_RemoveFromSpawnQueue
import G_PushSpawnQueue
import G_SearchSpawnQueue
import G_PeekSpawnQueue
import G_PopSpawnQueue
import G_GetSpawnQueueLength
import G_InitSpawnQueue
import G_admin_cleanup
import G_admin_duration
import G_admin_buffer_end
import G_admin_buffer_begin
import G_admin_buffer_print
import G_admin_print
import G_admin_revert
import G_admin_buildlog
import G_admin_builder
import G_admin_pause
import G_admin_lock
import G_admin_namelog
import G_admin_nextmap
import G_admin_restart
import G_admin_rename
import G_admin_spec999
import G_admin_endvote
import G_admin_allready
import G_admin_admintest
import G_admin_adminhelp
import G_admin_showbans
import G_admin_denybuild
import G_admin_mute
import G_admin_changemap
import G_admin_listplayers
import G_admin_listlayouts
import G_admin_listadmins
import G_admin_putteam
import G_admin_unban
import G_admin_ban
import G_admin_adjustban
import G_admin_kick
import G_admin_setlevel
import G_admin_time
import G_admin_authlog
import G_admin_admin
import G_admin_name_check
import G_admin_permission
import G_admin_readconfig
import G_admin_cmd_check
import G_admin_ban_check
import G_admin_cmdlist
import G_admin_unregister_cmds
import G_admin_register_cmds
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
LABELV $348
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $339
byte 1 115
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $338
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 77
byte 1 97
byte 1 112
byte 1 82
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $337
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $336
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $335
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 113
byte 1 117
byte 1 101
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $334
byte 1 112
byte 1 114
byte 1 0
align 1
LABELV $333
byte 1 109
byte 1 97
byte 1 112
byte 1 82
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $332
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 99
byte 1 101
byte 1 110
byte 1 115
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $331
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $330
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 83
byte 1 97
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $329
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $328
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 87
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $327
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $326
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $325
byte 1 101
byte 1 118
byte 1 97
byte 1 99
byte 1 117
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $324
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 76
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $323
byte 1 101
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $322
byte 1 100
byte 1 117
byte 1 109
byte 1 112
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $321
byte 1 99
byte 1 112
byte 1 0
align 1
LABELV $320
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 87
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $319
byte 1 97
byte 1 100
byte 1 118
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 77
byte 1 97
byte 1 112
byte 1 82
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $318
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 116
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $313
byte 1 115
byte 1 0
align 1
LABELV $312
byte 1 0
align 1
LABELV $311
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 83
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 32
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $305
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $302
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $299
byte 1 109
byte 1 0
align 1
LABELV $296
byte 1 97
byte 1 0
align 1
LABELV $292
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $284
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 113
byte 1 117
byte 1 101
byte 1 117
byte 1 101
byte 1 32
byte 1 60
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $280
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $279
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 110
byte 1 117
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $275
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 60
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 110
byte 1 117
byte 1 109
byte 1 124
byte 1 45
byte 1 49
byte 1 62
byte 1 32
byte 1 60
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $271
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $265
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 10
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $262
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 100
byte 1 117
byte 1 109
byte 1 112
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $258
byte 1 101
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $242
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 101
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 124
byte 1 45
byte 1 49
byte 1 62
byte 1 32
byte 1 60
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $238
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $237
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 99
byte 1 112
byte 1 32
byte 1 60
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $233
byte 1 83
byte 1 97
byte 1 121
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 45
byte 1 49
byte 1 32
byte 1 34
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 34
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $232
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 45
byte 1 49
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $231
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $228
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 60
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 62
byte 1 32
byte 1 60
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $224
byte 1 109
byte 1 97
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $221
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 60
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $217
byte 1 69
byte 1 118
byte 1 97
byte 1 99
byte 1 117
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 0
align 1
LABELV $216
byte 1 69
byte 1 118
byte 1 97
byte 1 99
byte 1 117
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $214
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 69
byte 1 118
byte 1 97
byte 1 99
byte 1 117
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $205
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 116
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $204
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 116
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 97
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $203
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 76
byte 1 105
byte 1 102
byte 1 101
byte 1 32
byte 1 83
byte 1 117
byte 1 112
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 84
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 34
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $200
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 65
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 116
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 97
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $199
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 72
byte 1 105
byte 1 118
byte 1 101
byte 1 109
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 76
byte 1 105
byte 1 110
byte 1 107
byte 1 32
byte 1 66
byte 1 114
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 34
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $196
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 116
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 118
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $191
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $190
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $189
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 60
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 32
byte 1 46
byte 1 46
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $185
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $171
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 60
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $167
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $162
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 62
byte 1 32
byte 1 60
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $158
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $157
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $156
byte 1 37
byte 1 45
byte 1 56
byte 1 100
byte 1 32
byte 1 0
align 1
LABELV $155
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $154
byte 1 37
byte 1 45
byte 1 50
byte 1 49
byte 1 115
byte 1 32
byte 1 0
align 1
LABELV $153
byte 1 67
byte 1 78
byte 1 67
byte 1 84
byte 1 32
byte 1 0
align 1
LABELV $150
byte 1 37
byte 1 45
byte 1 53
byte 1 100
byte 1 32
byte 1 0
align 1
LABELV $149
byte 1 37
byte 1 45
byte 1 52
byte 1 100
byte 1 32
byte 1 0
align 1
LABELV $141
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 32
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 32
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 32
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $140
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $135
byte 1 10
byte 1 0
align 1
LABELV $134
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $130
byte 1 37
byte 1 45
byte 1 51
byte 1 105
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $129
byte 1 69
byte 1 84
byte 1 95
byte 1 76
byte 1 69
byte 1 86
byte 1 50
byte 1 95
byte 1 90
byte 1 65
byte 1 80
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 73
byte 1 78
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $127
byte 1 69
byte 1 84
byte 1 95
byte 1 76
byte 1 73
byte 1 71
byte 1 72
byte 1 84
byte 1 70
byte 1 76
byte 1 65
byte 1 82
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $125
byte 1 69
byte 1 84
byte 1 95
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 76
byte 1 68
byte 1 79
byte 1 79
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $123
byte 1 69
byte 1 84
byte 1 95
byte 1 65
byte 1 78
byte 1 73
byte 1 77
byte 1 77
byte 1 65
byte 1 80
byte 1 79
byte 1 66
byte 1 74
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $121
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 65
byte 1 82
byte 1 84
byte 1 73
byte 1 67
byte 1 76
byte 1 69
byte 1 95
byte 1 83
byte 1 89
byte 1 83
byte 1 84
byte 1 69
byte 1 77
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $119
byte 1 69
byte 1 84
byte 1 95
byte 1 67
byte 1 79
byte 1 82
byte 1 80
byte 1 83
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $117
byte 1 69
byte 1 84
byte 1 95
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 80
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $115
byte 1 69
byte 1 84
byte 1 95
byte 1 73
byte 1 78
byte 1 86
byte 1 73
byte 1 83
byte 1 73
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $113
byte 1 69
byte 1 84
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 32
byte 1 0
align 1
LABELV $111
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 85
byte 1 83
byte 1 72
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $109
byte 1 69
byte 1 84
byte 1 95
byte 1 83
byte 1 80
byte 1 69
byte 1 65
byte 1 75
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $107
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 65
byte 1 76
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $105
byte 1 69
byte 1 84
byte 1 95
byte 1 66
byte 1 69
byte 1 65
byte 1 77
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $103
byte 1 69
byte 1 84
byte 1 95
byte 1 77
byte 1 79
byte 1 86
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $101
byte 1 69
byte 1 84
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $99
byte 1 69
byte 1 84
byte 1 95
byte 1 76
byte 1 79
byte 1 67
byte 1 65
byte 1 84
byte 1 73
byte 1 79
byte 1 78
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $97
byte 1 69
byte 1 84
byte 1 95
byte 1 66
byte 1 85
byte 1 73
byte 1 76
byte 1 68
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $95
byte 1 69
byte 1 84
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $93
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $91
byte 1 69
byte 1 84
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $86
byte 1 37
byte 1 51
byte 1 105
byte 1 58
byte 1 0
