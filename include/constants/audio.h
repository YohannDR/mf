#ifndef AUDIO_CONSTANTS_H
#define AUDIO_CONSTANTS_H

enum Sound {
    MUSIC_NONE, // 0x0 0
    MUSIC_1, // 0x1 1
    MUSIC_2, // 0x2 2
    MUSIC_3, // 0x3 3
    MUSIC_SECTOR_1, // 0x4 4
    MUSIC_5, // 0x5 5
    MUSIC_SECTOR_2, // 0x6 6
    MUSIC_SECTOR_3, // 0x7 7
    MUSIC_SECTOR_5, // 0x8 8
    MUSIC_SECTOR_4, // 0x9 9
    MUSIC_SECTOR_6, // 0xa 10
    MUSIC_NAVIGATION_ROOM, // 0xb 11
    MUSIC_C, // 0xc 12
    MUSIC_D, // 0xd 13
    MUSIC_E, // 0xe 14
    MUSIC_F, // 0xf 15
    MUSIC_ITEM_FANFARE, // 0x10 16
    MUSIC_11, // 0x11 17
    MUSIC_12, // 0x12 18
    MUSIC_13, // 0x13 19
    SOUND_MESSAGE_POPUP, // 0x14 20
    MUSIC_15, // 0x15 21
    MUSIC_16, // 0x16 22
    MUSIC_SA_X_CHASE, // 0x17 23
    MUSIC_BOSS_TENSION, // 0x18 24
    MUSIC_ARACHNUS_BATTLE, // 0x19 25
    MUSIC_ZAZABI_BATTLE, // 0x1a 26
    MUSIC_BOX_BATTLE, // 0x1b 27
    MUSIC_1C, // 0x1c 28
    MUSIC_1D, // 0x1d 29
    MUSIC_1E, // 0x1e 30
    MUSIC_1F, // 0x1f 31
    MUSIC_20, // 0x20 32
    MUSIC_21, // 0x21 33
    MUSIC_22, // 0x22 34
    MUSIC_23, // 0x23 35
    MUSIC_24, // 0x24 36
    MUSIC_25, // 0x25 37
    MUSIC_26, // 0x26 38
    MUSIC_27, // 0x27 39
    MUSIC_28, // 0x28 40
    MUSIC_29, // 0x29 41
    MUSIC_2A, // 0x2a 42
    MUSIC_2B, // 0x2b 43
    MUSIC_2C, // 0x2c 44
    MUSIC_2D, // 0x2d 45
    MUSIC_2E, // 0x2e 46
    MUSIC_2F, // 0x2f 47
    MUSIC_30, // 0x30 48
    MUSIC_31, // 0x31 49
    MUSIC_32, // 0x32 50
    MUSIC_OPERATIONS_DECK_ELEVATOR_OFFLINE, // 0x33 51
    MUSIC_OPERATIONS_DECK_ELEVATOR_OFFLINE_AMBIENCE, // 0x34 52
    MUSIC_MAIN_BOILER_COOLDOWN_MISSION, // 0x35 53
    MUSIC_36, // 0x36 54
    MUSIC_37, // 0x37 55
    MUSIC_ORBIT_CHANGE, // 0x38 56
    MUSIC_39, // 0x39 57
    MUSIC_3A, // 0x3a 58
    MUSIC_OBJECTIVE_COMPLETE, // 0x3b 59
    MUSIC_3C, // 0x3c 60
    MUSIC_3D, // 0x3d 61
    MUSIC_3E, // 0x3e 62
    MUSIC_SERRIS_YAKUZA_BATTLE, // 0x3f 63
    MUSIC_VARIA_CORE_X_BATTLE, // 0x40 64
    MUSIC_NIGHTMARE_BATTLE, // 0x41 65
    MUSIC_NEO_RIDLEY_BATTLE, // 0x42 66
    MUSIC_CHOZO_STATUE_CORE_X_BATTLE, // 0x43 67
    MUSIC_NETTORI_BATTLE, // 0x44 68
    MUSIC_45, // 0x45 69
    MUSIC_46, // 0x46 70
    MUSIC_47, // 0x47 71
    MUSIC_48, // 0x48 72
    MUSIC_49, // 0x49 73
    MUSIC_TITLE, // 0x4a 74
    MUSIC_4B, // 0x4b 75
    MUSIC_4C, // 0x4c 76
    MUSIC_4D, // 0x4d 77
    MUSIC_4E, // 0x4e 78
    MUSIC_4F, // 0x4f 79
    MUSIC_50, // 0x50 80
    MUSIC_SA_X_BATTLE, // 0x51 81
    MUSIC_52, // 0x52 82
    MUSIC_53, // 0x53 83
    MUSIC_54, // 0x54 84
    MUSIC_55, // 0x55 85
    MUSIC_56, // 0x56 86
    MUSIC_57, // 0x57 87
    MUSIC_58, // 0x58 88
    MUSIC_59, // 0x59 89
    MUSIC_5A, // 0x5a 90
    MUSIC_5B, // 0x5b 91
    MUSIC_5C, // 0x5c 92
    MUSIC_5D, // 0x5d 93
    MUSIC_5E, // 0x5e 94
    MUSIC_5F, // 0x5f 95
    MUSIC_60, // 0x60 96
    MUSIC_61, // 0x61 97
    MUSIC_62, // 0x62 98
    MUSIC_63, // 0x63 99

    SOUND_64, // 0x64 100
    SOUND_65, // 0x65 101
    SOUND_66, // 0x66 102
    SOUND_67, // 0x67 103
    SOUND_68, // 0x68 104
    SOUND_69, // 0x69 105
    SOUND_6A, // 0x6a 106
    SOUND_6B, // 0x6b 107
    SOUND_6C, // 0x6c 108
    SOUND_6D, // 0x6d 109
    SOUND_6E, // 0x6e 110
    SOUND_6F, // 0x6f 111
    SOUND_70, // 0x70 112
    SOUND_71, // 0x71 113
    SOUND_72, // 0x72 114
    SOUND_73, // 0x73 115
    SOUND_74, // 0x74 116
    SOUND_75, // 0x75 117
    SOUND_76, // 0x76 118
    SOUND_77, // 0x77 119
    SOUND_78, // 0x78 120
    SOUND_79, // 0x79 121
    SOUND_7A, // 0x7a 122
    SOUND_7B, // 0x7b 123
    SOUND_7C, // 0x7c 124
    SOUND_7D, // 0x7d 125
    SOUND_7E, // 0x7e 126
    SOUND_7F, // 0x7f 127
    SOUND_80, // 0x80 128
    SOUND_81, // 0x81 129
    SOUND_82, // 0x82 130
    SOUND_83, // 0x83 131
    SOUND_84, // 0x84 132
    SOUND_85, // 0x85 133
    SOUND_86, // 0x86 134
    SOUND_87, // 0x87 135
    SOUND_88, // 0x88 136
    SOUND_89, // 0x89 137
    SOUND_8A, // 0x8a 138
    SOUND_8B, // 0x8b 139
    SOUND_8C, // 0x8c 140
    SOUND_8D, // 0x8d 141
    SOUND_8E, // 0x8e 142
    SOUND_8F, // 0x8f 143
    SOUND_90, // 0x90 144
    SOUND_91, // 0x91 145
    SOUND_92, // 0x92 146
    SOUND_93, // 0x93 147
    SOUND_94, // 0x94 148
    SOUND_95, // 0x95 149
    SOUND_96, // 0x96 150
    SOUND_97, // 0x97 151
    SOUND_98, // 0x98 152
    SOUND_99, // 0x99 153
    SOUND_9A, // 0x9a 154
    SOUND_9B, // 0x9b 155
    SOUND_9C, // 0x9c 156
    SOUND_9D, // 0x9d 157
    SOUND_9E, // 0x9e 158
    SOUND_9F, // 0x9f 159
    SOUND_A0, // 0xa0 160
    SOUND_A1, // 0xa1 161
    SOUND_A2, // 0xa2 162
    SOUND_A3, // 0xa3 163
    SOUND_A4, // 0xa4 164
    SOUND_A5, // 0xa5 165
    SOUND_A6, // 0xa6 166
    SOUND_A7, // 0xa7 167
    SOUND_A8, // 0xa8 168
    SOUND_A9, // 0xa9 169
    SOUND_AA, // 0xaa 170
    SOUND_AB, // 0xab 171
    SOUND_AC, // 0xac 172
    SOUND_AD, // 0xad 173
    SOUND_AE, // 0xae 174
    SOUND_AF, // 0xaf 175
    SOUND_B0, // 0xb0 176
    SOUND_B1, // 0xb1 177
    SOUND_B2, // 0xb2 178
    SOUND_B3, // 0xb3 179
    SOUND_B4, // 0xb4 180
    SOUND_B5, // 0xb5 181
    SOUND_B6, // 0xb6 182
    SOUND_B7, // 0xb7 183
    SOUND_B8, // 0xb8 184
    SOUND_B9, // 0xb9 185
    SOUND_BA, // 0xba 186
    SOUND_BB, // 0xbb 187
    SOUND_BC, // 0xbc 188
    SOUND_BD, // 0xbd 189
    SOUND_BE, // 0xbe 190
    SOUND_BF, // 0xbf 191
    SOUND_C0, // 0xc0 192
    SOUND_C1, // 0xc1 193
    SOUND_C2, // 0xc2 194
    SOUND_C3, // 0xc3 195
    SOUND_C4, // 0xc4 196
    SOUND_C5, // 0xc5 197
    SOUND_C6, // 0xc6 198
    SOUND_C7, // 0xc7 199
    SOUND_C8, // 0xc8 200
    SOUND_C9, // 0xc9 201
    SOUND_CA, // 0xca 202
    SOUND_CB, // 0xcb 203
    SOUND_CC, // 0xcc 204
    SOUND_CD, // 0xcd 205
    SOUND_CE, // 0xce 206
    SOUND_CF, // 0xcf 207
    SOUND_D0, // 0xd0 208
    SOUND_D1, // 0xd1 209
    SOUND_D2, // 0xd2 210
    SOUND_D3, // 0xd3 211
    SOUND_D4, // 0xd4 212
    SOUND_D5, // 0xd5 213
    SOUND_D6, // 0xd6 214
    SOUND_D7, // 0xd7 215
    SOUND_D8, // 0xd8 216
    SOUND_D9, // 0xd9 217
    SOUND_DA, // 0xda 218
    SOUND_DB, // 0xdb 219
    SOUND_DC, // 0xdc 220
    SOUND_DD, // 0xdd 221
    SOUND_DE, // 0xde 222
    SOUND_DF, // 0xdf 223
    SOUND_E0, // 0xe0 224
    SOUND_E1, // 0xe1 225
    SOUND_E2, // 0xe2 226
    SOUND_E3, // 0xe3 227
    SOUND_E4, // 0xe4 228
    SOUND_E5, // 0xe5 229
    SOUND_E6, // 0xe6 230
    SOUND_E7, // 0xe7 231
    SOUND_E8, // 0xe8 232
    SOUND_E9, // 0xe9 233
    SOUND_EA, // 0xea 234
    SOUND_EB, // 0xeb 235
    SOUND_EC, // 0xec 236
    SOUND_ED, // 0xed 237
    SOUND_EE, // 0xee 238
    SOUND_EF, // 0xef 239
    SOUND_F0, // 0xf0 240
    SOUND_F1, // 0xf1 241
    SOUND_F2, // 0xf2 242
    SOUND_F3, // 0xf3 243
    SOUND_F4, // 0xf4 244
    SOUND_F5, // 0xf5 245
    SOUND_F6, // 0xf6 246
    SOUND_F7, // 0xf7 247
    SOUND_F8, // 0xf8 248
    SOUND_F9, // 0xf9 249
    SOUND_FA, // 0xfa 250
    SOUND_FB, // 0xfb 251
    SOUND_FC, // 0xfc 252
    SOUND_FD, // 0xfd 253
    SOUND_FE, // 0xfe 254
    SOUND_FF, // 0xff 255
    SOUND_100, // 0x100 256
    SOUND_101, // 0x101 257
    SOUND_102, // 0x102 258
    SOUND_103, // 0x103 259
    SOUND_104, // 0x104 260
    SOUND_105, // 0x105 261
    SOUND_106, // 0x106 262
    SOUND_107, // 0x107 263
    SOUND_108, // 0x108 264
    SOUND_109, // 0x109 265
    SOUND_10A, // 0x10a 266
    SOUND_10B, // 0x10b 267
    SOUND_10C, // 0x10c 268
    SOUND_10D, // 0x10d 269
    SOUND_10E, // 0x10e 270
    SOUND_10F, // 0x10f 271
    SOUND_110, // 0x110 272
    SOUND_111, // 0x111 273
    SOUND_112, // 0x112 274
    SOUND_113, // 0x113 275
    SOUND_114, // 0x114 276
    SOUND_115, // 0x115 277
    SOUND_ELECTRIC_WATER, // 0x116 278
    SOUND_ELECTRIC_WIRE, // 0x117 279
    SOUND_118, // 0x118 280
    SOUND_119, // 0x119 281
    SOUND_11A, // 0x11a 282
    SOUND_11B, // 0x11b 283
    SOUND_11C, // 0x11c 284
    SOUND_11D, // 0x11d 285
    SOUND_11E, // 0x11e 286
    SOUND_11F, // 0x11f 287
    SOUND_120, // 0x120 288
    SOUND_121, // 0x121 289
    SOUND_122, // 0x122 290
    SOUND_123, // 0x123 291
    SOUND_124, // 0x124 292
    SOUND_125, // 0x125 293
    SOUND_126, // 0x126 294
    SOUND_127, // 0x127 295
    SOUND_128, // 0x128 296
    SOUND_129, // 0x129 297
    SOUND_12A, // 0x12a 298
    SOUND_12B, // 0x12b 299
    SOUND_12C, // 0x12c 300
    SOUND_12D, // 0x12d 301
    SOUND_12E, // 0x12e 302
    SOUND_12F, // 0x12f 303
    SOUND_130, // 0x130 304
    SOUND_131, // 0x131 305
    SOUND_132, // 0x132 306
    SOUND_133, // 0x133 307
    SOUND_134, // 0x134 308
    SOUND_135, // 0x135 309
    SOUND_136, // 0x136 310
    SOUND_137, // 0x137 311
    SOUND_138, // 0x138 312
    SOUND_139, // 0x139 313
    SOUND_13A, // 0x13a 314
    SOUND_13B, // 0x13b 315
    SOUND_13C, // 0x13c 316
    SOUND_13D, // 0x13d 317
    SOUND_13E, // 0x13e 318
    SOUND_13F, // 0x13f 319
    SOUND_140, // 0x140 320
    SOUND_141, // 0x141 321
    SOUND_142, // 0x142 322
    SOUND_143, // 0x143 323
    SOUND_144, // 0x144 324
    SOUND_145, // 0x145 325
    SOUND_146, // 0x146 326
    SOUND_147, // 0x147 327
    SOUND_148, // 0x148 328
    SOUND_149, // 0x149 329
    SOUND_14A, // 0x14a 330
    SOUND_14B, // 0x14b 331
    SOUND_14C, // 0x14c 332
    SOUND_14D, // 0x14d 333
    SOUND_14E, // 0x14e 334
    SOUND_14F, // 0x14f 335
    SOUND_150, // 0x150 336
    SOUND_151, // 0x151 337
    SOUND_152, // 0x152 338
    SOUND_153, // 0x153 339
    SOUND_154, // 0x154 340
    SOUND_155, // 0x155 341
    SOUND_156, // 0x156 342
    SOUND_157, // 0x157 343
    SOUND_158, // 0x158 344
    SOUND_159, // 0x159 345
    SOUND_15A, // 0x15a 346
    SOUND_15B, // 0x15b 347
    SOUND_15C, // 0x15c 348
    SOUND_15D, // 0x15d 349
    SOUND_15E, // 0x15e 350
    SOUND_15F, // 0x15f 351
    SOUND_160, // 0x160 352
    SOUND_161, // 0x161 353
    SOUND_162, // 0x162 354
    SOUND_163, // 0x163 355
    SOUND_164, // 0x164 356
    SOUND_165, // 0x165 357
    SOUND_166, // 0x166 358
    SOUND_167, // 0x167 359
    SOUND_168, // 0x168 360
    SOUND_169, // 0x169 361
    SOUND_16A, // 0x16a 362
    SOUND_16B, // 0x16b 363
    SOUND_16C, // 0x16c 364
    SOUND_16D, // 0x16d 365
    SOUND_16E, // 0x16e 366
    SOUND_16F, // 0x16f 367
    SOUND_170, // 0x170 368
    SOUND_171, // 0x171 369
    SOUND_172, // 0x172 370
    SOUND_173, // 0x173 371
    SOUND_174, // 0x174 372
    SOUND_175, // 0x175 373
    SOUND_176, // 0x176 374
    SOUND_177, // 0x177 375
    SOUND_178, // 0x178 376
    SOUND_179, // 0x179 377
    SOUND_17A, // 0x17a 378
    SOUND_17B, // 0x17b 379
    SOUND_17C, // 0x17c 380
    SOUND_17D, // 0x17d 381
    SOUND_17E, // 0x17e 382
    SOUND_17F, // 0x17f 383
    SOUND_180, // 0x180 384
    SOUND_181, // 0x181 385
    SOUND_REO_MOVING, // 0x182 386
    SOUND_REO_HURT, // 0x183 387
    SOUND_184, // 0x184 388
    SOUND_185, // 0x185 389
    SOUND_FUNE_SPIT, // 0x186 390
    SOUND_FUNE_LUNGING, // 0x187 391
    SOUND_FUNE_HURT, // 0x188 392
    SOUND_NAMIHE_SPIT, // 0x189 393
    SOUND_NAMIHE_LUNGING, // 0x18a 394
    SOUND_NAMIHE_HURT, // 0x18b 395
    SOUND_18C, // 0x18c 396
    SOUND_18D, // 0x18d 397
    SOUND_SOVA_DROPPING_FLAME, // 0x18e 398
    SOUND_SOVA_FALLING_FLAME_EXPLODING, // 0x18f 399
    SOUND_SOVA_HURT, // 0x190 400
    SOUND_SKULTERA_SMALL_TURNING, // 0x191 401
    SOUND_SKULTERA_SMALL_HURT, // 0x192 402
    SOUND_SKULTERA_LARGE_TURNING, // 0x193 403
    SOUND_SKULTERA_LARGE_HURT, // 0x194 404
    SOUND_YARD_CHARGING, // 0x195 405
    SOUND_YARD_SHOOTING, // 0x196 406
    SOUND_YARD_HURT, // 0x197 407
    SOUND_YARD_ROLLING, // 0x198 408
    SOUND_199, // 0x199 409
    SOUND_BULL_RELEASING_SMOKE, // 0x19a 410
    SOUND_MEMU_CHASING, // 0x19b 411
    SOUND_MEMU_HURT, // 0x19c 412
    SOUND_19D, // 0x19d 413
    SOUND_19E, // 0x19e 414
    SOUND_19F, // 0x19f 415
    SOUND_1A0, // 0x1a0 416
    SOUND_1A1, // 0x1a1 417
    SOUND_1A2, // 0x1a2 418
    SOUND_1A3, // 0x1a3 419
    SOUND_1A4, // 0x1a4 420
    SOUND_1A5, // 0x1a5 421
    SOUND_1A6, // 0x1a6 422
    SOUND_1A7, // 0x1a7 423
    SOUND_1A8, // 0x1a8 424
    SOUND_EVIR_IDLE, // 0x1a9 425
    SOUND_EVIR_SHOOTING, // 0x1aa 426
    SOUND_1AB, // 0x1ab 427
    SOUND_EVIR_HURT, // 0x1ac 428
    SOUND_1AD, // 0x1ad 429
    SOUND_1AE, // 0x1ae 430
    SOUND_1AF, // 0x1af 431
    SOUND_1B0, // 0x1b0 432
    SOUND_1B1, // 0x1b1 433
    SOUND_1B2, // 0x1b2 434
    SOUND_1B3, // 0x1b3 435
    SOUND_1B4, // 0x1b4 436
    SOUND_1B5, // 0x1b5 437
    SOUND_1B6, // 0x1b6 438
    SOUND_1B7, // 0x1b7 439
    SOUND_1B8, // 0x1b8 440
    SOUND_1B9, // 0x1b9 441
    SOUND_1BA, // 0x1ba 442
    SOUND_1BB, // 0x1bb 443
    SOUND_1BC, // 0x1bc 444
    SOUND_1BD, // 0x1bd 445
    SOUND_1BE, // 0x1be 446
    SOUND_1BF, // 0x1bf 447
    SOUND_1C0, // 0x1c0 448
    SOUND_1C1, // 0x1c1 449
    SOUND_1C2, // 0x1c2 450
    SOUND_1C3, // 0x1c3 451
    SOUND_1C4, // 0x1c4 452
    SOUND_1C5, // 0x1c5 453
    SOUND_1C6, // 0x1c6 454
    SOUND_1C7, // 0x1c7 455
    SOUND_1C8, // 0x1c8 456
    SOUND_1C9, // 0x1c9 457
    SOUND_1CA, // 0x1ca 458
    SOUND_ZEELA_SHOOTING, // 0x1cb 459
    SOUND_ZEELA_HURT, // 0x1cc 460
    SOUND_1CD, // 0x1cd 461
    SOUND_1CE, // 0x1ce 462
    SOUND_1CF, // 0x1cf 463
    SOUND_1D0, // 0x1d0 464
    SOUND_1D1, // 0x1d1 465
    SOUND_1D2, // 0x1d2 466
    SOUND_1D3, // 0x1d3 467
    SOUND_1D4, // 0x1d4 468
    SOUND_1D5, // 0x1d5 469
    SOUND_1D6, // 0x1d6 470
    SOUND_1D7, // 0x1d7 471
    SOUND_1D8, // 0x1d8 472
    SOUND_1D9, // 0x1d9 473
    SOUND_1DA, // 0x1da 474
    SOUND_1DB, // 0x1db 475
    SOUND_1DC, // 0x1dc 476
    SOUND_1DD, // 0x1dd 477
    SOUND_1DE, // 0x1de 478
    SOUND_1DF, // 0x1df 479
    SOUND_1E0, // 0x1e0 480
    SOUND_1E1, // 0x1e1 481
    SOUND_1E2, // 0x1e2 482
    SOUND_1E3, // 0x1e3 483
    SOUND_1E4, // 0x1e4 484
    SOUND_1E5, // 0x1e5 485
    SOUND_1E6, // 0x1e6 486
    SOUND_1E7, // 0x1e7 487
    SOUND_1E8, // 0x1e8 488
    SOUND_1E9, // 0x1e9 489
    SOUND_1EA, // 0x1ea 490
    SOUND_1EB, // 0x1eb 491
    SOUND_1EC, // 0x1ec 492
    SOUND_1ED, // 0x1ed 493
    SOUND_1EE, // 0x1ee 494
    SOUND_1EF, // 0x1ef 495
    SOUND_1F0, // 0x1f0 496
    SOUND_1F1, // 0x1f1 497
    SOUND_1F2, // 0x1f2 498
    SOUND_1F3, // 0x1f3 499
    SOUND_1F4, // 0x1f4 500
    SOUND_1F5, // 0x1f5 501
    SOUND_1F6, // 0x1f6 502
    SOUND_1F7, // 0x1f7 503
    SOUND_1F8, // 0x1f8 504
    SOUND_1F9, // 0x1f9 505
    SOUND_1FA, // 0x1fa 506
    SOUND_1FB, // 0x1fb 507
    SOUND_1FC, // 0x1fc 508
    SOUND_1FD, // 0x1fd 509
    SOUND_1FE, // 0x1fe 510
    SOUND_1FF, // 0x1ff 511
    SOUND_200, // 0x200 512
    SOUND_201, // 0x201 513
    SOUND_202, // 0x202 514
    SOUND_203, // 0x203 515
    SOUND_204, // 0x204 516
    SOUND_205, // 0x205 517
    SOUND_206, // 0x206 518
    SOUND_207, // 0x207 519
    SOUND_208, // 0x208 520
    SOUND_209, // 0x209 521
    SOUND_20A, // 0x20a 522
    SOUND_20B, // 0x20b 523
    SOUND_20C, // 0x20c 524
    SOUND_20D, // 0x20d 525
    SOUND_20E, // 0x20e 526
    SOUND_20F, // 0x20f 527
    SOUND_210, // 0x210 528
    SOUND_211, // 0x211 529
    SOUND_212, // 0x212 530
    SOUND_213, // 0x213 531
    SOUND_214, // 0x214 532
    SOUND_215, // 0x215 533
    SOUND_216, // 0x216 534
    SOUND_217, // 0x217 535
    SOUND_218, // 0x218 536
    SOUND_219, // 0x219 537
    SOUND_21A, // 0x21a 538
    SOUND_21B, // 0x21b 539
    SOUND_21C, // 0x21c 540
    SOUND_21D, // 0x21d 541
    SOUND_21E, // 0x21e 542
    SOUND_21F, // 0x21f 543
    SOUND_220, // 0x220 544
    SOUND_221, // 0x221 545
    SOUND_222, // 0x222 546
    SOUND_223, // 0x223 547
    SOUND_224, // 0x224 548
    SOUND_225, // 0x225 549
    SOUND_226, // 0x226 550
    SOUND_227, // 0x227 551
    SOUND_228, // 0x228 552
    SOUND_229, // 0x229 553
    SOUND_22A, // 0x22a 554
    SOUND_22B, // 0x22b 555
    SOUND_22C, // 0x22c 556
    SOUND_22D, // 0x22d 557
    SOUND_22E, // 0x22e 558
    SOUND_22F, // 0x22f 559
    SOUND_230, // 0x230 560
    SOUND_231, // 0x231 561
    SOUND_232, // 0x232 562
    SOUND_233, // 0x233 563
    SOUND_234, // 0x234 564
    SOUND_235, // 0x235 565
    SOUND_236, // 0x236 566
    SOUND_237, // 0x237 567
    SOUND_238, // 0x238 568
    SOUND_239, // 0x239 569
    SOUND_23A, // 0x23a 570
    SOUND_23B, // 0x23b 571
    SOUND_23C, // 0x23c 572
    SOUND_23D, // 0x23d 573
    SOUND_23E, // 0x23e 574
    SOUND_23F, // 0x23f 575
    SOUND_240, // 0x240 576
    SOUND_241, // 0x241 577
    SOUND_242, // 0x242 578
    SOUND_243, // 0x243 579
    SOUND_244, // 0x244 580
    SOUND_245, // 0x245 581
    SOUND_246, // 0x246 582
    SOUND_247, // 0x247 583
    SOUND_248, // 0x248 584
    SOUND_249, // 0x249 585
    SOUND_24A, // 0x24a 586
    SOUND_24B, // 0x24b 587
    SOUND_24C, // 0x24c 588
    SOUND_24D, // 0x24d 589
    SOUND_24E, // 0x24e 590
    SOUND_24F, // 0x24f 591
    SOUND_250, // 0x250 592
    SOUND_251, // 0x251 593
    SOUND_252, // 0x252 594
    SOUND_253, // 0x253 595
    SOUND_254, // 0x254 596
    SOUND_255, // 0x255 597
    SOUND_256, // 0x256 598
    SOUND_257, // 0x257 599
    SOUND_258, // 0x258 600
    SOUND_259, // 0x259 601
    SOUND_25A, // 0x25a 602
    SOUND_25B, // 0x25b 603
    SOUND_25C, // 0x25c 604
    SOUND_25D, // 0x25d 605
    SOUND_25E, // 0x25e 606
    SOUND_25F, // 0x25f 607
    SOUND_260, // 0x260 608
    SOUND_261, // 0x261 609
    SOUND_262, // 0x262 610
    SOUND_263, // 0x263 611
    SOUND_264, // 0x264 612
    SOUND_265, // 0x265 613
    SOUND_266, // 0x266 614
    SOUND_267, // 0x267 615
    SOUND_268, // 0x268 616
    SOUND_269, // 0x269 617
    SOUND_26A, // 0x26a 618
    SOUND_26B, // 0x26b 619
    SOUND_26C, // 0x26c 620
    SOUND_26D, // 0x26d 621
    SOUND_26E, // 0x26e 622
    SOUND_26F, // 0x26f 623
    SOUND_270, // 0x270 624
    SOUND_271, // 0x271 625
    SOUND_272, // 0x272 626
    SOUND_273, // 0x273 627
    SOUND_274, // 0x274 628
    SOUND_275, // 0x275 629
    SOUND_276, // 0x276 630
    SOUND_277, // 0x277 631
    SOUND_278, // 0x278 632
    SOUND_279, // 0x279 633
    SOUND_27A, // 0x27a 634
    SOUND_27B, // 0x27b 635
    SOUND_27C, // 0x27c 636
    SOUND_27D, // 0x27d 637
    SOUND_27E, // 0x27e 638
    SOUND_27F, // 0x27f 639
    SOUND_280, // 0x280 640
    SOUND_281, // 0x281 641
    SOUND_282, // 0x282 642
    SOUND_283, // 0x283 643
    SOUND_284, // 0x284 644
    SOUND_285, // 0x285 645
    SOUND_286, // 0x286 646
    SOUND_287, // 0x287 647
    SOUND_288, // 0x288 648
    SOUND_289, // 0x289 649
    SOUND_28A, // 0x28a 650
    SOUND_28B, // 0x28b 651
    SOUND_28C, // 0x28c 652
    SOUND_28D, // 0x28d 653
    SOUND_28E, // 0x28e 654
    SOUND_28F, // 0x28f 655
    SOUND_290, // 0x290 656
    SOUND_291, // 0x291 657
    SOUND_292, // 0x292 658
    SOUND_293, // 0x293 659
    SOUND_294, // 0x294 660
    SOUND_295, // 0x295 661
    SOUND_296, // 0x296 662
    SOUND_297, // 0x297 663
    SOUND_298, // 0x298 664
    SOUND_299, // 0x299 665
    SOUND_29A, // 0x29a 666
    SOUND_29B, // 0x29b 667
    SOUND_29C, // 0x29c 668
    SOUND_29D, // 0x29d 669
    SOUND_29E, // 0x29e 670
    SOUND_29F, // 0x29f 671
    SOUND_2A0, // 0x2a0 672
    SOUND_2A1, // 0x2a1 673
    SOUND_2A2, // 0x2a2 674
    SOUND_2A3, // 0x2a3 675
    SOUND_2A4, // 0x2a4 676
    SOUND_2A5, // 0x2a5 677
    SOUND_2A6, // 0x2a6 678
    SOUND_2A7, // 0x2a7 679
    SOUND_2A8, // 0x2a8 680
    SOUND_2A9, // 0x2a9 681
    SOUND_2AA, // 0x2aa 682
    SOUND_2AB, // 0x2ab 683
    SOUND_2AC, // 0x2ac 684
    SOUND_2AD, // 0x2ad 685
    SOUND_2AE, // 0x2ae 686
    SOUND_2AF, // 0x2af 687
    SOUND_2B0, // 0x2b0 688
    SOUND_2B1, // 0x2b1 689
    SOUND_2B2, // 0x2b2 690
    SOUND_2B3, // 0x2b3 691
    SOUND_2B4, // 0x2b4 692
    SOUND_2B5, // 0x2b5 693
    SOUND_2B6, // 0x2b6 694
    SOUND_2B7, // 0x2b7 695
    SOUND_2B8, // 0x2b8 696
    SOUND_2B9, // 0x2b9 697
    SOUND_2BA, // 0x2ba 698
    SOUND_2BB, // 0x2bb 699

    VOICE_2BC, // 0x2bc 700
    VOICE_2BD, // 0x2bd 701
    VOICE_2BE, // 0x2be 702
    VOICE_2BF, // 0x2bf 703
    VOICE_2C0, // 0x2c0 704
    VOICE_2C1, // 0x2c1 705
    VOICE_2C2, // 0x2c2 706
    VOICE_2C3, // 0x2c3 707
    VOICE_2C4, // 0x2c4 708
    VOICE_2C5, // 0x2c5 709
    VOICE_2C6, // 0x2c6 710
    VOICE_2C7, // 0x2c7 711
    VOICE_2C8, // 0x2c8 712
    VOICE_2C9, // 0x2c9 713
    VOICE_2CA, // 0x2ca 714
    VOICE_2CB, // 0x2cb 715
    VOICE_2CC, // 0x2cc 716
    VOICE_2CD, // 0x2cd 717
    VOICE_2CE, // 0x2ce 718
    VOICE_2CF, // 0x2cf 719
    VOICE_2D0, // 0x2d0 720
    VOICE_2D1, // 0x2d1 721
    VOICE_2D2, // 0x2d2 722
    VOICE_2D3, // 0x2d3 723
    VOICE_2D4, // 0x2d4 724
    VOICE_2D5, // 0x2d5 725
    VOICE_2D6, // 0x2d6 726
    VOICE_2D7, // 0x2d7 727
    VOICE_2D8, // 0x2d8 728
    VOICE_2D9, // 0x2d9 729
    VOICE_2DA, // 0x2da 730
    VOICE_2DB, // 0x2db 731
    VOICE_2DC, // 0x2dc 732
    VOICE_2DD, // 0x2dd 733
    VOICE_2DE, // 0x2de 734
    VOICE_2DF, // 0x2df 735
    VOICE_2E0, // 0x2e0 736
    VOICE_2E1, // 0x2e1 737
    VOICE_2E2, // 0x2e2 738
    VOICE_2E3, // 0x2e3 739
    VOICE_2E4, // 0x2e4 740
    VOICE_2E5, // 0x2e5 741
    VOICE_2E6, // 0x2e6 742
    VOICE_2E7, // 0x2e7 743
    VOICE_2E8, // 0x2e8 744

    SOUND_END
};

#endif /* AUDIO_CONSTANTS_H */
