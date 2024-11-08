#include "data/particle_data.h"
#include "macros.h"

static const u16 sParticleOam_Bomb_Frame0[] = {
    4,
    0xf4, 0x1f8, OBJ_PALETTE_3 | 0xe6,
    0xfc, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0xe6,
    0xf4, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0xe6,
    0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0xe6
};

static const u16 sParticleOam_Bomb_Frame1[] = {
    4,
    0xf4, 0x1f8, OBJ_PALETTE_3 | 0xe7,
    0xf4, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0xe7,
    0xfc, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0xe7,
    0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0xe7
};

static const u16 sParticleOam_Bomb_Frame2[] = {
    4,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x100,
    0xfc, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x100,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x100,
    0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x100
};

static const u16 sParticleOam_Bomb_Frame3[] = {
    4,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x102,
    0xfc, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x102,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x102,
    0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x102
};

static const u16 sParticleOam_Bomb_Frame4[] = {
    4,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x104,
    0xfc, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x104,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x104,
    0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x104
};

static const u16 sParticleOam_Explosion2_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xca
};

static const u16 sParticleOam_Explosion2_Frame1[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_3 | 0xe5,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0xe5,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0xe5,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0xe5
};

static const u16 sParticleOam_Explosion2_Frame2[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x106,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x106,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x106,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x106
};

static const u16 sParticleOam_Explosion2_Frame3[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x108,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x108,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x108,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x108
};

static const u16 sParticleOam_Explosion2_Frame4[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10a,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10a,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10a
};

static const u16 sParticleOam_Explosion2_Frame5[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10c,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10c,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10c
};

static const u16 sParticleOam_Explosion1_Frame3[] = {
    8,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10e,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10e,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10e,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10e,
    0xfc, 0x1e8, OBJ_PALETTE_3 | 0x130,
    0xfc, OBJ_X_FLIP | 0x10, OBJ_PALETTE_3 | 0x130,
    0xe8, 0x1fc, OBJ_PALETTE_3 | 0x110,
    0x10, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0x110
};

static const u16 sParticleOam_Explosion1_Frame4[] = {
    8,
    0xe8, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x111,
    0x8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x111,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x111,
    0x8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x111,
    0xf0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x113,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x113,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x113,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x113
};

static const u16 sParticleOam_Explosion1_Frame5[] = {
    8,
    0xe8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x115,
    0x8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x115,
    0x8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x115,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x115,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1e8, OBJ_PALETTE_3 | 0x117,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_3 | 0x117,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_3 | 0x138,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x138
};

static const u16 sParticleOam_SuperMissileExplosion_Frame0[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_3 | 0xe5,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0xe5,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0xe5,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0xe5
};

static const u16 sParticleOam_SuperMissileExplosion_Frame1[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x106,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x106,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x106,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x106
};

static const u16 sParticleOam_SuperMissileExplosion_Frame2[] = {
    8,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10e,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10e,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10e,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10e,
    0xfc, 0x1e8, OBJ_PALETTE_3 | 0x130,
    0xfc, OBJ_X_FLIP | 0x10, OBJ_PALETTE_3 | 0x130,
    0xe8, 0x1fc, OBJ_PALETTE_3 | 0x110,
    0x10, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0x110
};

static const u16 sParticleOam_SuperMissileExplosion_Frame3[] = {
    8,
    0xe8, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x111,
    0x8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x111,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x111,
    0x8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x111,
    0xf0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x113,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x113,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x113,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x113
};

static const u16 sParticleOam_SuperMissileExplosion_Frame4[] = {
    8,
    0xe8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x115,
    0x8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x115,
    0x8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x115,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x115,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1e8, OBJ_PALETTE_3 | 0x117,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_3 | 0x117,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_3 | 0x138,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x138
};

static const u16 sParticleOam_FireBeam_Frame1[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0xeb,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xeb,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xeb,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xeb
};

static const u16 sParticleOam_FireBeam_Frame2[] = {
    5,
    0xf6, 0x1f6, OBJ_PALETTE_2 | 0x16a,
    0xf6, OBJ_X_FLIP | 0x2, OBJ_PALETTE_2 | 0x16a,
    0x2, OBJ_X_FLIP | OBJ_Y_FLIP | 0x2, OBJ_PALETTE_2 | 0x16a,
    0x2, OBJ_Y_FLIP | 0x1f6, OBJ_PALETTE_2 | 0x16a,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xea
};

static const u16 sParticleOam_FireBeam_Frame0[] = {
    5,
    0xf5, 0x1f5, OBJ_PALETTE_2 | 0x169,
    0x3, OBJ_Y_FLIP | 0x1f5, OBJ_PALETTE_2 | 0x169,
    0xf5, OBJ_X_FLIP | 0x3, OBJ_PALETTE_2 | 0x169,
    0x3, OBJ_X_FLIP | OBJ_Y_FLIP | 0x3, OBJ_PALETTE_2 | 0x169,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xea
};

static const u16 sParticleOam_3ea63c_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xca
};

static const u16 sParticleOam_3ea63c_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xcb
};

static const u16 sParticleOam_3ea63c_Frame2[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xcc
};

static const u16 sParticleOam_3ea63c_Frame3[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xcd
};

static const u16 sParticleOam_3eaac4_Frame0[] = {
    6,
    0x0, 0x1fc, OBJ_PALETTE_2 | 0xc9,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x180,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x180,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x180,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x180,
    0xf4, 0x13, OBJ_PALETTE_2 | 0xc9
};

static const u16 sParticleOam_3eaac4_Frame4[] = {
    6,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x182,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x182,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x182,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x182,
    0xf6, 0xe, OBJ_PALETTE_2 | 0xc7,
    0xe8, 0x1e8, OBJ_PALETTE_2 | 0xc9
};

static const u16 sParticleOam_3eaac4_Frame8[] = {
    6,
    0xf8, 0xa, OBJ_PALETTE_2 | 0xc8,
    0xee, 0x1eb, OBJ_PALETTE_2 | 0xc7,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x184,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x184,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x184,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x184
};

static const u16 sParticleOam_3eaac4_Frame12[] = {
    7,
    0xf9, 0x6, OBJ_PALETTE_2 | 0xc8,
    0xf2, 0x1ed, OBJ_PALETTE_2 | 0xc8,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x186,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x186,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x186,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x186,
    0x14, 0x1ec, OBJ_PALETTE_2 | 0xc9
};

static const u16 sParticleOam_3eaac4_Frame16[] = {
    7,
    0xfb, 0x3, OBJ_PALETTE_2 | 0xc9,
    0xf5, 0x1f1, OBJ_PALETTE_2 | 0xc8,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x180,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x180,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x180,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x180,
    0x11, 0x1f1, OBJ_PALETTE_2 | 0xc7
};

static const u16 sParticleOam_3eaac4_Frame20[] = {
    7,
    0xfc, 0x0, OBJ_PALETTE_2 | 0xc9,
    0xf8, 0x1f5, OBJ_PALETTE_2 | 0xc9,
    0xc, 0x1f5, OBJ_PALETTE_2 | 0xc8,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x182,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x182,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x182,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x182
};

static const u16 sParticleOam_3eaac4_Frame24[] = {
    6,
    0xfa, 0x1f8, OBJ_PALETTE_2 | 0xc9,
    0x6, 0x1f8, OBJ_PALETTE_2 | 0xc8,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x184,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x184,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x184,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x184
};

static const u16 sParticleOam_3eaac4_Frame28[] = {
    5,
    0x2, 0x1fb, OBJ_PALETTE_2 | 0xc9,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x186,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x186,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x186,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x186
};

static const u16 sParticleOam_3eabcc_Frame0[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x180,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x180,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x180,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x180
};

static const u16 sParticleOam_3eabcc_Frame2[] = {
    4,
    0xf1, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_2 | 0x182,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_2 | 0x182,
    0xff, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_2 | 0x182,
    0xff, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_2 | 0x182
};

static const u16 sParticleOam_3eabcc_Frame4[] = {
    4,
    0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_2 | 0x184,
    0xfe, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_2 | 0x184,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_2 | 0x184,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_2 | 0x184
};

static const u16 sParticleOam_3eabcc_Frame6[] = {
    4,
    0xf9, 0x1f8, OBJ_PALETTE_2 | 0xe6,
    0xf9, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xe6,
    0xff, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xe6,
    0xff, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xe6
};

static const u16 sParticleOam_3eabcc_Frame8[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1e0, OBJ_PALETTE_2 | 0xe0,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | OBJ_SIZE_32x8 | 0x0, OBJ_PALETTE_2 | 0xe0
};

static const u16 sParticleOam_3eabcc_Frame10[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f0, OBJ_PALETTE_2 | 0xe0,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xe0
};

static const u16 sParticleOam_3eabcc_Frame12[] = {
    2,
    0xfb, 0x1f8, OBJ_PALETTE_2 | 0xe0,
    0xfb, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xe0
};

static const u16 sParticleOam_3eabcc_Frame14[] = {
    2,
    0xfb, 0x1fb, OBJ_PALETTE_2 | 0xe0,
    0xfb, OBJ_X_FLIP | 0x1fd, OBJ_PALETTE_2 | 0xe0
};

static const u16 sParticleOam_3ea664_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xfb
};

static const u16 sParticleOam_3ea7ec_Frame0[] = {
    6,
    0x0, 0x1fc, OBJ_PALETTE_3 | 0xc9,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x180,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x180,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x180,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x180,
    0xf4, 0x13, OBJ_PALETTE_3 | 0xc9
};

static const u16 sParticleOam_3ea7ec_Frame4[] = {
    6,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x182,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x182,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x182,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x182,
    0xf6, 0xe, OBJ_PALETTE_3 | 0xc7,
    0xe8, 0x1e8, OBJ_PALETTE_3 | 0xc9
};

static const u16 sParticleOam_3ea7ec_Frame8[] = {
    6,
    0xf8, 0xa, OBJ_PALETTE_3 | 0xc8,
    0xee, 0x1eb, OBJ_PALETTE_3 | 0xc7,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x184,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x184,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x184,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x184
};

static const u16 sParticleOam_3ea7ec_Frame12[] = {
    7,
    0xf9, 0x6, OBJ_PALETTE_3 | 0xc8,
    0xf2, 0x1ed, OBJ_PALETTE_3 | 0xc8,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x186,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x186,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x186,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x186,
    0x14, 0x1ec, OBJ_PALETTE_3 | 0xc9
};

static const u16 sParticleOam_3ea7ec_Frame16[] = {
    7,
    0xfb, 0x3, OBJ_PALETTE_3 | 0xc9,
    0xf5, 0x1f1, OBJ_PALETTE_3 | 0xc8,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x180,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x180,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x180,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x180,
    0x11, 0x1f1, OBJ_PALETTE_3 | 0xc7
};

static const u16 sParticleOam_3ea7ec_Frame20[] = {
    7,
    0xfc, 0x0, OBJ_PALETTE_3 | 0xc9,
    0xf8, 0x1f5, OBJ_PALETTE_3 | 0xc9,
    0xc, 0x1f5, OBJ_PALETTE_3 | 0xc8,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x182,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x182,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x182,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x182
};

static const u16 sParticleOam_3ea7ec_Frame24[] = {
    6,
    0xfa, 0x1f8, OBJ_PALETTE_3 | 0xc9,
    0x6, 0x1f8, OBJ_PALETTE_3 | 0xc8,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x184,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x184,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x184,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x184
};

static const u16 sParticleOam_3ea7ec_Frame28[] = {
    5,
    0x2, 0x1fb, OBJ_PALETTE_3 | 0xc9,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x186,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x186,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x186,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x186
};

static const u16 sParticleOam_3ea8f4_Frame0[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x180,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x180,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x180,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x180
};

static const u16 sParticleOam_3ea8f4_Frame2[] = {
    4,
    0xf1, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_3 | 0x182,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_3 | 0x182,
    0xff, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_3 | 0x182,
    0xff, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_3 | 0x182
};

static const u16 sParticleOam_3ea8f4_Frame4[] = {
    4,
    0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_3 | 0x184,
    0xfe, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_3 | 0x184,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_3 | 0x184,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_3 | 0x184
};

static const u16 sParticleOam_3ea8f4_Frame6[] = {
    4,
    0xf9, 0x1f8, OBJ_PALETTE_3 | 0xe6,
    0xf9, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0xe6,
    0xff, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0xe6,
    0xff, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0xe6
};

static const u16 sParticleOam_3ea8f4_Frame8[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1e0, OBJ_PALETTE_3 | 0xe0,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | OBJ_SIZE_32x8 | 0x0, OBJ_PALETTE_3 | 0xe0
};

static const u16 sParticleOam_3ea8f4_Frame10[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f0, OBJ_PALETTE_3 | 0xe0,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0xe0
};

static const u16 sParticleOam_3ea8f4_Frame12[] = {
    2,
    0xfb, 0x1f8, OBJ_PALETTE_3 | 0xe0,
    0xfb, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0xe0
};

static const u16 sParticleOam_3ea8f4_Frame14[] = {
    2,
    0xfb, 0x1fb, OBJ_PALETTE_3 | 0xe0,
    0xfb, OBJ_X_FLIP | 0x1fd, OBJ_PALETTE_3 | 0xe0
};

static const u16 sParticleOam_3ea664_Frame0[] = {
    6,
    0x0, 0x1fc, OBJ_PALETTE_4 | 0xc9,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x180,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x180,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x180,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x180,
    0xf4, 0x13, OBJ_PALETTE_4 | 0xc9
};

static const u16 sParticleOam_3ea664_Frame4[] = {
    6,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x182,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x182,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x182,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x182,
    0xf6, 0xe, OBJ_PALETTE_4 | 0xc7,
    0xe8, 0x1e8, OBJ_PALETTE_4 | 0xc9
};

static const u16 sParticleOam_3ea664_Frame8[] = {
    6,
    0xf8, 0xa, OBJ_PALETTE_4 | 0xc8,
    0xee, 0x1eb, OBJ_PALETTE_4 | 0xc7,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x184,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x184,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x184,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x184
};

static const u16 sParticleOam_3ea664_Frame12[] = {
    7,
    0xf9, 0x6, OBJ_PALETTE_4 | 0xc8,
    0xf2, 0x1ed, OBJ_PALETTE_4 | 0xc8,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x186,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x186,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x186,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x186,
    0x14, 0x1ec, OBJ_PALETTE_4 | 0xc9
};

static const u16 sParticleOam_3ea664_Frame16[] = {
    7,
    0xfb, 0x3, OBJ_PALETTE_4 | 0xc9,
    0xf5, 0x1f1, OBJ_PALETTE_4 | 0xc8,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x180,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x180,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x180,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x180,
    0x11, 0x1f1, OBJ_PALETTE_4 | 0xc7
};

static const u16 sParticleOam_3ea664_Frame20[] = {
    7,
    0xfc, 0x0, OBJ_PALETTE_4 | 0xc9,
    0xf8, 0x1f5, OBJ_PALETTE_4 | 0xc9,
    0xc, 0x1f5, OBJ_PALETTE_4 | 0xc8,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x182,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x182,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x182,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x182
};

static const u16 sParticleOam_3ea664_Frame24[] = {
    6,
    0xfa, 0x1f8, OBJ_PALETTE_4 | 0xc9,
    0x6, 0x1f8, OBJ_PALETTE_4 | 0xc8,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x184,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x184,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x184,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x184
};

static const u16 sParticleOam_3ea664_Frame28[] = {
    5,
    0x2, 0x1fb, OBJ_PALETTE_4 | 0xc9,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x186,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x186,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x186,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x186
};

static const u16 sParticleOam_3ea76c_Frame0[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x180,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x180,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x180,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x180
};

static const u16 sParticleOam_3ea76c_Frame2[] = {
    4,
    0xf1, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_4 | 0x182,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_4 | 0x182,
    0xff, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_4 | 0x182,
    0xff, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_4 | 0x182
};

static const u16 sParticleOam_3ea76c_Frame4[] = {
    4,
    0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_4 | 0x184,
    0xfe, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_4 | 0x184,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_4 | 0x184,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_4 | 0x184
};

static const u16 sParticleOam_3ea76c_Frame6[] = {
    4,
    0xf9, 0x1f8, OBJ_PALETTE_4 | 0xe6,
    0xf9, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0xe6,
    0xff, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0xe6,
    0xff, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_4 | 0xe6
};

static const u16 sParticleOam_3ea76c_Frame8[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1e0, OBJ_PALETTE_4 | 0xe0,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | OBJ_SIZE_32x8 | 0x0, OBJ_PALETTE_4 | 0xe0
};

static const u16 sParticleOam_3ea76c_Frame10[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f0, OBJ_PALETTE_4 | 0xe0,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0xe0
};

static const u16 sParticleOam_3ea76c_Frame12[] = {
    2,
    0xfb, 0x1f8, OBJ_PALETTE_4 | 0xe0,
    0xfb, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0xe0
};

static const u16 sParticleOam_3ea76c_Frame14[] = {
    2,
    0xfb, 0x1fb, OBJ_PALETTE_4 | 0xe0,
    0xfb, OBJ_X_FLIP | 0x1fd, OBJ_PALETTE_4 | 0xe0
};

static const u16 sParticleOam_3ea974_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x190
};

static const u16 sParticleOam_3ea974_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x192
};

static const u16 sParticleOam_3ea974_Frame2[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x194
};

static const u16 sParticleOam_3ea974_Frame3[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x196
};

static const u16 sParticleOam_Explosion4_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xcb
};

static const u16 sParticleOam_Explosion4_Frame1[] = {
    4,
    0xf7, 0x1f8, OBJ_PALETTE_3 | 0xe5,
    0xff, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0xe5,
    0xf7, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0xe5,
    0xff, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0xe5
};

static const u16 sParticleOam_Explosion4_Frame2[] = {
    4,
    0xed, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x106,
    0xfd, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x106,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x106,
    0xfd, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x106
};

static const u16 sParticleOam_Explosion4_Frame3[] = {
    4,
    0xea, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x108,
    0xfa, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x108,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x108,
    0xfa, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x108
};

static const u16 sParticleOam_Explosion4_Frame4[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10a,
    0xf8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10a,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10a,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10a
};

static const u16 sParticleOam_Explosion4_Frame5[] = {
    4,
    0xe6, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10c,
    0xf6, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10c,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10c,
    0xf6, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10c
};

static const u16 sParticleOam_Explosion3_Frame3[] = {
    8,
    0xee, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10e,
    0xfe, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10e,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10e,
    0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10e,
    0xfa, 0x1e8, OBJ_PALETTE_3 | 0x130,
    0xfa, OBJ_X_FLIP | 0x10, OBJ_PALETTE_3 | 0x130,
    0xe6, 0x1fc, OBJ_PALETTE_3 | 0x110,
    0xe, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0x110
};

static const u16 sParticleOam_Explosion3_Frame4[] = {
    8,
    0xe5, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x111,
    0x5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x111,
    0xe5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x111,
    0x5, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x111,
    0xed, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x113,
    0xfd, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x113,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x113,
    0xfd, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x113
};

static const u16 sParticleOam_Explosion3_Frame5[] = {
    8,
    0xe5, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x115,
    0x5, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x115,
    0x5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x115,
    0xe5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x115,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x1e8, OBJ_PALETTE_3 | 0x117,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_X_FLIP | 0x10, OBJ_PALETTE_3 | 0x117,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x1f8, OBJ_PALETTE_3 | 0x138,
    OBJ_SHAPE_HORIZONTAL | 0xd, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x138
};

static const u16 sParticleOam_NormalMissileExplosion_Frame4[] = {
    4,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_3 | 0xda,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_3 | 0xda,
    0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_3 | 0xda,
    0xfe, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_3 | 0xda
};

static const u16 sParticleOam_NormalMissileExplosion_Frame5[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0xda,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0xda,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0xda,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0xda
};

static const u16 sParticleOam_Explosion6_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xca
};

static const u16 sParticleOam_Explosion6_Frame1[] = {
    1,
    0xfb, 0x1fc, OBJ_PALETTE_3 | 0xcb
};

static const u16 sParticleOam_Explosion6_Frame2[] = {
    1,
    0xfa, 0x1fc, OBJ_PALETTE_3 | 0xcc
};

static const u16 sParticleOam_Explosion6_Frame3[] = {
    1,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0xcd
};

static const u16 sParticleOam_Explosion5_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x190
};

static const u16 sParticleOam_Explosion5_Frame1[] = {
    1,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x192
};

static const u16 sParticleOam_Explosion5_Frame2[] = {
    1,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x194
};

static const u16 sParticleOam_Explosion5_Frame3[] = {
    1,
    0xf3, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x196
};

static const u16 sParticleOam_IceMissileExplosion_Frame0[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_4 | 0x1d4,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0x1d4,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0x1d4,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_4 | 0x1d4
};

static const u16 sParticleOam_IceMissileExplosion_Frame1[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_4 | 0x1d5,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0x1d5,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0x1d5,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_4 | 0x1d5
};

static const u16 sParticleOam_IceMissileExplosion_Frame2[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x1cc,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x1cc,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x1cc,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x1cc
};

static const u16 sParticleOam_ChargedDiffusionMissileExplosion_Frame3[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x1ce,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x1ce,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x1ce,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x1ce
};

static const u16 sParticleOam_ChargedDiffusionMissileExplosion_Frame4[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x1d0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x1d0,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x1d0,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x1d0
};

static const u16 sParticleOam_ChargedDiffusionMissileExplosion_Frame5[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x1d2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x1d2,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x1d2,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x1d2
};

static const u16 sParticleOam_AbsorbIceXPreVaria_Frame16[] = {
    1,
    0xfc, 0x1f4, OBJ_PALETTE_4 | 0x1f4
};

static const u16 sParticleOam_AbsorbIceXPreVaria_Frame17[] = {
    2,
    0xfd, 0x1f4, OBJ_PALETTE_4 | 0x1f5,
    0xf4, 0x0, OBJ_PALETTE_4 | 0x1f4
};

static const u16 sParticleOam_AbsorbIceXPreVaria_Frame18[] = {
    3,
    0xfe, 0x1f4, OBJ_PALETTE_4 | 0x1d6,
    0xf5, 0x0, OBJ_PALETTE_4 | 0x1f5,
    0x4, 0x2, OBJ_PALETTE_4 | 0x1f4
};

static const u16 sParticleOam_AbsorbIceXPreVaria_Frame19[] = {
    3,
    0xff, 0x1f4, OBJ_PALETTE_4 | 0x1f6,
    0xf6, 0x0, OBJ_PALETTE_4 | 0x1d6,
    0x5, 0x2, OBJ_PALETTE_4 | 0x1f5
};

static const u16 sParticleOam_AbsorbIceXPreVaria_Frame20[] = {
    3,
    0x0, 0x1f4, OBJ_PALETTE_4 | 0x1f7,
    0xf7, 0x0, OBJ_PALETTE_4 | 0x1f6,
    0x6, 0x2, OBJ_PALETTE_4 | 0x1d6
};

static const u16 sParticleOam_AbsorbIceXPreVaria_Frame21[] = {
    2,
    0xf8, 0x0, OBJ_PALETTE_4 | 0x1f7,
    0x7, 0x2, OBJ_PALETTE_4 | 0x1f6
};

static const u16 sParticleOam_AbsorbIceXPreVaria_Frame22[] = {
    1,
    0x8, 0x2, OBJ_PALETTE_4 | 0x1f7
};

static const u16 sParticleOam_IceMissileExplosion_Frame3[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x19a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x19a,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x19a,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x19a
};

static const u16 sParticleOam_IceMissileExplosion_Frame4[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x198,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x198,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x198,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x198
};

static const u16 sParticleOam_AbsorbIceXPreVaria_Frame10[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0xd0,
    0xe8, 0x1e8, OBJ_PALETTE_4 | 0xd7,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0xd0,
    0x10, OBJ_X_FLIP | OBJ_Y_FLIP | 0x10, OBJ_PALETTE_4 | 0xd7
};

static const u16 sParticleOam_AbsorbIceXPreVaria_Frame11[] = {
    4,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_4 | 0xd0,
    0xeb, 0x1eb, OBJ_PALETTE_4 | 0xd7,
    0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_4 | 0xd0,
    0xd, OBJ_X_FLIP | OBJ_Y_FLIP | 0xd, OBJ_PALETTE_4 | 0xd7
};

static const u16 sParticleOam_AbsorbIceXPreVaria_Frame12[] = {
    4,
    0xf9, 0x1f9, OBJ_PALETTE_4 | 0xf1,
    0xf3, 0x1f3, OBJ_PALETTE_4 | 0xd0,
    0xff, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_4 | 0xf1,
    0x5, OBJ_X_FLIP | OBJ_Y_FLIP | 0x5, OBJ_PALETTE_4 | 0xd0
};

static const u16 sParticleOam_AbsorbIceXPreVaria_Frame13[] = {
    4,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0xd0,
    0xe8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_4 | 0xd7,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0xd0,
    0x10, OBJ_Y_FLIP | 0x1e8, OBJ_PALETTE_4 | 0xd7
};

static const u16 sParticleOam_AbsorbIceXPreVaria_Frame14[] = {
    4,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_4 | 0xd0,
    0xeb, OBJ_X_FLIP | 0xd, OBJ_PALETTE_4 | 0xd7,
    0xfe, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_4 | 0xd0,
    0xd, OBJ_Y_FLIP | 0x1eb, OBJ_PALETTE_4 | 0xd7
};

static const u16 sParticleOam_AbsorbIceXPreVaria_Frame15[] = {
    4,
    0xf9, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_4 | 0xf1,
    0xf3, OBJ_X_FLIP | 0x5, OBJ_PALETTE_4 | 0xd0,
    0xff, OBJ_Y_FLIP | 0x1f9, OBJ_PALETTE_4 | 0xf1,
    0x5, OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_4 | 0xd0
};

static const u16 sParticleOam_ParticleIceXTrail_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_4 | 0x1f4
};

static const u16 sParticleOam_ParticleIceXTrail_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_4 | 0x1f5
};

static const u16 sParticleOam_ParticleIceXTrail_Frame2[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_4 | 0x1d6
};

static const u16 sParticleOam_ParticleIceXTrail_Frame3[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_4 | 0x1f6
};

static const u16 sParticleOam_ParticleIceXTrail_Frame4[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_4 | 0x1f7
};

static const u16 sParticleOam_ParticleIceXTrail_Frame5[] = {
    1,
    0xfd, 0x1fb, OBJ_PALETTE_6 | 0x148
};

const struct FrameData sParticleOam_Bomb[6] = {
    [0] = {
        .pFrame = sParticleOam_Bomb_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sParticleOam_Bomb_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sParticleOam_Bomb_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sParticleOam_Bomb_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sParticleOam_Bomb_Frame4,
        .timer = 4
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_Explosion2[7] = {
    [0] = {
        .pFrame = sParticleOam_Explosion2_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sParticleOam_Explosion2_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sParticleOam_Explosion2_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sParticleOam_Explosion2_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sParticleOam_Explosion2_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sParticleOam_Explosion2_Frame5,
        .timer = 4
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_Explosion1[7] = {
    [0] = {
        .pFrame = sParticleOam_Explosion2_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sParticleOam_Explosion2_Frame2,
        .timer = 2
    },
    [2] = {
        .pFrame = sParticleOam_Explosion2_Frame3,
        .timer = 3
    },
    [3] = {
        .pFrame = sParticleOam_Explosion1_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sParticleOam_Explosion1_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sParticleOam_Explosion1_Frame5,
        .timer = 4
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_FireBeam[4] = {
    [0] = {
        .pFrame = sParticleOam_FireBeam_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sParticleOam_FireBeam_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sParticleOam_FireBeam_Frame2,
        .timer = 1
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3ea63c[5] = {
    [0] = {
        .pFrame = sParticleOam_3ea63c_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_3ea63c_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_3ea63c_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sParticleOam_3ea63c_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3ea664[33] = {
    [0] = {
        .pFrame = sParticleOam_3ea664_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sParticleOam_3ea664_Frame0,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [4] = {
        .pFrame = sParticleOam_3ea664_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [6] = {
        .pFrame = sParticleOam_3ea664_Frame4,
        .timer = 1
    },
    [7] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [8] = {
        .pFrame = sParticleOam_3ea664_Frame8,
        .timer = 1
    },
    [9] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [10] = {
        .pFrame = sParticleOam_3ea664_Frame8,
        .timer = 1
    },
    [11] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [12] = {
        .pFrame = sParticleOam_3ea664_Frame12,
        .timer = 1
    },
    [13] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [14] = {
        .pFrame = sParticleOam_3ea664_Frame12,
        .timer = 1
    },
    [15] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [16] = {
        .pFrame = sParticleOam_3ea664_Frame16,
        .timer = 1
    },
    [17] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [18] = {
        .pFrame = sParticleOam_3ea664_Frame16,
        .timer = 1
    },
    [19] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [20] = {
        .pFrame = sParticleOam_3ea664_Frame20,
        .timer = 1
    },
    [21] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [22] = {
        .pFrame = sParticleOam_3ea664_Frame20,
        .timer = 1
    },
    [23] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [24] = {
        .pFrame = sParticleOam_3ea664_Frame24,
        .timer = 1
    },
    [25] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [26] = {
        .pFrame = sParticleOam_3ea664_Frame24,
        .timer = 1
    },
    [27] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [28] = {
        .pFrame = sParticleOam_3ea664_Frame28,
        .timer = 1
    },
    [29] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [30] = {
        .pFrame = sParticleOam_3ea664_Frame28,
        .timer = 1
    },
    [31] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [32] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3ea76c[16] = {
    [0] = {
        .pFrame = sParticleOam_3ea76c_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sParticleOam_3ea76c_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [4] = {
        .pFrame = sParticleOam_3ea76c_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [6] = {
        .pFrame = sParticleOam_3ea76c_Frame6,
        .timer = 1
    },
    [7] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [8] = {
        .pFrame = sParticleOam_3ea76c_Frame8,
        .timer = 1
    },
    [9] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [10] = {
        .pFrame = sParticleOam_3ea76c_Frame10,
        .timer = 1
    },
    [11] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [12] = {
        .pFrame = sParticleOam_3ea76c_Frame12,
        .timer = 1
    },
    [13] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [14] = {
        .pFrame = sParticleOam_3ea76c_Frame14,
        .timer = 1
    },
    [15] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3ea7ec[33] = {
    [0] = {
        .pFrame = sParticleOam_3ea7ec_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sParticleOam_3ea7ec_Frame0,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [4] = {
        .pFrame = sParticleOam_3ea7ec_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [6] = {
        .pFrame = sParticleOam_3ea7ec_Frame4,
        .timer = 1
    },
    [7] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [8] = {
        .pFrame = sParticleOam_3ea7ec_Frame8,
        .timer = 1
    },
    [9] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [10] = {
        .pFrame = sParticleOam_3ea7ec_Frame8,
        .timer = 1
    },
    [11] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [12] = {
        .pFrame = sParticleOam_3ea7ec_Frame12,
        .timer = 1
    },
    [13] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [14] = {
        .pFrame = sParticleOam_3ea7ec_Frame12,
        .timer = 1
    },
    [15] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [16] = {
        .pFrame = sParticleOam_3ea7ec_Frame16,
        .timer = 1
    },
    [17] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [18] = {
        .pFrame = sParticleOam_3ea7ec_Frame16,
        .timer = 1
    },
    [19] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [20] = {
        .pFrame = sParticleOam_3ea7ec_Frame20,
        .timer = 1
    },
    [21] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [22] = {
        .pFrame = sParticleOam_3ea7ec_Frame20,
        .timer = 1
    },
    [23] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [24] = {
        .pFrame = sParticleOam_3ea7ec_Frame24,
        .timer = 1
    },
    [25] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [26] = {
        .pFrame = sParticleOam_3ea7ec_Frame24,
        .timer = 1
    },
    [27] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [28] = {
        .pFrame = sParticleOam_3ea7ec_Frame28,
        .timer = 1
    },
    [29] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [30] = {
        .pFrame = sParticleOam_3ea7ec_Frame28,
        .timer = 1
    },
    [31] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [32] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3ea8f4[16] = {
    [0] = {
        .pFrame = sParticleOam_3ea8f4_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sParticleOam_3ea8f4_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [4] = {
        .pFrame = sParticleOam_3ea8f4_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [6] = {
        .pFrame = sParticleOam_3ea8f4_Frame6,
        .timer = 1
    },
    [7] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [8] = {
        .pFrame = sParticleOam_3ea8f4_Frame8,
        .timer = 1
    },
    [9] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [10] = {
        .pFrame = sParticleOam_3ea8f4_Frame10,
        .timer = 1
    },
    [11] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [12] = {
        .pFrame = sParticleOam_3ea8f4_Frame12,
        .timer = 1
    },
    [13] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [14] = {
        .pFrame = sParticleOam_3ea8f4_Frame14,
        .timer = 1
    },
    [15] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3ea974[5] = {
    [0] = {
        .pFrame = sParticleOam_3ea974_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sParticleOam_3ea974_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sParticleOam_3ea974_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sParticleOam_3ea974_Frame3,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_Explosion4[7] = {
    [0] = {
        .pFrame = sParticleOam_Explosion4_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sParticleOam_Explosion4_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sParticleOam_Explosion4_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sParticleOam_Explosion4_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sParticleOam_Explosion4_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sParticleOam_Explosion4_Frame5,
        .timer = 6
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_Explosion3[7] = {
    [0] = {
        .pFrame = sParticleOam_Explosion2_Frame1,
        .timer = 6
    },
    [1] = {
        .pFrame = sParticleOam_Explosion2_Frame2,
        .timer = 6
    },
    [2] = {
        .pFrame = sParticleOam_Explosion2_Frame3,
        .timer = 6
    },
    [3] = {
        .pFrame = sParticleOam_Explosion3_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sParticleOam_Explosion3_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sParticleOam_Explosion3_Frame5,
        .timer = 6
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_SuperMissileExplosion[6] = {
    [0] = {
        .pFrame = sParticleOam_SuperMissileExplosion_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sParticleOam_SuperMissileExplosion_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sParticleOam_SuperMissileExplosion_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sParticleOam_SuperMissileExplosion_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sParticleOam_SuperMissileExplosion_Frame4,
        .timer = 3
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_NormalMissileExplosion[7] = {
    [0] = {
        .pFrame = sParticleOam_Explosion2_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sParticleOam_Explosion2_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sParticleOam_Explosion2_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sParticleOam_Explosion2_Frame4,
        .timer = 2
    },
    [4] = {
        .pFrame = sParticleOam_NormalMissileExplosion_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sParticleOam_NormalMissileExplosion_Frame5,
        .timer = 2
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_Explosion6[5] = {
    [0] = {
        .pFrame = sParticleOam_Explosion6_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sParticleOam_Explosion6_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sParticleOam_Explosion6_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sParticleOam_Explosion6_Frame3,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_Explosion5[5] = {
    [0] = {
        .pFrame = sParticleOam_Explosion5_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sParticleOam_Explosion5_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sParticleOam_Explosion5_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sParticleOam_Explosion5_Frame3,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3eaac4[33] = {
    [0] = {
        .pFrame = sParticleOam_3eaac4_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sParticleOam_3eaac4_Frame0,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [4] = {
        .pFrame = sParticleOam_3eaac4_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [6] = {
        .pFrame = sParticleOam_3eaac4_Frame4,
        .timer = 1
    },
    [7] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [8] = {
        .pFrame = sParticleOam_3eaac4_Frame8,
        .timer = 1
    },
    [9] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [10] = {
        .pFrame = sParticleOam_3eaac4_Frame8,
        .timer = 1
    },
    [11] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [12] = {
        .pFrame = sParticleOam_3eaac4_Frame12,
        .timer = 1
    },
    [13] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [14] = {
        .pFrame = sParticleOam_3eaac4_Frame12,
        .timer = 1
    },
    [15] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [16] = {
        .pFrame = sParticleOam_3eaac4_Frame16,
        .timer = 1
    },
    [17] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [18] = {
        .pFrame = sParticleOam_3eaac4_Frame16,
        .timer = 1
    },
    [19] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [20] = {
        .pFrame = sParticleOam_3eaac4_Frame20,
        .timer = 1
    },
    [21] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [22] = {
        .pFrame = sParticleOam_3eaac4_Frame20,
        .timer = 1
    },
    [23] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [24] = {
        .pFrame = sParticleOam_3eaac4_Frame24,
        .timer = 1
    },
    [25] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [26] = {
        .pFrame = sParticleOam_3eaac4_Frame24,
        .timer = 1
    },
    [27] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [28] = {
        .pFrame = sParticleOam_3eaac4_Frame28,
        .timer = 1
    },
    [29] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [30] = {
        .pFrame = sParticleOam_3eaac4_Frame28,
        .timer = 1
    },
    [31] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [32] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3eabcc[16] = {
    [0] = {
        .pFrame = sParticleOam_3eabcc_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sParticleOam_3eabcc_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [4] = {
        .pFrame = sParticleOam_3eabcc_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [6] = {
        .pFrame = sParticleOam_3eabcc_Frame6,
        .timer = 1
    },
    [7] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [8] = {
        .pFrame = sParticleOam_3eabcc_Frame8,
        .timer = 1
    },
    [9] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [10] = {
        .pFrame = sParticleOam_3eabcc_Frame10,
        .timer = 1
    },
    [11] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [12] = {
        .pFrame = sParticleOam_3eabcc_Frame12,
        .timer = 1
    },
    [13] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [14] = {
        .pFrame = sParticleOam_3eabcc_Frame14,
        .timer = 1
    },
    [15] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_IceMissileExplosion[6] = {
    [0] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame2,
        .timer = 16
    },
    [3] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame4,
        .timer = 8
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_DiffusionMissileExplosion[6] = {
    [0] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame2,
        .timer = 16
    },
    [3] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame4,
        .timer = 8
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_ChargedDiffusionMissileExplosion[7] = {
    [0] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sParticleOam_ChargedDiffusionMissileExplosion_Frame3,
        .timer = 14
    },
    [4] = {
        .pFrame = sParticleOam_ChargedDiffusionMissileExplosion_Frame4,
        .timer = 7
    },
    [5] = {
        .pFrame = sParticleOam_ChargedDiffusionMissileExplosion_Frame5,
        .timer = 7
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3eace4[6] = {
    [0] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sParticleOam_ChargedDiffusionMissileExplosion_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sParticleOam_ChargedDiffusionMissileExplosion_Frame4,
        .timer = 4
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_AbsorbIceXPreVaria[24] = {
    [0] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame0,
        .timer = 2
    },
    [3] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame1,
        .timer = 2
    },
    [4] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame2,
        .timer = 2
    },
    [5] = {
        .pFrame = sParticleOam_ChargedDiffusionMissileExplosion_Frame3,
        .timer = 2
    },
    [6] = {
        .pFrame = sParticleOam_IceMissileExplosion_Frame2,
        .timer = 2
    },
    [7] = {
        .pFrame = sParticleOam_ChargedDiffusionMissileExplosion_Frame3,
        .timer = 16
    },
    [8] = {
        .pFrame = sParticleOam_ChargedDiffusionMissileExplosion_Frame4,
        .timer = 4
    },
    [9] = {
        .pFrame = sParticleOam_ChargedDiffusionMissileExplosion_Frame5,
        .timer = 8
    },
    [10] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame10,
        .timer = 1
    },
    [11] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame11,
        .timer = 1
    },
    [12] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame12,
        .timer = 1
    },
    [13] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame13,
        .timer = 1
    },
    [14] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame14,
        .timer = 1
    },
    [15] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame15,
        .timer = 1
    },
    [16] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame16,
        .timer = 8
    },
    [17] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame17,
        .timer = 8
    },
    [18] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame18,
        .timer = 8
    },
    [19] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame19,
        .timer = 8
    },
    [20] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame20,
        .timer = 8
    },
    [21] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame21,
        .timer = 8
    },
    [22] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame22,
        .timer = 8
    },
    [23] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3eadd4[33] = {
    [0] = {
        .pFrame = sParticleOam_3ea664_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sParticleOam_3ea7ec_Frame0,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [4] = {
        .pFrame = sParticleOam_3eaac4_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [6] = {
        .pFrame = sParticleOam_3ea664_Frame4,
        .timer = 1
    },
    [7] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [8] = {
        .pFrame = sParticleOam_3ea7ec_Frame8,
        .timer = 1
    },
    [9] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [10] = {
        .pFrame = sParticleOam_3eaac4_Frame8,
        .timer = 1
    },
    [11] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [12] = {
        .pFrame = sParticleOam_3ea664_Frame12,
        .timer = 1
    },
    [13] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [14] = {
        .pFrame = sParticleOam_3ea7ec_Frame12,
        .timer = 1
    },
    [15] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [16] = {
        .pFrame = sParticleOam_3eaac4_Frame16,
        .timer = 1
    },
    [17] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [18] = {
        .pFrame = sParticleOam_3ea664_Frame16,
        .timer = 1
    },
    [19] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [20] = {
        .pFrame = sParticleOam_3ea7ec_Frame20,
        .timer = 1
    },
    [21] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [22] = {
        .pFrame = sParticleOam_3eaac4_Frame20,
        .timer = 1
    },
    [23] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [24] = {
        .pFrame = sParticleOam_3ea664_Frame24,
        .timer = 1
    },
    [25] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [26] = {
        .pFrame = sParticleOam_3ea7ec_Frame24,
        .timer = 1
    },
    [27] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [28] = {
        .pFrame = sParticleOam_3eaac4_Frame28,
        .timer = 1
    },
    [29] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [30] = {
        .pFrame = sParticleOam_3ea664_Frame28,
        .timer = 1
    },
    [31] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [32] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3eaedc[16] = {
    [0] = {
        .pFrame = sParticleOam_3ea76c_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sParticleOam_3ea8f4_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [4] = {
        .pFrame = sParticleOam_3eabcc_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [6] = {
        .pFrame = sParticleOam_3ea76c_Frame6,
        .timer = 1
    },
    [7] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [8] = {
        .pFrame = sParticleOam_3ea8f4_Frame8,
        .timer = 1
    },
    [9] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [10] = {
        .pFrame = sParticleOam_3eabcc_Frame10,
        .timer = 1
    },
    [11] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [12] = {
        .pFrame = sParticleOam_3ea76c_Frame12,
        .timer = 1
    },
    [13] = {
        .pFrame = sParticleOam_3ea664_Frame1,
        .timer = 1
    },
    [14] = {
        .pFrame = sParticleOam_3ea8f4_Frame14,
        .timer = 1
    },
    [15] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_ParticleIceXTrail[7] = {
    [0] = {
        .pFrame = sParticleOam_ParticleIceXTrail_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sParticleOam_ParticleIceXTrail_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sParticleOam_ParticleIceXTrail_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sParticleOam_ParticleIceXTrail_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sParticleOam_ParticleIceXTrail_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sParticleOam_ParticleIceXTrail_Frame5,
        .timer = 8
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_Diffusion[8] = {
    [0] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame16,
        .timer = 8
    },
    [1] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame17,
        .timer = 8
    },
    [2] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame18,
        .timer = 8
    },
    [3] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame19,
        .timer = 8
    },
    [4] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame20,
        .timer = 8
    },
    [5] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame21,
        .timer = 8
    },
    [6] = {
        .pFrame = sParticleOam_AbsorbIceXPreVaria_Frame22,
        .timer = 8
    },
    [7] = FRAME_DATA_TERMINATOR
};

static const u16 sSpriteDebrisOam_Cloud1_Frame5[] = {
    2,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0x171,
    0xec, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188
};

static const u16 sSpriteDebrisOam_Cloud1_Frame6[] = {
    2,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0x170,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a
};

static const u16 sSpriteDebrisOam_Cloud1_Frame7[] = {
    2,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0x16f,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c
};

static const u16 sSpriteDebrisOam_Cloud1_Frame8[] = {
    2,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0x16f,
    0xd4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e
};

static const u16 sSpriteDebrisOam_Cloud1_Frame9[] = {
    2,
    0xd0, 0x1fc, OBJ_PALETTE_3 | 0x15c,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0x16e
};

static const u16 sSpriteDebrisOam_Cloud1_Frame10[] = {
    1,
    0xfc, OBJ_X_FLIP | 0x1fc, OBJ_PALETTE_3 | 0x16e
};

static const u16 sParticleOam_HeavyDust_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_HeavyDust_Frame1[] = {
    1,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a
};

static const u16 sParticleOam_HeavyDust_Frame2[] = {
    1,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c
};

static const u16 sParticleOam_HeavyDust_Frame3[] = {
    1,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e
};

static const u16 sSpriteDebrisOam_Cloud1_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x190
};

static const u16 sSpriteDebrisOam_Cloud1_Frame1[] = {
    2,
    0xf6, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_3 | 0x192,
    0xfa, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x190
};

static const u16 sSpriteDebrisOam_Cloud1_Frame2[] = {
    2,
    0xf6, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x194,
    0xfa, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x192
};

static const u16 sSpriteDebrisOam_Cloud1_Frame3[] = {
    2,
    0xf6, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x196,
    0xfa, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_3 | 0x194
};

static const u16 sSpriteDebrisOam_Cloud1_Frame4[] = {
    1,
    0xfa, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x196
};

static const u16 sParticleOam_EnterOrExitWater_Frame0[] = {
    3,
    0xfb, 0x1fb, OBJ_PALETTE_3 | 0x15f,
    0xfb, 0x1fd, OBJ_PALETTE_3 | 0x15f,
    0xfb, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_EnterOrExitWater_Frame1[] = {
    3,
    0xf8, 0x1fa, OBJ_PALETTE_3 | 0x15f,
    0xf8, 0x1fd, OBJ_PALETTE_3 | 0x15f,
    0xfc, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_EnterOrExitWater_Frame2[] = {
    5,
    0xfd, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a,
    0xf4, 0x1fa, OBJ_PALETTE_3 | 0x15f,
    0xf4, 0x1fe, OBJ_PALETTE_3 | 0x15f,
    0xfa, 0x1fa, OBJ_PALETTE_3 | 0x17f,
    0xfa, 0x1fe, OBJ_PALETTE_3 | 0x17f
};

static const u16 sParticleOam_EnterOrExitWater_Frame3[] = {
    7,
    0xf0, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_3 | 0x15f,
    0xf0, OBJ_X_FLIP | 0x1f9, OBJ_PALETTE_3 | 0x15f,
    0xf8, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_3 | 0x17f,
    0xf8, OBJ_X_FLIP | 0x1f9, OBJ_PALETTE_3 | 0x17f,
    0xfe, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a,
    0xec, 0x0, OBJ_PALETTE_3 | 0x15b,
    0xec, 0x1f8, OBJ_PALETTE_3 | 0x15b
};

static const u16 sParticleOam_EnterOrExitWater_Frame4[] = {
    7,
    0xf8, 0x1f8, OBJ_PALETTE_3 | 0x17f,
    0xf8, 0x0, OBJ_PALETTE_3 | 0x17f,
    0xf2, 0x1f8, OBJ_PALETTE_3 | 0x15f,
    0xf2, 0x0, OBJ_PALETTE_3 | 0x15f,
    0xea, 0x0, OBJ_PALETTE_3 | 0x15b,
    0xea, 0x1f8, OBJ_PALETTE_3 | 0x15b,
    0xff, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c
};

static const u16 sParticleOam_EnterOrExitWater_Frame5[] = {
    7,
    0x0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c,
    0xf9, OBJ_X_FLIP | 0x1f7, OBJ_PALETTE_3 | 0x17f,
    0xf9, OBJ_X_FLIP | 0x1, OBJ_PALETTE_3 | 0x17f,
    0xf5, OBJ_X_FLIP | 0x1f7, OBJ_PALETTE_3 | 0x15f,
    0xf5, OBJ_X_FLIP | 0x1, OBJ_PALETTE_3 | 0x15f,
    0xee, 0x0, OBJ_PALETTE_3 | 0x15b,
    0xee, 0x1f8, OBJ_PALETTE_3 | 0x15b
};

static const u16 sParticleOam_EnterOrExitWater_Frame6[] = {
    5,
    0xf8, 0x1f7, OBJ_PALETTE_3 | 0x15f,
    0xf8, 0x1, OBJ_PALETTE_3 | 0x15f,
    0xf4, 0x0, OBJ_PALETTE_3 | 0x15c,
    0xf4, 0x1f8, OBJ_PALETTE_3 | 0x15c,
    0x1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_EnterOrExitWater_Frame7[] = {
    5,
    0x2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e,
    0xfc, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_3 | 0x15f,
    0xfc, OBJ_X_FLIP | 0x2, OBJ_PALETTE_3 | 0x15f,
    0xf8, 0x0, OBJ_PALETTE_3 | 0x15c,
    0xf8, 0x1f8, OBJ_PALETTE_3 | 0x15c
};

static const u16 sParticleOam_3ec240_Frame0[] = {
    1,
    0xfe, 0x1fc, OBJ_PALETTE_3 | 0x161
};

static const u16 sParticleOam_3ec240_Frame1[] = {
    1,
    0x0, 0x1fc, OBJ_PALETTE_3 | 0x161
};

static const u16 sParticleOam_3ec240_Frame2[] = {
    1,
    0x0, 0x1fc, OBJ_PALETTE_3 | 0x162
};

static const u16 sParticleOam_3ec270_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0x160
};

static const u16 sParticleOam_3ec280_Frame0[] = {
    2,
    0xf8, 0x1fa, OBJ_PALETTE_3 | 0xc0,
    0xf8, 0x1fe, OBJ_PALETTE_3 | 0xc0
};

static const u16 sParticleOam_3ec280_Frame1[] = {
    2,
    0xf8, 0x1fa, OBJ_PALETTE_3 | 0xc1,
    0xf8, 0x1fe, OBJ_PALETTE_3 | 0xc1
};

static const u16 sParticleOam_3ec280_Frame2[] = {
    2,
    0xf8, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_3 | 0xc2,
    0xf8, 0x1fe, OBJ_PALETTE_3 | 0xc2
};

static const u16 sParticleOam_3ec280_Frame3[] = {
    2,
    0xf8, 0x1fa, OBJ_PALETTE_3 | 0xc3,
    0xf8, OBJ_X_FLIP | 0x1fe, OBJ_PALETTE_3 | 0xc3
};

static const u16 sParticleOam_3ec280_Frame4[] = {
    2,
    0xf8, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_3 | 0xc4,
    0xf8, 0x1fe, OBJ_PALETTE_3 | 0xc4
};

static const u16 sParticleOam_3ec2b0_Frame0[] = {
    2,
    0xfa, 0x1f9, OBJ_PALETTE_3 | 0x178,
    0xf9, 0x1fd, OBJ_PALETTE_3 | 0x17a
};

static const u16 sParticleOam_3ec2b0_Frame1[] = {
    3,
    0xf6, 0x1f9, OBJ_PALETTE_3 | 0x179,
    0xfa, 0x1fe, OBJ_PALETTE_3 | 0x178,
    0xfe, 0x1fc, OBJ_PALETTE_3 | 0x178
};

static const u16 sParticleOam_3ec2b0_Frame2[] = {
    5,
    0xf4, 0x1f8, OBJ_PALETTE_3 | 0x17a,
    0xf8, 0x1fe, OBJ_PALETTE_3 | 0x179,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0x178,
    0xf0, 0x1fc, OBJ_PALETTE_3 | 0x179,
    0xfe, 0x1fb, OBJ_PALETTE_3 | 0x179
};

static const u16 sParticleOam_3ec2b0_Frame3[] = {
    5,
    0xf2, 0x1f7, OBJ_PALETTE_3 | 0x17b,
    0xf6, 0x1fe, OBJ_PALETTE_3 | 0x17a,
    0xfa, 0x1fc, OBJ_PALETTE_3 | 0x179,
    0xee, 0x1fd, OBJ_PALETTE_3 | 0x17a,
    0xfc, 0x1fb, OBJ_PALETTE_3 | 0x17a
};

static const u16 sParticleOam_3ec2b0_Frame4[] = {
    5,
    0xf4, 0x1ff, OBJ_PALETTE_3 | 0x17b,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x17a,
    0xec, 0x1fe, OBJ_PALETTE_3 | 0x17b,
    0xfb, 0x1fa, OBJ_PALETTE_3 | 0x17b,
    0xfc, 0x1fd, OBJ_PALETTE_3 | 0x179
};

static const u16 sParticleOam_3ec2b0_Frame5[] = {
    2,
    0xf6, 0x1fc, OBJ_PALETTE_3 | 0x17b,
    0xfa, 0x1fd, OBJ_PALETTE_3 | 0x179
};

static const u16 sParticleOam_3ec2b0_Frame6[] = {
    1,
    0xf8, 0x1fd, OBJ_PALETTE_3 | 0x17a
};

static const u16 sParticleOam_3ec2b0_Frame7[] = {
    1,
    0xf6, 0x1fd, OBJ_PALETTE_3 | 0x17b
};

static const u16 sParticleOam_3ec2f8_Frame0[] = {
    2,
    0xf6, 0x1fb, OBJ_PALETTE_3 | 0x178,
    0xfb, 0x1fb, OBJ_PALETTE_3 | 0x179
};

static const u16 sParticleOam_3ec2f8_Frame1[] = {
    2,
    0xf3, 0x1fc, OBJ_PALETTE_3 | 0x179,
    0xfa, 0x1fc, OBJ_PALETTE_3 | 0x178
};

static const u16 sParticleOam_3ec2f8_Frame2[] = {
    3,
    0xf1, 0x1fd, OBJ_PALETTE_3 | 0x17a,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x179,
    0xfa, 0x0, OBJ_PALETTE_3 | 0x178
};

static const u16 sParticleOam_3ec2f8_Frame3[] = {
    4,
    0xee, 0x1fe, OBJ_PALETTE_3 | 0x17b,
    0xf6, 0x1fc, OBJ_PALETTE_3 | 0x17a,
    0xf8, 0x0, OBJ_PALETTE_3 | 0x179,
    0xee, 0x3, OBJ_PALETTE_3 | 0x179
};

static const u16 sParticleOam_3ec2f8_Frame4[] = {
    4,
    0xf4, 0x1fc, OBJ_PALETTE_3 | 0x17b,
    0xf6, 0x1, OBJ_PALETTE_3 | 0x17a,
    0xf2, 0x1fc, OBJ_PALETTE_3 | 0x179,
    0xec, 0x5, OBJ_PALETTE_3 | 0x17a
};

static const u16 sParticleOam_3ec2f8_Frame5[] = {
    4,
    0xf4, 0x2, OBJ_PALETTE_3 | 0x17b,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x179,
    0xef, 0x1fd, OBJ_PALETTE_3 | 0x17a,
    0xea, 0x6, OBJ_PALETTE_3 | 0x17b
};

static const u16 sParticleOam_3ec2f8_Frame6[] = {
    2,
    0xf6, 0x1fc, OBJ_PALETTE_3 | 0x17a,
    0xec, 0x1fe, OBJ_PALETTE_3 | 0x17b
};

static const u16 sParticleOam_3ec2f8_Frame7[] = {
    2,
    0xf4, 0x1fc, OBJ_PALETTE_3 | 0x17b,
    0xfb, 0x1fb, OBJ_PALETTE_3 | 0x178
};

static const u16 sParticleOam_3ec2f8_Frame8[] = {
    1,
    0xf8, 0x1fb, OBJ_PALETTE_3 | 0x179
};

static const u16 sParticleOam_EnterOrExitWaterBig_Frame0[] = {
    4,
    0xfc, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_3 | 0x188,
    0xfc, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x188,
    0xf8, 0x1f9, OBJ_PALETTE_3 | 0x15f,
    0xf8, 0x1ff, OBJ_PALETTE_3 | 0x15f
};

static const u16 sParticleOam_EnterOrExitWaterBig_Frame1[] = {
    6,
    0xfe, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_3 | 0x188,
    0xfe, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_3 | 0x188,
    0xf4, 0x1f8, OBJ_PALETTE_3 | 0x15f,
    0xf8, 0x1f8, OBJ_PALETTE_3 | 0x17f,
    0xf4, 0x0, OBJ_PALETTE_3 | 0x15f,
    0xf8, 0x0, OBJ_PALETTE_3 | 0x17f
};

static const u16 sParticleOam_EnterOrExitWaterBig_Frame2[] = {
    8,
    0xff, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_3 | 0x18a,
    0xff, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_3 | 0x18a,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, OBJ_PALETTE_3 | 0x15f,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f3, OBJ_PALETTE_3 | 0x15f,
    0xe8, 0x1f3, OBJ_PALETTE_3 | 0x15b,
    0xe8, 0x5, OBJ_PALETTE_3 | 0x15b,
    0xf8, 0x1f9, OBJ_PALETTE_3 | 0x15f,
    0xf8, 0x1ff, OBJ_PALETTE_3 | 0x15f
};

static const u16 sParticleOam_EnterOrExitWaterBig_Frame3[] = {
    12,
    0x0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x18a,
    0x0, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x18a,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f0, OBJ_PALETTE_3 | 0x15f,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x8, OBJ_PALETTE_3 | 0x15f,
    0xe4, 0x1f3, OBJ_PALETTE_3 | 0x15b,
    0xe4, 0x5, OBJ_PALETTE_3 | 0x15b,
    0xed, 0x0, OBJ_PALETTE_3 | 0x15b,
    0xed, 0x1f8, OBJ_PALETTE_3 | 0x15b,
    0xf4, 0x1f8, OBJ_PALETTE_3 | 0x15f,
    0xf8, 0x1f8, OBJ_PALETTE_3 | 0x17f,
    0xf4, 0x0, OBJ_PALETTE_3 | 0x15f,
    0xf8, 0x0, OBJ_PALETTE_3 | 0x17f
};

static const u16 sParticleOam_EnterOrExitWaterBig_Frame4[] = {
    12,
    0x1, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x18c,
    0x1, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x18c,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1, OBJ_PALETTE_3 | 0x15f,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f7, OBJ_PALETTE_3 | 0x15f,
    0xe6, 0x7, OBJ_PALETTE_3 | 0x15b,
    0xe8, 0x1f7, OBJ_PALETTE_3 | 0x15b,
    0xf5, 0x1ef, OBJ_PALETTE_3 | 0x15f,
    0xf8, 0x1ef, OBJ_PALETTE_3 | 0x17f,
    0xf5, 0x9, OBJ_PALETTE_3 | 0x15f,
    0xf8, 0x9, OBJ_PALETTE_3 | 0x17f,
    0xe6, 0x1f1, OBJ_PALETTE_3 | 0x15b,
    0xe8, 0x1, OBJ_PALETTE_3 | 0x15b
};

static const u16 sParticleOam_EnterOrExitWaterBig_Frame5[] = {
    12,
    0x2, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x18c,
    0x2, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x18c,
    0xeb, 0x1f0, OBJ_PALETTE_3 | 0x15c,
    0xe8, 0x1, OBJ_PALETTE_3 | 0x15c,
    0xf8, 0x1ee, OBJ_PALETTE_3 | 0x15f,
    0xf8, 0xa, OBJ_PALETTE_3 | 0x15f,
    0xf5, 0x2, OBJ_PALETTE_3 | 0x15f,
    0xf8, 0x2, OBJ_PALETTE_3 | 0x17f,
    0xf5, 0x1f6, OBJ_PALETTE_3 | 0x15f,
    0xf8, 0x1f6, OBJ_PALETTE_3 | 0x17f,
    0xe8, 0x1f7, OBJ_PALETTE_3 | 0x15c,
    0xeb, 0x8, OBJ_PALETTE_3 | 0x15c
};

static const u16 sParticleOam_EnterOrExitWaterBig_Frame6[] = {
    8,
    0x3, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x18e,
    0x3, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x18e,
    0xf8, 0x3, OBJ_PALETTE_3 | 0x15f,
    0xf8, 0x1f5, OBJ_PALETTE_3 | 0x15f,
    0xf0, 0x1f8, OBJ_PALETTE_3 | 0x15c,
    0xf0, 0x0, OBJ_PALETTE_3 | 0x15c,
    0xf6, 0x1f0, OBJ_PALETTE_3 | 0x15c,
    0xf6, 0x8, OBJ_PALETTE_3 | 0x15c
};

static const u16 sParticleOam_EnterOrExitWaterBig_Frame7[] = {
    6,
    0x5, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x18e,
    0x5, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x18e,
    0xf4, 0x1f8, OBJ_PALETTE_3 | 0x15c,
    0xf4, 0x0, OBJ_PALETTE_3 | 0x15c,
    0xfa, 0x1f0, OBJ_PALETTE_3 | 0x15c,
    0xfa, 0x8, OBJ_PALETTE_3 | 0x15c
};

static const u16 sParticleOam_SpriteEnterOrExitWater_Frame0[] = {
    2,
    0xfc, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_SpriteEnterOrExitWater_Frame1[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188,
    0xfc, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188,
    0xfc, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x188,
    0xf2, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_SpriteEnterOrExitWater_Frame2[] = {
    9,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188,
    0xfd, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a,
    0xf0, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x18a,
    0xe8, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x188,
    0xfc, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x188,
    0xfc, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_3 | 0x188,
    0xf2, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_SpriteEnterOrExitWater_Frame3[] = {
    11,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e,
    0xfd, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a,
    0xe8, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_3 | 0x18a,
    0xf0, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_3 | 0x18c,
    0xe0, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_3 | 0x188,
    0xfd, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_3 | 0x18a,
    0xf0, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_3 | 0x18a,
    0xe8, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_3 | 0x188,
    0xfc, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_SpriteEnterOrExitWater_Frame4[] = {
    13,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c,
    0xe0, 0x1f8, OBJ_PALETTE_3 | 0x15b,
    0xe0, 0x0, OBJ_PALETTE_3 | 0x15b,
    0xfe, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c,
    0xe0, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_3 | 0x18a,
    0xe8, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_3 | 0x18c,
    0xf0, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_3 | 0x18e,
    0xfd, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_3 | 0x18a,
    0xe8, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_3 | 0x18a,
    0xf0, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_3 | 0x18c,
    0xe0, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_3 | 0x188,
    0xfd, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_3 | 0x18a
};

static const u16 sParticleOam_SpriteEnterOrExitWater_Frame5[] = {
    13,
    0xe4, 0x1, OBJ_PALETTE_3 | 0x15b,
    0xe4, 0x1f7, OBJ_PALETTE_3 | 0x15b,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a,
    0xfe, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c,
    0xe8, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_3 | 0x18a,
    0xf0, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_3 | 0x18c,
    0xe0, 0x1f2, OBJ_PALETTE_3 | 0x15b,
    0xfe, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_3 | 0x18c,
    0xe0, 0x1ea, OBJ_PALETTE_3 | 0x15b,
    0xe0, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_3 | 0x18a,
    0xe8, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_3 | 0x18c,
    0xf0, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_3 | 0x18e,
    0xfd, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_3 | 0x18a
};

static const u16 sParticleOam_SpriteEnterOrExitWater_Frame6[] = {
    12,
    0xff, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e,
    0xec, 0x2, OBJ_PALETTE_3 | 0x15c,
    0xec, 0x1f6, OBJ_PALETTE_3 | 0x15c,
    0xe4, 0x1f2, OBJ_PALETTE_3 | 0x15b,
    0xe4, 0x1e8, OBJ_PALETTE_3 | 0x15b,
    0xf0, OBJ_SIZE_16x16 | 0x1e9, OBJ_PALETTE_3 | 0x18a,
    0xfe, OBJ_SIZE_16x16 | 0x1e9, OBJ_PALETTE_3 | 0x18c,
    0xe8, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_3 | 0x18a,
    0xf0, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_3 | 0x18c,
    0xe0, 0xe, OBJ_PALETTE_3 | 0x15b,
    0xfe, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_3 | 0x18c,
    0xe0, 0x6, OBJ_PALETTE_3 | 0x15b
};

static const u16 sParticleOam_SpriteEnterOrExitWater_Frame7[] = {
    10,
    0x0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e,
    0xf4, 0x3, OBJ_PALETTE_3 | 0x15c,
    0xf4, 0x1f5, OBJ_PALETTE_3 | 0x15c,
    0xff, OBJ_SIZE_16x16 | 0x1e9, OBJ_PALETTE_3 | 0x18e,
    0xec, 0x1f3, OBJ_PALETTE_3 | 0x15c,
    0xec, 0x1e7, OBJ_PALETTE_3 | 0x15c,
    0xe4, 0xf, OBJ_PALETTE_3 | 0x15b,
    0xe4, 0x5, OBJ_PALETTE_3 | 0x15b,
    0xf0, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_3 | 0x18a,
    0xfe, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_3 | 0x18c
};

static const u16 sParticleOam_SpriteEnterOrExitWater_Frame8[] = {
    6,
    0x0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x18e,
    0xf4, 0x1f3, OBJ_PALETTE_3 | 0x15c,
    0xf4, 0x1e5, OBJ_PALETTE_3 | 0x15c,
    0xff, OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_3 | 0x18e,
    0xec, 0x11, OBJ_PALETTE_3 | 0x15c,
    0xec, 0x5, OBJ_PALETTE_3 | 0x15c
};

static const u16 sParticleOam_SpriteEnterOrExitWater_Frame9[] = {
    3,
    0x0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x18e,
    0xf4, 0x13, OBJ_PALETTE_3 | 0x15c,
    0xf4, 0x5, OBJ_PALETTE_3 | 0x15c
};

static const u16 sSpriteDebrisOam_Cloud2_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0x190
};

static const u16 sSpriteDebrisOam_Cloud2_Frame1[] = {
    2,
    0xf6, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_4 | 0x192,
    0xfa, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_4 | 0x190
};

static const u16 sSpriteDebrisOam_Cloud2_Frame2[] = {
    2,
    0xf6, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x194,
    0xfa, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x192
};

static const u16 sSpriteDebrisOam_Cloud2_Frame3[] = {
    2,
    0xf6, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_4 | 0x196,
    0xfa, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_4 | 0x194
};

static const u16 sSpriteDebrisOam_Cloud2_Frame4[] = {
    1,
    0xfa, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_4 | 0x196
};

static const u16 sSpriteDebrisOam_Cloud2_Frame5[] = {
    2,
    0xfc, 0x1fc, OBJ_PALETTE_4 | 0x171,
    0xec, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188
};

static const u16 sSpriteDebrisOam_Cloud2_Frame6[] = {
    2,
    0xfc, 0x1fc, OBJ_PALETTE_4 | 0x170,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a
};

static const u16 sSpriteDebrisOam_Cloud2_Frame7[] = {
    2,
    0xfc, 0x1fc, OBJ_PALETTE_4 | 0x16f,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c
};

static const u16 sSpriteDebrisOam_Cloud2_Frame8[] = {
    2,
    0xfc, 0x1fc, OBJ_PALETTE_4 | 0x16f,
    0xd4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e
};

static const u16 sSpriteDebrisOam_Cloud2_Frame9[] = {
    2,
    0xd0, 0x1fc, OBJ_PALETTE_3 | 0x15c,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0x16e
};

static const u16 sSpriteDebrisOam_Cloud2_Frame10[] = {
    1,
    0xfc, OBJ_X_FLIP | 0x1fc, OBJ_PALETTE_3 | 0x16e
};

static const u16 sSpriteDebrisOam_Cloud3_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0x171
};

static const u16 sSpriteDebrisOam_Cloud3_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0x170
};

static const u16 sSpriteDebrisOam_Cloud3_Frame2[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0x16f
};

static const u16 sSpriteDebrisOam_Cloud3_Frame3[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0x16e
};

static const u16 sParticleOam_OutwardIceExplosion_Frame0[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_4 | 0x190,
    0xf0, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_4 | 0x190
};

static const u16 sParticleOam_OutwardIceExplosion_Frame1[] = {
    6,
    0xf0, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_4 | 0x192,
    0xf0, OBJ_SIZE_16x16 | 0x1e2, OBJ_PALETTE_4 | 0x190,
    0xec, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_4 | 0x190,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_4 | 0x192,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_4 | 0x190,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_4 | 0x190
};

static const u16 sParticleOam_OutwardIceExplosion_Frame2[] = {
    10,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x194,
    0xf0, OBJ_SIZE_16x16 | 0x1e1, OBJ_PALETTE_4 | 0x192,
    0xf0, OBJ_SIZE_16x16 | 0x1d2, OBJ_PALETTE_4 | 0x190,
    0xea, OBJ_SIZE_16x16 | 0x1e1, OBJ_PALETTE_4 | 0x190,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x192,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x194,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xf, OBJ_PALETTE_4 | 0x192,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_4 | 0x190,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xf, OBJ_PALETTE_4 | 0x190,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x192
};

static const u16 sParticleOam_OutwardIceExplosion_Frame3[] = {
    12,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_4 | 0x196,
    0xf0, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_4 | 0x194,
    0xf0, OBJ_SIZE_16x16 | 0x1d1, OBJ_PALETTE_4 | 0x192,
    0xe8, OBJ_SIZE_16x16 | 0x1d0, OBJ_PALETTE_4 | 0x190,
    0xea, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_4 | 0x192,
    0xec, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_4 | 0x194,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_4 | 0x196,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_4 | 0x194,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_4 | 0x192,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_4 | 0x190,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_4 | 0x192,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_4 | 0x194
};

static const u16 sParticleOam_OutwardIceExplosion_Frame4[] = {
    12,
    0xf0, OBJ_SIZE_16x16 | 0x1df, OBJ_PALETTE_4 | 0x196,
    0xf0, OBJ_SIZE_16x16 | 0x1d0, OBJ_PALETTE_4 | 0x194,
    0xe6, OBJ_SIZE_16x16 | 0x1ce, OBJ_PALETTE_4 | 0x192,
    0xea, OBJ_SIZE_16x16 | 0x1df, OBJ_PALETTE_4 | 0x194,
    0xec, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_4 | 0x196,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_4 | 0x196,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_4 | 0x194,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x22, OBJ_PALETTE_4 | 0x192,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_4 | 0x194,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_4 | 0x196,
    0xec, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_4 | 0x190,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_4 | 0x190
};

static const u16 sParticleOam_OutwardIceExplosion_Frame5[] = {
    8,
    0xf0, OBJ_SIZE_16x16 | 0x1cf, OBJ_PALETTE_4 | 0x196,
    0xe4, OBJ_SIZE_16x16 | 0x1cc, OBJ_PALETTE_4 | 0x194,
    0xe8, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_4 | 0x196,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x21, OBJ_PALETTE_4 | 0x196,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x24, OBJ_PALETTE_4 | 0x194,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_4 | 0x196,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_4 | 0x192,
    0xec, OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_4 | 0x192
};

static const u16 sParticleOam_OutwardIceExplosion_Frame6[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1ca, OBJ_PALETTE_4 | 0x196,
    0xe2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x26, OBJ_PALETTE_4 | 0x196,
    0xec, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_4 | 0x194,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_4 | 0x194
};

static const u16 sParticleOam_OutwardIceExplosion_Frame7[] = {
    2,
    0xec, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_4 | 0x196,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_4 | 0x196
};

static const u16 sParticleOam_ScrewAttackKilled_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xca
};

static const u16 sParticleOam_ScrewAttackKilled_Frame1[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_3 | 0xe5,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0xe5,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0xe5,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0xe5
};

static const u16 sParticleOam_ScrewAttackKilled_Frame2[] = {
    8,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x106,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x106,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x106,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x106,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_3 | 0x190,
    0xee, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_3 | 0x190,
    0x2, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_3 | 0x190,
    0x2, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_3 | 0x190
};

static const u16 sParticleOam_ScrewAttackKilled_Frame3[] = {
    12,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x108,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x108,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x108,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x108,
    0xe8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x192,
    0xe0, OBJ_SIZE_16x16 | 0x1dc, OBJ_PALETTE_3 | 0x190,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x192,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x14, OBJ_PALETTE_3 | 0x190,
    0x8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x192,
    0x10, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_3 | 0x190,
    0x8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x192,
    0x10, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_3 | 0x190
};

static const u16 sParticleOam_ScrewAttackKilled_Frame4[] = {
    16,
    0xe8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x18c,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x18c,
    0xe0, OBJ_SIZE_16x16 | 0x1dc, OBJ_PALETTE_3 | 0x192,
    0xd8, OBJ_SIZE_16x16 | 0x1d0, OBJ_PALETTE_3 | 0x190,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x14, OBJ_PALETTE_3 | 0x192,
    0xd8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_3 | 0x190,
    0x8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x18c,
    0x8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x18c,
    0x10, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_3 | 0x192,
    0x18, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_3 | 0x190,
    0x10, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_3 | 0x192,
    0x18, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_3 | 0x190,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10a,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10a,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10a
};

static const u16 sParticleOam_ScrewAttackKilled_Frame5[] = {
    16,
    0xe8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x18e,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x18e,
    0xd8, OBJ_SIZE_16x16 | 0x1ce, OBJ_PALETTE_3 | 0x192,
    0xd8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x22, OBJ_PALETTE_3 | 0x192,
    0xe0, OBJ_SIZE_16x16 | 0x1dc, OBJ_PALETTE_3 | 0x18c,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x14, OBJ_PALETTE_3 | 0x18c,
    0x8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x18e,
    0x8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x18e,
    0x1a, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1d6, OBJ_PALETTE_3 | 0x192,
    0x1a, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1a, OBJ_PALETTE_3 | 0x192,
    0x10, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_3 | 0x18c,
    0x10, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_3 | 0x18c,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10c,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10c,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10c
};

static const u16 sParticleOam_ScrewAttackKilled_Frame6[] = {
    8,
    0xd6, OBJ_SIZE_16x16 | 0x1cc, OBJ_PALETTE_3 | 0x18c,
    0xe0, OBJ_SIZE_16x16 | 0x1dc, OBJ_PALETTE_3 | 0x18e,
    0xd6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x24, OBJ_PALETTE_3 | 0x18c,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x14, OBJ_PALETTE_3 | 0x18e,
    0x1c, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1d4, OBJ_PALETTE_3 | 0x18c,
    0x10, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_3 | 0x18e,
    0x1c, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1c, OBJ_PALETTE_3 | 0x18c,
    0x10, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_ScrewAttackKilled_Frame7[] = {
    4,
    0xd4, OBJ_SIZE_16x16 | 0x1ca, OBJ_PALETTE_3 | 0x18e,
    0xd4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x26, OBJ_PALETTE_3 | 0x18e,
    0x1e, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1d2, OBJ_PALETTE_3 | 0x18e,
    0x1e, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_SpeedboosterKilled_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xca
};

static const u16 sParticleOam_SpeedboosterKilled_Frame1[] = {
    5,
    0xf8, 0x1f8, OBJ_PALETTE_3 | 0xe5,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0xe5,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0xe5,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0xe5,
    0xf4, 0x1f4, OBJ_PALETTE_3 | 0xca
};

static const u16 sParticleOam_SpeedboosterKilled_Frame2[] = {
    9,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x106,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x106,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x106,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x106,
    0xf0, 0x1f0, OBJ_PALETTE_3 | 0xe5,
    0xf8, OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_3 | 0xe5,
    0xf0, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_3 | 0xe5,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0xe5,
    0xec, 0x4, OBJ_PALETTE_3 | 0xca
};

static const u16 sParticleOam_SpeedboosterKilled_Frame3[] = {
    12,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x108,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x108,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x108,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x108,
    0xe8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x106,
    0xf8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x106,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x106,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x106,
    0xe8, 0x0, OBJ_PALETTE_3 | 0xe5,
    0xf0, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0xe5,
    0xe8, OBJ_X_FLIP | 0x8, OBJ_PALETTE_3 | 0xe5,
    0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x8, OBJ_PALETTE_3 | 0xe5
};

static const u16 sParticleOam_SpeedboosterKilled_Frame4[] = {
    12,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10a,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10a,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10a,
    0xe8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x108,
    0xf8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x108,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x108,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x108,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x106,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x106,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x106,
    0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x106
};

static const u16 sParticleOam_SpeedboosterKilled_Frame5[] = {
    12,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10c,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10c,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10c,
    0xe8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x10a,
    0xf8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x10a,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x10a,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x10a,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x108,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x108,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x108,
    0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x108
};

static const u16 sParticleOam_SpeedboosterKilled_Frame6[] = {
    8,
    0xe8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x10c,
    0xf8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x10c,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x10c,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x10c,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x10a,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x10a,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x10a,
    0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x10a
};

static const u16 sParticleOam_SpeedboosterKilled_Frame7[] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x10c,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x10c,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x10c,
    0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x10c
};

static const u16 sParticleOam_ShinesparkKilled_Frame0[] = {
    3,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x190,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x190,
    0xfc, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_3 | 0x190
};

static const u16 sParticleOam_ShinesparkKilled_Frame1[] = {
    6,
    0xf8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x190,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x192,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x192,
    0xfc, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_3 | 0x192,
    0xe8, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_3 | 0x190,
    0x2, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_3 | 0x190
};

static const u16 sParticleOam_ShinesparkKilled_Frame2[] = {
    9,
    0xfc, OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_3 | 0x190,
    0xfa, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x192,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x194,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x194,
    0xfc, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_3 | 0x194,
    0xe8, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_3 | 0x192,
    0x2, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_3 | 0x192,
    0xd8, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x190,
    0xc, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_3 | 0x190
};

static const u16 sParticleOam_ShinesparkKilled_Frame3[] = {
    9,
    0xfc, OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_3 | 0x192,
    0xfa, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x194,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x196,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x196,
    0xfc, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_3 | 0x196,
    0xe8, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_3 | 0x194,
    0x2, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_3 | 0x194,
    0xd8, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x192,
    0xc, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_3 | 0x192
};

static const u16 sParticleOam_ShinesparkKilled_Frame4[] = {
    9,
    0xe8, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_3 | 0x196,
    0x2, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_3 | 0x196,
    0xfa, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x196,
    0xd8, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x194,
    0xfc, OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_3 | 0x194,
    0xc, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_3 | 0x194,
    0xc8, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x188,
    0x0, OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_3 | 0x188,
    0x16, OBJ_SIZE_16x16 | 0x1da, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_ShinesparkKilled_Frame5[] = {
    6,
    0xc, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_3 | 0x196,
    0xd8, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x196,
    0xfc, OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_3 | 0x196,
    0xc8, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x18a,
    0x0, OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_3 | 0x18a,
    0x16, OBJ_SIZE_16x16 | 0x1da, OBJ_PALETTE_3 | 0x18a
};

static const u16 sParticleOam_ShinesparkKilled_Frame6[] = {
    3,
    0xc8, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x18c,
    0x0, OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_3 | 0x18c,
    0x16, OBJ_SIZE_16x16 | 0x1da, OBJ_PALETTE_3 | 0x18c
};

static const u16 sOam_3ebd40[] = {
    3,
    0xc8, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x18e,
    0x0, OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_3 | 0x18e,
    0x16, OBJ_SIZE_16x16 | 0x1da, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_SudoScrewKilled_Frame0[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_3 | 0x190,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x190
};

static const u16 sParticleOam_SudoScrewKilled_Frame1[] = {
    8,
    0xf8, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_3 | 0x192,
    0xf8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x190,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x192,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_3 | 0x190,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x106,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x106,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x106,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x106
};

static const u16 sParticleOam_SudoScrewKilled_Frame2[] = {
    10,
    0xf8, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_3 | 0x194,
    0xf8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x192,
    0xf8, OBJ_SIZE_16x16 | 0x1dc, OBJ_PALETTE_3 | 0x190,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x194,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_3 | 0x192,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x15, OBJ_PALETTE_3 | 0x190,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x108,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x108,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x108,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x108
};

static const u16 sParticleOam_SudoScrewKilled_Frame3[] = {
    10,
    0xf8, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_3 | 0x196,
    0xf8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x194,
    0xf8, OBJ_SIZE_16x16 | 0x1d6, OBJ_PALETTE_3 | 0x192,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x196,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x194,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1a, OBJ_PALETTE_3 | 0x192,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10a,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10a,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10a
};

static const u16 sParticleOam_SudoScrewKilled_Frame4[] = {
    14,
    0xf8, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x196,
    0xf8, OBJ_SIZE_16x16 | 0x1d4, OBJ_PALETTE_3 | 0x194,
    0xf8, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x196,
    0xf8, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_3 | 0x194,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_3 | 0x196,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1c, OBJ_PALETTE_3 | 0x194,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_3 | 0x196,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_3 | 0x194,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10c,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10c,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10c,
    0xf8, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x188,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_SudoScrewKilled_Frame5[] = {
    4,
    0xf8, OBJ_SIZE_16x16 | 0x1d3, OBJ_PALETTE_3 | 0x196,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1d, OBJ_PALETTE_3 | 0x196,
    0xf8, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x18a,
    0xf8, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_3 | 0x18a
};

static const u16 sParticleOam_SudoScrewKilled_Frame6[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x18c,
    0xf8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_3 | 0x18c
};

static const u16 sParticleOam_SudoScrewKilled_Frame7[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_3 | 0x18e,
    0xf8, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_OutwardSmoke_Frame0[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_3 | 0x188,
    0xf0, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_OutwardSmoke_Frame1[] = {
    6,
    0xf0, OBJ_SIZE_16x16 | 0x1e2, OBJ_PALETTE_3 | 0x188,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x18a,
    0xec, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_3 | 0x188,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_3 | 0x188,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x18a,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_OutwardSmoke_Frame2[] = {
    10,
    0xf0, OBJ_SIZE_16x16 | 0x1d2, OBJ_PALETTE_3 | 0x188,
    0xf0, OBJ_SIZE_16x16 | 0x1e1, OBJ_PALETTE_3 | 0x18a,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x18c,
    0xea, OBJ_SIZE_16x16 | 0x1e1, OBJ_PALETTE_3 | 0x188,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x18a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e, OBJ_PALETTE_3 | 0x188,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xf, OBJ_PALETTE_3 | 0x18a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x18c,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xf, OBJ_PALETTE_3 | 0x188,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x18a
};

static const u16 sParticleOam_OutwardSmoke_Frame3[] = {
    12,
    0xf0, OBJ_SIZE_16x16 | 0x1d1, OBJ_PALETTE_3 | 0x18a,
    0xec, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_3 | 0x18c,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_3 | 0x18e,
    0xf0, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_3 | 0x18c,
    0xea, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_3 | 0x18a,
    0xe8, OBJ_SIZE_16x16 | 0x1d0, OBJ_PALETTE_3 | 0x188,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f, OBJ_PALETTE_3 | 0x18a,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_3 | 0x18c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_3 | 0x18e,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_3 | 0x18c,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_3 | 0x18a,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_OutwardSmoke_Frame4[] = {
    12,
    0xe6, OBJ_SIZE_16x16 | 0x1ce, OBJ_PALETTE_3 | 0x18a,
    0xea, OBJ_SIZE_16x16 | 0x1df, OBJ_PALETTE_3 | 0x18c,
    0xec, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_3 | 0x18e,
    0xf0, OBJ_SIZE_16x16 | 0x1df, OBJ_PALETTE_3 | 0x18e,
    0xf0, OBJ_SIZE_16x16 | 0x1d0, OBJ_PALETTE_3 | 0x18c,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_3 | 0x188,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x22, OBJ_PALETTE_3 | 0x18a,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_3 | 0x18c,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_3 | 0x18e,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_3 | 0x18e,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_3 | 0x18c,
    0xec, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_OutwardSmoke_Frame5[] = {
    8,
    0xe4, OBJ_SIZE_16x16 | 0x1cc, OBJ_PALETTE_3 | 0x18c,
    0xe8, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_3 | 0x18e,
    0xf0, OBJ_SIZE_16x16 | 0x1cf, OBJ_PALETTE_3 | 0x18e,
    0xec, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_3 | 0x18a,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x24, OBJ_PALETTE_3 | 0x18c,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_3 | 0x18e,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x21, OBJ_PALETTE_3 | 0x18e,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_3 | 0x18a
};

static const u16 sParticleOam_OutwardSmoke_Frame6[] = {
    4,
    0xec, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_3 | 0x18c,
    0xe2, OBJ_SIZE_16x16 | 0x1ca, OBJ_PALETTE_3 | 0x18e,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_3 | 0x18c,
    0xe2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x26, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_OutwardSmoke_Frame7[] = {
    2,
    0xec, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_3 | 0x18e,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_ExplosionSmoke_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x190
};

static const u16 sParticleOam_ExplosionSmoke_Frame1[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x192,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_ExplosionSmoke_Frame2[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x194,
    0xec, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a
};

static const u16 sParticleOam_ExplosionSmoke_Frame3[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x196,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c
};

static const u16 sOam_3ec02e[] = {
    1,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e
};

const struct FrameData sSpriteDebrisOam_Cloud2[12] = {
    [0] = {
        .pFrame = sSpriteDebrisOam_Cloud2_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sSpriteDebrisOam_Cloud2_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sSpriteDebrisOam_Cloud2_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sSpriteDebrisOam_Cloud2_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sSpriteDebrisOam_Cloud2_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sSpriteDebrisOam_Cloud2_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sSpriteDebrisOam_Cloud2_Frame6,
        .timer = 4
    },
    [7] = {
        .pFrame = sSpriteDebrisOam_Cloud2_Frame7,
        .timer = 4
    },
    [8] = {
        .pFrame = sSpriteDebrisOam_Cloud2_Frame8,
        .timer = 4
    },
    [9] = {
        .pFrame = sSpriteDebrisOam_Cloud2_Frame9,
        .timer = 4
    },
    [10] = {
        .pFrame = sSpriteDebrisOam_Cloud2_Frame10,
        .timer = 255
    },
    [11] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSpriteDebrisOam_Cloud3[5] = {
    [0] = {
        .pFrame = sSpriteDebrisOam_Cloud3_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sSpriteDebrisOam_Cloud3_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sSpriteDebrisOam_Cloud3_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sSpriteDebrisOam_Cloud3_Frame3,
        .timer = 255
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_ScrewAttackKilled[9] = {
    [0] = {
        .pFrame = sParticleOam_ScrewAttackKilled_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sParticleOam_ScrewAttackKilled_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sParticleOam_ScrewAttackKilled_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sParticleOam_ScrewAttackKilled_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sParticleOam_ScrewAttackKilled_Frame4,
        .timer = 3
    },
    [5] = {
        .pFrame = sParticleOam_ScrewAttackKilled_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sParticleOam_ScrewAttackKilled_Frame6,
        .timer = 4
    },
    [7] = {
        .pFrame = sParticleOam_ScrewAttackKilled_Frame7,
        .timer = 4
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_ShinesparkKilled[8] = {
    [0] = {
        .pFrame = sParticleOam_ShinesparkKilled_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sParticleOam_ShinesparkKilled_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sParticleOam_ShinesparkKilled_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sParticleOam_ShinesparkKilled_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sParticleOam_ShinesparkKilled_Frame4,
        .timer = 3
    },
    [5] = {
        .pFrame = sParticleOam_ShinesparkKilled_Frame5,
        .timer = 3
    },
    [6] = {
        .pFrame = sParticleOam_ShinesparkKilled_Frame6,
        .timer = 4
    },
    [7] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSpriteDebrisOam_Cloud1[12] = {
    [0] = {
        .pFrame = sSpriteDebrisOam_Cloud1_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sSpriteDebrisOam_Cloud1_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sSpriteDebrisOam_Cloud1_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sSpriteDebrisOam_Cloud1_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sSpriteDebrisOam_Cloud1_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sSpriteDebrisOam_Cloud1_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sSpriteDebrisOam_Cloud1_Frame6,
        .timer = 4
    },
    [7] = {
        .pFrame = sSpriteDebrisOam_Cloud1_Frame7,
        .timer = 4
    },
    [8] = {
        .pFrame = sSpriteDebrisOam_Cloud1_Frame8,
        .timer = 4
    },
    [9] = {
        .pFrame = sSpriteDebrisOam_Cloud1_Frame9,
        .timer = 4
    },
    [10] = {
        .pFrame = sSpriteDebrisOam_Cloud1_Frame10,
        .timer = 255
    },
    [11] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_HeavyDust[5] = {
    [0] = {
        .pFrame = sParticleOam_HeavyDust_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sParticleOam_HeavyDust_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sParticleOam_HeavyDust_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sParticleOam_HeavyDust_Frame3,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_ExplosionSmoke[5] = {
    [0] = {
        .pFrame = sParticleOam_ExplosionSmoke_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sParticleOam_ExplosionSmoke_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sParticleOam_ExplosionSmoke_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sParticleOam_ExplosionSmoke_Frame3,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_EnterOrExitWater[9] = {
    [0] = {
        .pFrame = sParticleOam_EnterOrExitWater_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sParticleOam_EnterOrExitWater_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sParticleOam_EnterOrExitWater_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sParticleOam_EnterOrExitWater_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sParticleOam_EnterOrExitWater_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sParticleOam_EnterOrExitWater_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sParticleOam_EnterOrExitWater_Frame6,
        .timer = 4
    },
    [7] = {
        .pFrame = sParticleOam_EnterOrExitWater_Frame7,
        .timer = 4
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3ec240[6] = {
    [0] = {
        .pFrame = sParticleOam_3ec240_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sParticleOam_3ec240_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sParticleOam_3ec240_Frame2,
        .timer = 12
    },
    [3] = {
        .pFrame = sParticleOam_3ec240_Frame1,
        .timer = 4
    },
    [4] = {
        .pFrame = sParticleOam_3ec240_Frame0,
        .timer = 4
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3ec270[2] = {
    [0] = {
        .pFrame = sParticleOam_3ec270_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3ec280[6] = {
    [0] = {
        .pFrame = sParticleOam_3ec280_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sParticleOam_3ec280_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sParticleOam_3ec280_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sParticleOam_3ec280_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sParticleOam_3ec280_Frame4,
        .timer = 6
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3ec2b0[9] = {
    [0] = {
        .pFrame = sParticleOam_3ec2b0_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sParticleOam_3ec2b0_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sParticleOam_3ec2b0_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sParticleOam_3ec2b0_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sParticleOam_3ec2b0_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sParticleOam_3ec2b0_Frame5,
        .timer = 8
    },
    [6] = {
        .pFrame = sParticleOam_3ec2b0_Frame6,
        .timer = 8
    },
    [7] = {
        .pFrame = sParticleOam_3ec2b0_Frame7,
        .timer = 8
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3ec2f8[10] = {
    [0] = {
        .pFrame = sParticleOam_3ec2f8_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sParticleOam_3ec2f8_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sParticleOam_3ec2f8_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sParticleOam_3ec2f8_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sParticleOam_3ec2f8_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sParticleOam_3ec2f8_Frame5,
        .timer = 8
    },
    [6] = {
        .pFrame = sParticleOam_3ec2f8_Frame6,
        .timer = 8
    },
    [7] = {
        .pFrame = sParticleOam_3ec2f8_Frame7,
        .timer = 8
    },
    [8] = {
        .pFrame = sParticleOam_3ec2f8_Frame8,
        .timer = 8
    },
    [9] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_EnterOrExitWaterBig[9] = {
    [0] = {
        .pFrame = sParticleOam_EnterOrExitWaterBig_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_EnterOrExitWaterBig_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_EnterOrExitWaterBig_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sParticleOam_EnterOrExitWaterBig_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sParticleOam_EnterOrExitWaterBig_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sParticleOam_EnterOrExitWaterBig_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sParticleOam_EnterOrExitWaterBig_Frame6,
        .timer = 4
    },
    [7] = {
        .pFrame = sParticleOam_EnterOrExitWaterBig_Frame7,
        .timer = 4
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_SpriteEnterOrExitWater[11] = {
    [0] = {
        .pFrame = sParticleOam_SpriteEnterOrExitWater_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sParticleOam_SpriteEnterOrExitWater_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sParticleOam_SpriteEnterOrExitWater_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sParticleOam_SpriteEnterOrExitWater_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sParticleOam_SpriteEnterOrExitWater_Frame4,
        .timer = 5
    },
    [5] = {
        .pFrame = sParticleOam_SpriteEnterOrExitWater_Frame5,
        .timer = 5
    },
    [6] = {
        .pFrame = sParticleOam_SpriteEnterOrExitWater_Frame6,
        .timer = 5
    },
    [7] = {
        .pFrame = sParticleOam_SpriteEnterOrExitWater_Frame7,
        .timer = 5
    },
    [8] = {
        .pFrame = sParticleOam_SpriteEnterOrExitWater_Frame8,
        .timer = 5
    },
    [9] = {
        .pFrame = sParticleOam_SpriteEnterOrExitWater_Frame9,
        .timer = 5
    },
    [10] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_OutwardIceExplosion[9] = {
    [0] = {
        .pFrame = sParticleOam_OutwardIceExplosion_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sParticleOam_OutwardIceExplosion_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sParticleOam_OutwardIceExplosion_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sParticleOam_OutwardIceExplosion_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sParticleOam_OutwardIceExplosion_Frame4,
        .timer = 9
    },
    [5] = {
        .pFrame = sParticleOam_OutwardIceExplosion_Frame5,
        .timer = 9
    },
    [6] = {
        .pFrame = sParticleOam_OutwardIceExplosion_Frame6,
        .timer = 10
    },
    [7] = {
        .pFrame = sParticleOam_OutwardIceExplosion_Frame7,
        .timer = 10
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_SpeedboosterKilled[9] = {
    [0] = {
        .pFrame = sParticleOam_SpeedboosterKilled_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_SpeedboosterKilled_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_SpeedboosterKilled_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sParticleOam_SpeedboosterKilled_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sParticleOam_SpeedboosterKilled_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sParticleOam_SpeedboosterKilled_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sParticleOam_SpeedboosterKilled_Frame6,
        .timer = 4
    },
    [7] = {
        .pFrame = sParticleOam_SpeedboosterKilled_Frame7,
        .timer = 4
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_SudoScrewKilled[9] = {
    [0] = {
        .pFrame = sParticleOam_SudoScrewKilled_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sParticleOam_SudoScrewKilled_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sParticleOam_SudoScrewKilled_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sParticleOam_SudoScrewKilled_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sParticleOam_SudoScrewKilled_Frame4,
        .timer = 3
    },
    [5] = {
        .pFrame = sParticleOam_SudoScrewKilled_Frame5,
        .timer = 3
    },
    [6] = {
        .pFrame = sParticleOam_SudoScrewKilled_Frame6,
        .timer = 4
    },
    [7] = {
        .pFrame = sParticleOam_SudoScrewKilled_Frame7,
        .timer = 4
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_OutwardSmoke[9] = {
    [0] = {
        .pFrame = sParticleOam_OutwardSmoke_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sParticleOam_OutwardSmoke_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sParticleOam_OutwardSmoke_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sParticleOam_OutwardSmoke_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sParticleOam_OutwardSmoke_Frame4,
        .timer = 7
    },
    [5] = {
        .pFrame = sParticleOam_OutwardSmoke_Frame5,
        .timer = 7
    },
    [6] = {
        .pFrame = sParticleOam_OutwardSmoke_Frame6,
        .timer = 8
    },
    [7] = {
        .pFrame = sParticleOam_OutwardSmoke_Frame7,
        .timer = 8
    },
    [8] = FRAME_DATA_TERMINATOR
};

static const u8 sBlob_3ec508_3ecef4[] = INCBIN_U8("data/Blob_3ec508_3ecef4.bin");

static const u16 sParticleOam_3ed1e4_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0x125
};

static const u16 sParticleOam_GettingSuitBeams_Frame0[] = {
    4,
    0xcc, 0x1cc, OBJ_PALETTE_3 | 0x15d,
    0x0, 0x1f0, OBJ_PALETTE_3 | 0x19f,
    0xf8, 0x34, OBJ_PALETTE_3 | 0x19f,
    0x8, 0x8, OBJ_PALETTE_3 | 0x1bf
};

static const u16 sParticleOam_GettingSuitBeams_Frame1[] = {
    4,
    0xd4, 0x1d4, OBJ_PALETTE_3 | 0x15e,
    0xf8, 0x30, OBJ_PALETTE_3 | 0x15d,
    0x0, 0x1f0, OBJ_PALETTE_3 | 0x1bf,
    0x34, 0x1f8, OBJ_PALETTE_3 | 0x19f
};

static const u16 sParticleOam_GettingSuitBeams_Frame2[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1dc, OBJ_PALETTE_3 | 0x19d,
    0xf8, 0x28, OBJ_PALETTE_3 | 0x17e,
    0x30, 0x1f8, OBJ_PALETTE_3 | 0x15d,
    0xc8, 0x30, OBJ_PALETTE_3 | 0x19f
};

static const u16 sParticleOam_GettingSuitBeams_Frame3[] = {
    6,
    0xec, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x19d,
    0xcc, 0x2c, OBJ_PALETTE_3 | 0x15d,
    0x28, 0x1f8, OBJ_PALETTE_3 | 0x17d,
    0x30, 0x30, OBJ_PALETTE_3 | 0x19f,
    0xf8, 0x18, OBJ_PALETTE_3 | 0x1bc,
    0xf8, OBJ_X_FLIP | 0x20, OBJ_PALETTE_3 | 0x1bc
};

static const u16 sParticleOam_GettingSuitBeams_Frame4[] = {
    8,
    0xf4, 0x1f4, OBJ_PALETTE_3 | 0x15e,
    0xd4, OBJ_X_FLIP | 0x24, OBJ_PALETTE_3 | 0x15e,
    0x2c, 0x2c, OBJ_PALETTE_3 | 0x15d,
    0x0, 0x1c4, OBJ_PALETTE_3 | 0x19f,
    0xf8, 0x8, OBJ_PALETTE_3 | 0x1bc,
    0xf8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_3 | 0x1bc,
    0x18, 0x1f8, OBJ_PALETTE_3 | 0x19c,
    0x20, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x19c
};

static const u16 sParticleOam_GettingSuitBeams_Frame5[] = {
    7,
    0xf8, 0x8, OBJ_PALETTE_3 | 0x17e,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x14, OBJ_PALETTE_3 | 0x19d,
    0x24, 0x24, OBJ_PALETTE_3 | 0x15e,
    0x0, 0x1c8, OBJ_PALETTE_3 | 0x15d,
    0xf4, 0x1f4, OBJ_PALETTE_3 | 0x19f,
    0x8, 0x1f8, OBJ_PALETTE_3 | 0x19c,
    0x10, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x19c
};

static const u16 sParticleOam_GettingSuitBeams_Frame6[] = {
    6,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_3 | 0x19d,
    0x14, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x14, OBJ_PALETTE_3 | 0x19d,
    0x0, 0x1d0, OBJ_PALETTE_3 | 0x17e,
    0x8, 0x1f8, OBJ_PALETTE_3 | 0x17d,
    0xf8, 0x8, OBJ_PALETTE_3 | 0x19f,
    0xf0, 0x1f0, OBJ_PALETTE_3 | 0x1bf
};

static const u16 sParticleOam_GettingSuitBeams_Frame7[] = {
    6,
    0xf4, OBJ_X_FLIP | 0x4, OBJ_PALETTE_3 | 0x15e,
    0x4, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_3 | 0x19d,
    0x8, 0x1f8, OBJ_PALETTE_3 | 0x19f,
    0xf8, 0x8, OBJ_PALETTE_3 | 0x1bf,
    0x0, 0x1d8, OBJ_PALETTE_3 | 0x1bc,
    0x0, OBJ_X_FLIP | 0x1e0, OBJ_PALETTE_3 | 0x1bc
};

static const u16 sParticleOam_GettingSuitBeams_Frame8[] = {
    5,
    0x4, 0x4, OBJ_PALETTE_3 | 0x15e,
    0xf4, 0x4, OBJ_PALETTE_3 | 0x19f,
    0x8, 0x1f8, OBJ_PALETTE_3 | 0x1bf,
    0x0, 0x1e8, OBJ_PALETTE_3 | 0x1bc,
    0x0, OBJ_X_FLIP | 0x1f0, OBJ_PALETTE_3 | 0x1bc
};

static const u16 sParticleOam_GettingSuitBeams_Frame9[] = {
    3,
    0x0, 0x1f0, OBJ_PALETTE_3 | 0x17e,
    0x4, 0x4, OBJ_PALETTE_3 | 0x19f,
    0xc8, 0x1c8, OBJ_PALETTE_3 | 0x19f
};

static const u16 sParticleOam_3ed1e4_Frame0[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x1d8,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x1d8,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x1d8,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x1d8
};

static const u16 sParticleOam_3ed1e4_Frame4[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x1da,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x1da,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x1da,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x1da
};

static const u16 sParticleOam_3ed1e4_Frame8[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x1dc,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x1dc,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x1dc,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x1dc
};

static const u16 sParticleOam_3ed1e4_Frame12[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x1de,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x1de,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x1de,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x1de
};

static const u16 sParticleOam_AbsorbingSuit_Frame0[] = {
    4,
    0xf1, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_3 | 0x1d8,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_3 | 0x1d8,
    0xff, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_3 | 0x1d8,
    0xff, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_3 | 0x1d8
};

static const u16 sParticleOam_AbsorbingSuit_Frame4[] = {
    4,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_3 | 0x1da,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_3 | 0x1da,
    0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_3 | 0x1da,
    0xfe, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_3 | 0x1da
};

static const u16 sParticleOam_AbsorbingSuit_Frame8[] = {
    4,
    0xf3, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_3 | 0x1dc,
    0xf3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_3 | 0x1dc,
    0xfd, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_3 | 0x1dc,
    0xfd, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_3 | 0x1dc
};

static const u16 sParticleOam_AbsorbingSuit_Frame12[] = {
    4,
    0xf4, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_3 | 0x1de,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_3 | 0x1de,
    0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_3 | 0x1de,
    0xfc, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_3 | 0x1de
};

static const u16 sParticleOam_AbsorbingSuit_Frame16[] = {
    8,
    0xfc, 0x1e3, OBJ_PALETTE_3 | 0x1bc,
    0xfc, 0x1ea, OBJ_PALETTE_3 | 0x1bc,
    0xfc, OBJ_X_FLIP | 0x15, OBJ_PALETTE_3 | 0x1bc,
    0xfc, OBJ_X_FLIP | 0xe, OBJ_PALETTE_3 | 0x1bc,
    0xfc, 0x1f1, OBJ_PALETTE_3 | 0x1bc,
    0xfc, OBJ_X_FLIP | 0x7, OBJ_PALETTE_3 | 0x1bc,
    0xfc, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0x1bc,
    0xfc, 0x1f8, OBJ_PALETTE_3 | 0x1bc
};

static const u16 sParticleOam_AbsorbingSuit_Frame18[] = {
    6,
    0xfb, 0x1f0, OBJ_PALETTE_3 | 0x1d7,
    0xfb, 0x1f8, OBJ_PALETTE_3 | 0x1d7,
    0xfb, 0x0, OBJ_PALETTE_3 | 0x1d7,
    0xfb, 0x8, OBJ_PALETTE_3 | 0x1d7,
    0xfb, 0x10, OBJ_PALETTE_3 | 0x1d7,
    0xfb, 0x1e8, OBJ_PALETTE_3 | 0x1d7
};

static const u16 sParticleOam_AbsorbingSuit_Frame22[] = {
    2,
    0xfb, 0x1f8, OBJ_PALETTE_3 | 0x1d7,
    0xfb, 0x0, OBJ_PALETTE_3 | 0x1d7
};

static const u16 sParticleOam_AbsorbingSuit_Frame26[] = {
    1,
    0xfb, 0x1fc, OBJ_PALETTE_3 | 0x1d7
};

const struct FrameData sParticleOam_GettingSuitBeams[11] = {
    [0] = {
        .pFrame = sParticleOam_GettingSuitBeams_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sParticleOam_GettingSuitBeams_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sParticleOam_GettingSuitBeams_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sParticleOam_GettingSuitBeams_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sParticleOam_GettingSuitBeams_Frame4,
        .timer = 3
    },
    [5] = {
        .pFrame = sParticleOam_GettingSuitBeams_Frame5,
        .timer = 3
    },
    [6] = {
        .pFrame = sParticleOam_GettingSuitBeams_Frame6,
        .timer = 3
    },
    [7] = {
        .pFrame = sParticleOam_GettingSuitBeams_Frame7,
        .timer = 3
    },
    [8] = {
        .pFrame = sParticleOam_GettingSuitBeams_Frame8,
        .timer = 3
    },
    [9] = {
        .pFrame = sParticleOam_GettingSuitBeams_Frame9,
        .timer = 3
    },
    [10] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3ed1e4[17] = {
    [0] = {
        .pFrame = sParticleOam_3ed1e4_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sParticleOam_3ed1e4_Frame0,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [4] = {
        .pFrame = sParticleOam_3ed1e4_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [6] = {
        .pFrame = sParticleOam_3ed1e4_Frame4,
        .timer = 1
    },
    [7] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [8] = {
        .pFrame = sParticleOam_3ed1e4_Frame8,
        .timer = 1
    },
    [9] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [10] = {
        .pFrame = sParticleOam_3ed1e4_Frame8,
        .timer = 1
    },
    [11] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [12] = {
        .pFrame = sParticleOam_3ed1e4_Frame12,
        .timer = 1
    },
    [13] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [14] = {
        .pFrame = sParticleOam_3ed1e4_Frame12,
        .timer = 1
    },
    [15] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [16] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_AbsorbingSuit[31] = {
    [0] = {
        .pFrame = sParticleOam_AbsorbingSuit_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sParticleOam_AbsorbingSuit_Frame0,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [4] = {
        .pFrame = sParticleOam_AbsorbingSuit_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [6] = {
        .pFrame = sParticleOam_AbsorbingSuit_Frame4,
        .timer = 1
    },
    [7] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [8] = {
        .pFrame = sParticleOam_AbsorbingSuit_Frame8,
        .timer = 1
    },
    [9] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [10] = {
        .pFrame = sParticleOam_AbsorbingSuit_Frame8,
        .timer = 1
    },
    [11] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [12] = {
        .pFrame = sParticleOam_AbsorbingSuit_Frame12,
        .timer = 1
    },
    [13] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [14] = {
        .pFrame = sParticleOam_AbsorbingSuit_Frame12,
        .timer = 1
    },
    [15] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [16] = {
        .pFrame = sParticleOam_AbsorbingSuit_Frame16,
        .timer = 1
    },
    [17] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [18] = {
        .pFrame = sParticleOam_AbsorbingSuit_Frame18,
        .timer = 1
    },
    [19] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [20] = {
        .pFrame = sParticleOam_AbsorbingSuit_Frame18,
        .timer = 1
    },
    [21] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [22] = {
        .pFrame = sParticleOam_AbsorbingSuit_Frame22,
        .timer = 1
    },
    [23] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [24] = {
        .pFrame = sParticleOam_AbsorbingSuit_Frame22,
        .timer = 1
    },
    [25] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [26] = {
        .pFrame = sParticleOam_AbsorbingSuit_Frame26,
        .timer = 1
    },
    [27] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [28] = {
        .pFrame = sParticleOam_AbsorbingSuit_Frame26,
        .timer = 1
    },
    [29] = {
        .pFrame = sParticleOam_3ed1e4_Frame1,
        .timer = 1
    },
    [30] = FRAME_DATA_TERMINATOR
};

static const u16 sParticleOam_Smoke_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_Smoke_Frame1[] = {
    2,
    0xec, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a,
    0xf0, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_Smoke_Frame2[] = {
    3,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c,
    0xec, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_3 | 0x18a,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_Smoke_Frame3[] = {
    3,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e,
    0xe8, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_3 | 0x18c,
    0xec, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_3 | 0x18a
};

static const u16 sParticleOam_Smoke_Frame4[] = {
    2,
    0xe4, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_3 | 0x18e,
    0xe8, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_3 | 0x18c
};

static const u16 sParticleOam_Smoke_Frame5[] = {
    1,
    0xe4, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_Explosion9_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x190
};

static const u16 sParticleOam_Explosion9_Frame1[] = {
    2,
    0xec, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x192,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_3 | 0x190
};

static const u16 sParticleOam_Explosion9_Frame2[] = {
    3,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x194,
    0xec, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_3 | 0x192,
    0xf0, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x190
};

static const u16 sParticleOam_Explosion9_Frame3[] = {
    3,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x196,
    0xe8, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_3 | 0x194,
    0xec, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_3 | 0x192
};

static const u16 sParticleOam_Explosion9_Frame4[] = {
    2,
    0xe4, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x196,
    0xe8, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_3 | 0x194
};

static const u16 sParticleOam_Explosion9_Frame5[] = {
    1,
    0xe4, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_3 | 0x196
};

static const u16 sParticleOam_TailSmoke1_Frame0[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c
};

static const u16 sParticleOam_TailSmoke1_Frame1[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_TailSmoke1_Frame2[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_TailSmoke1_Frame3[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_TailSmoke1_Frame4[] = {
    3,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a
};

static const u16 sParticleOam_TailExplosion_Frame0[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x190,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x196,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x194
};

static const u16 sParticleOam_TailExplosion_Frame1[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x192,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x190,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x196
};

static const u16 sParticleOam_TailExplosion_Frame2[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x194,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x192,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x190
};

static const u16 sParticleOam_TailExplosion_Frame3[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x196,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x194,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x192,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x190
};

static const u16 sParticleOam_TailExplosion_Frame4[] = {
    3,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x196,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x194,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x192
};

static const u16 sParticleOam_3edd6c_Frame0[] = {
    5,
    0xde, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_3 | 0x18c,
    0xd5, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_3 | 0x18e,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x190,
    0xd7, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a,
    0xe5, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_3 | 0x196
};

static const u16 sParticleOam_3edd6c_Frame1[] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_3 | 0x18e,
    0xe4, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x188,
    0xee, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x192,
    0xd6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c,
    0xe8, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x190
};

static const u16 sParticleOam_3edd6c_Frame2[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x188,
    0xe3, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x18a,
    0xec, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x194,
    0xd5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e,
    0xe7, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_3 | 0x192,
    0xe8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x190
};

static const u16 sParticleOam_3edd6c_Frame3[] = {
    6,
    0xe0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x188,
    0xd7, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_3 | 0x18a,
    0xe2, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x18c,
    0xea, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x196,
    0xe6, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_3 | 0x194,
    0xe7, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_3 | 0x192
};

static const u16 sParticleOam_3edd6c_Frame4[] = {
    6,
    0xdf, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_3 | 0x18a,
    0xe1, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x18e,
    0xd6, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_3 | 0x18c,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188,
    0xe5, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_3 | 0x196,
    0xe6, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_3 | 0x194
};

static const u16 sParticleOam_Explosion8_Frame5[] = {
    4,
    0xd5, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_3 | 0x18e,
    0xd7, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a,
    0xde, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_3 | 0x18c,
    0xe5, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_3 | 0x196
};

static const u16 sParticleOam_Explosion8_Frame6[] = {
    2,
    0xd6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c,
    0xdd, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_Explosion8_Frame7[] = {
    1,
    0xd5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_3edde4_Frame0[] = {
    3,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x158,
    0xe9, 0x1ff, OBJ_PALETTE_3 | 0x15b,
    0xe6, 0x1fe, OBJ_PALETTE_3 | 0x15a
};

static const u16 sParticleOam_3edde4_Frame1[] = {
    3,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x159,
    0xf2, 0x1fc, OBJ_PALETTE_3 | 0x158,
    0xe4, 0x0, OBJ_PALETTE_3 | 0x15b
};

static const u16 sParticleOam_3edde4_Frame2[] = {
    3,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x15a,
    0xf2, 0x1fc, OBJ_PALETTE_3 | 0x159,
    0xec, 0x1fc, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_3edde4_Frame3[] = {
    4,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x15b,
    0xf2, 0x1fc, OBJ_PALETTE_3 | 0x15a,
    0xeb, 0x1fd, OBJ_PALETTE_3 | 0x159,
    0xe8, 0x1fc, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_3edde4_Frame4[] = {
    3,
    0xf2, 0x1fc, OBJ_PALETTE_3 | 0x15b,
    0xea, 0x1fe, OBJ_PALETTE_3 | 0x15a,
    0xe7, 0x1fd, OBJ_PALETTE_3 | 0x159
};

static const u16 sParticleOam_3ede14_Frame0[] = {
    3,
    0x0, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0x158,
    0xf, OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_3 | 0x15b,
    0x12, OBJ_Y_FLIP | 0x1fe, OBJ_PALETTE_3 | 0x15a
};

static const u16 sParticleOam_3ede14_Frame1[] = {
    3,
    0x0, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0x159,
    0x6, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0x158,
    0x14, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0x15b
};

static const u16 sParticleOam_3ede14_Frame2[] = {
    3,
    0x0, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0x15a,
    0x6, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0x159,
    0xc, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_3ede14_Frame3[] = {
    4,
    0x0, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0x15b,
    0x6, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0x15a,
    0xd, OBJ_Y_FLIP | 0x1fd, OBJ_PALETTE_3 | 0x159,
    0x10, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_3ede14_Frame4[] = {
    3,
    0x6, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0x15b,
    0xe, OBJ_Y_FLIP | 0x1fe, OBJ_PALETTE_3 | 0x15a,
    0x11, OBJ_Y_FLIP | 0x1fd, OBJ_PALETTE_3 | 0x159
};

static const u16 sParticleOam_3ede44_Frame0[] = {
    3,
    0xfc, 0x0, OBJ_PALETTE_3 | 0x158,
    0xf9, 0xf, OBJ_PALETTE_3 | 0x15b,
    0xf7, 0x13, OBJ_PALETTE_3 | 0x15a
};

static const u16 sParticleOam_3ede44_Frame1[] = {
    3,
    0xfc, 0x0, OBJ_PALETTE_3 | 0x159,
    0xfc, 0x6, OBJ_PALETTE_3 | 0x158,
    0xf6, 0x14, OBJ_PALETTE_3 | 0x15b
};

static const u16 sParticleOam_3ede44_Frame2[] = {
    3,
    0xfc, 0x0, OBJ_PALETTE_3 | 0x15a,
    0xfc, 0x6, OBJ_PALETTE_3 | 0x159,
    0xfc, 0xc, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_3ede44_Frame3[] = {
    4,
    0xfc, 0x0, OBJ_PALETTE_3 | 0x15b,
    0xfc, 0x6, OBJ_PALETTE_3 | 0x15a,
    0xfb, 0xd, OBJ_PALETTE_3 | 0x159,
    0xfa, 0x10, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_3ede44_Frame4[] = {
    3,
    0xfc, 0x6, OBJ_PALETTE_3 | 0x15b,
    0xfa, 0xe, OBJ_PALETTE_3 | 0x15a,
    0xf9, 0x11, OBJ_PALETTE_3 | 0x159
};

static const u16 sParticleOam_3ede74_Frame0[] = {
    3,
    0xfc, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x158,
    0xf9, OBJ_X_FLIP | 0x1e9, OBJ_PALETTE_3 | 0x15b,
    0xf7, OBJ_X_FLIP | 0x1e5, OBJ_PALETTE_3 | 0x15a
};

static const u16 sParticleOam_3ede74_Frame1[] = {
    3,
    0xfc, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x159,
    0xfc, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_3 | 0x158,
    0xf6, OBJ_X_FLIP | 0x1e4, OBJ_PALETTE_3 | 0x15b
};

static const u16 sParticleOam_3ede74_Frame2[] = {
    3,
    0xfc, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x15a,
    0xfc, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_3 | 0x159,
    0xfc, OBJ_X_FLIP | 0x1ec, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_3ede74_Frame3[] = {
    4,
    0xfc, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x15b,
    0xfc, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_3 | 0x15a,
    0xfb, OBJ_X_FLIP | 0x1eb, OBJ_PALETTE_3 | 0x159,
    0xfa, OBJ_X_FLIP | 0x1e8, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_3ede74_Frame4[] = {
    3,
    0xfc, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_3 | 0x15b,
    0xfa, OBJ_X_FLIP | 0x1ea, OBJ_PALETTE_3 | 0x15a,
    0xf9, OBJ_X_FLIP | 0x1e7, OBJ_PALETTE_3 | 0x159
};

static const u16 sParticleOam_TailSmoke2_Frame0[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188,
    0xd4, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x18e,
    0xcd, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_3 | 0x18c
};

static const u16 sParticleOam_TailSmoke2_Frame1[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188,
    0xcc, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_TailSmoke2_Frame2[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a,
    0xd7, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_TailSmoke2_Frame3[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c,
    0xd6, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_3 | 0x18a,
    0xcf, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_TailSmoke2_Frame4[] = {
    3,
    0xe1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e,
    0xd5, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_3 | 0x18c,
    0xce, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_3 | 0x18a
};

static const u16 sParticleOam_TailSmoke2_Frame5[] = {
    2,
    0xd4, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x18e,
    0xcd, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_3 | 0x18c
};

static const u16 sParticleOam_TailSmoke2_Frame6[] = {
    1,
    0xcc, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_TailExplosionSmoke_Frame0[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x190,
    0xd4, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x18e,
    0xcc, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_3 | 0x18c
};

static const u16 sParticleOam_TailExplosionSmoke_Frame1[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x192,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x190,
    0xc8, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_TailExplosionSmoke_Frame2[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x194,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x192,
    0xd7, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_TailExplosionSmoke_Frame3[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x196,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x194,
    0xd6, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_3 | 0x18a,
    0xcb, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_TailExplosionSmoke_Frame4[] = {
    3,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x196,
    0xd5, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_3 | 0x18c,
    0xca, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_3 | 0x18a
};

static const u16 sParticleOam_Explosion7_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xca
};

static const u16 sParticleOam_Explosion7_Frame1[] = {
    5,
    0xf8, 0x1f8, OBJ_PALETTE_3 | 0xe5,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0xe5,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0xe5,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0xe5,
    0xf4, 0x1f8, OBJ_PALETTE_3 | 0xca
};

static const u16 sParticleOam_Explosion7_Frame2[] = {
    9,
    0xf0, 0x1f4, OBJ_PALETTE_3 | 0xe5,
    0xf8, OBJ_Y_FLIP | 0x1f4, OBJ_PALETTE_3 | 0xe5,
    0xf0, OBJ_X_FLIP | 0x1fc, OBJ_PALETTE_3 | 0xe5,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0xe5,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x106,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x106,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x106,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x106,
    0xf0, 0x4, OBJ_PALETTE_3 | 0xca
};

static const u16 sParticleOam_Explosion7_Frame3[] = {
    12,
    0xec, 0x0, OBJ_PALETTE_3 | 0xe5,
    0xf4, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0xe5,
    0xec, OBJ_X_FLIP | 0x8, OBJ_PALETTE_3 | 0xe5,
    0xf4, OBJ_X_FLIP | OBJ_Y_FLIP | 0x8, OBJ_PALETTE_3 | 0xe5,
    0xe8, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x106,
    0xf8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x106,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x106,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x106,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x108,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x108,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x108,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x108
};

static const u16 sParticleOam_Explosion7_Frame4[] = {
    13,
    0xe4, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x190,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x106,
    0xf4, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x106,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x106,
    0xf4, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x106,
    0xe8, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x108,
    0xf8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x108,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x108,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x108,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10a,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10a,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10a
};

static const u16 sParticleOam_Explosion7_Frame5[] = {
    14,
    0xe0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x188,
    0xe2, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x192,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x108,
    0xf4, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x108,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x108,
    0xf4, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x108,
    0xe8, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x10a,
    0xf8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x10a,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x10a,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x10a,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10c,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x10c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10c,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x10c
};

static const u16 sParticleOam_Explosion7_Frame6[] = {
    12,
    0xde, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x18a,
    0xe0, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x188,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x190,
    0xe0, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x194,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x10a,
    0xf4, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x10a,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x10a,
    0xf4, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x10a,
    0xe8, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x10c,
    0xf8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_3 | 0x10c,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x10c,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x10c
};

static const u16 sParticleOam_Explosion7_Frame7[] = {
    9,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188,
    0xdc, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x18c,
    0xde, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x18a,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x192,
    0xdc, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_3 | 0x196,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x10c,
    0xf4, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x10c,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x10c,
    0xf4, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_3 | 0x10c
};

static const u16 sParticleOam_Explosion7_Frame8[] = {
    4,
    0xd6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a,
    0xda, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x18e,
    0xdc, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x18c,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x194
};

static const u16 sParticleOam_Explosion7_Frame9[] = {
    3,
    0xd4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c,
    0xda, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x18e,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x196
};

static const u16 sParticleOam_Explosion7_Frame10[] = {
    1,
    0xd2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_3edf74_Frame0[] = {
    1,
    0xfc, 0x0, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_3edf74_Frame1[] = {
    2,
    0xfc, 0x0, OBJ_PALETTE_3 | 0x159,
    0xfc, 0x6, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_3edf74_Frame2[] = {
    3,
    0xfc, 0x0, OBJ_PALETTE_3 | 0x15a,
    0xfc, 0x6, OBJ_PALETTE_3 | 0x159,
    0xfc, 0xc, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_3edf74_Frame3[] = {
    3,
    0xfc, 0x2, OBJ_PALETTE_3 | 0x15a,
    0xfc, 0xa, OBJ_PALETTE_3 | 0x159,
    0xfc, 0x11, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_3edf74_Frame4[] = {
    3,
    0xfc, 0xf, OBJ_PALETTE_3 | 0x159,
    0xfc, 0x18, OBJ_PALETTE_3 | 0x158,
    0xfc, 0x5, OBJ_PALETTE_3 | 0x15b
};

static const u16 sParticleOam_3edf74_Frame5[] = {
    3,
    0xfc, 0x1c, OBJ_PALETTE_3 | 0x158,
    0xfc, 0x7, OBJ_PALETTE_3 | 0x15b,
    0xfc, 0x12, OBJ_PALETTE_3 | 0x15a
};

static const u16 sParticleOam_3edf74_Frame6[] = {
    4,
    0xfc, 0x10, OBJ_PALETTE_3 | 0x15b,
    0xfc, 0x16, OBJ_PALETTE_3 | 0x15a,
    0xfb, 0x1d, OBJ_PALETTE_3 | 0x159,
    0xfa, 0x20, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_3edf74_Frame7[] = {
    3,
    0xfc, 0x16, OBJ_PALETTE_3 | 0x15b,
    0xfa, 0x1e, OBJ_PALETTE_3 | 0x15a,
    0xf9, 0x21, OBJ_PALETTE_3 | 0x159
};

static const u16 sParticleOam_3edf74_Frame8[] = {
    2,
    0xf9, 0x1f, OBJ_PALETTE_3 | 0x15b,
    0xf7, 0x23, OBJ_PALETTE_3 | 0x15a
};

static const u16 sParticleOam_3edf74_Frame9[] = {
    1,
    0xf6, 0x24, OBJ_PALETTE_3 | 0x15b
};

static const u16 sParticleOam_3edfcc_Frame0[] = {
    1,
    0xfc, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_3edfcc_Frame1[] = {
    2,
    0xfc, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x159,
    0xfc, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_3edfcc_Frame2[] = {
    3,
    0xfc, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x15a,
    0xfc, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_3 | 0x159,
    0xfc, OBJ_X_FLIP | 0x1ec, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_3edfcc_Frame3[] = {
    3,
    0xfc, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_3 | 0x15a,
    0xfc, OBJ_X_FLIP | 0x1ee, OBJ_PALETTE_3 | 0x159,
    0xfc, OBJ_X_FLIP | 0x1e7, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_3edfcc_Frame4[] = {
    3,
    0xfc, OBJ_X_FLIP | 0x1e9, OBJ_PALETTE_3 | 0x159,
    0xfc, OBJ_X_FLIP | 0x1e0, OBJ_PALETTE_3 | 0x158,
    0xfc, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_3 | 0x15b
};

static const u16 sParticleOam_3edfcc_Frame5[] = {
    3,
    0xfc, OBJ_X_FLIP | 0x1dc, OBJ_PALETTE_3 | 0x158,
    0xfc, OBJ_X_FLIP | 0x1f1, OBJ_PALETTE_3 | 0x15b,
    0xfc, OBJ_X_FLIP | 0x1e6, OBJ_PALETTE_3 | 0x15a
};

static const u16 sParticleOam_3edfcc_Frame6[] = {
    4,
    0xfc, OBJ_X_FLIP | 0x1e8, OBJ_PALETTE_3 | 0x15b,
    0xfc, OBJ_X_FLIP | 0x1e2, OBJ_PALETTE_3 | 0x15a,
    0xfb, OBJ_X_FLIP | 0x1db, OBJ_PALETTE_3 | 0x159,
    0xfa, OBJ_X_FLIP | 0x1d8, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_3edfcc_Frame7[] = {
    3,
    0xfc, OBJ_X_FLIP | 0x1e2, OBJ_PALETTE_3 | 0x15b,
    0xfa, OBJ_X_FLIP | 0x1da, OBJ_PALETTE_3 | 0x15a,
    0xf9, OBJ_X_FLIP | 0x1d7, OBJ_PALETTE_3 | 0x159
};

static const u16 sParticleOam_3edfcc_Frame8[] = {
    2,
    0xf9, OBJ_X_FLIP | 0x1d9, OBJ_PALETTE_3 | 0x15b,
    0xf7, OBJ_X_FLIP | 0x1d5, OBJ_PALETTE_3 | 0x15a
};

static const u16 sParticleOam_3edfcc_Frame9[] = {
    1,
    0xf6, OBJ_X_FLIP | 0x1d4, OBJ_PALETTE_3 | 0x15b
};

static const u16 sParticleOam_3ee024_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_3ee024_Frame1[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x18a,
    0xf8, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_3ee024_Frame2[] = {
    3,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x18c,
    0xf8, OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_3 | 0x18a,
    0xf7, OBJ_SIZE_16x16 | 0x19, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_3ee024_Frame3[] = {
    4,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0x18e,
    0xf8, OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_3 | 0x18c,
    0xf6, OBJ_SIZE_16x16 | 0x1a, OBJ_PALETTE_3 | 0x18a,
    0xf7, OBJ_SIZE_16x16 | 0x21, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_3ee024_Frame4[] = {
    3,
    0xf8, OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_3 | 0x18e,
    0xf5, OBJ_SIZE_16x16 | 0x1b, OBJ_PALETTE_3 | 0x18c,
    0xf6, OBJ_SIZE_16x16 | 0x22, OBJ_PALETTE_3 | 0x18a
};

static const u16 sParticleOam_3ee024_Frame5[] = {
    2,
    0xf4, OBJ_SIZE_16x16 | 0x1d, OBJ_PALETTE_3 | 0x18e,
    0xf5, OBJ_SIZE_16x16 | 0x24, OBJ_PALETTE_3 | 0x18c
};

static const u16 sParticleOam_3ee024_Frame6[] = {
    1,
    0xf4, OBJ_SIZE_16x16 | 0x25, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_3ee024_Frame7[] = {
    1,
    0xf3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x26, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_3ee06c_Frame0[] = {
    1,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_3ee06c_Frame1[] = {
    2,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x18a,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e3, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_3ee06c_Frame2[] = {
    3,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x18c,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e2, OBJ_PALETTE_3 | 0x18a,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1d7, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_3ee06c_Frame3[] = {
    4,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0x18e,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e2, OBJ_PALETTE_3 | 0x18c,
    0xf6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1d6, OBJ_PALETTE_3 | 0x18a,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1cf, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_3ee06c_Frame4[] = {
    3,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e2, OBJ_PALETTE_3 | 0x18e,
    0xf5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1d5, OBJ_PALETTE_3 | 0x18c,
    0xf6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ce, OBJ_PALETTE_3 | 0x18a
};

static const u16 sParticleOam_3ee06c_Frame5[] = {
    2,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1d3, OBJ_PALETTE_3 | 0x18e,
    0xf5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1cc, OBJ_PALETTE_3 | 0x18c
};

static const u16 sParticleOam_3ee06c_Frame6[] = {
    1,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1cb, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_3ee06c_Frame7[] = {
    1,
    0xf3, OBJ_SIZE_16x16 | 0x1ca, OBJ_PALETTE_3 | 0x18e
};

const struct FrameData sParticleOam_Smoke[7] = {
    [0] = {
        .pFrame = sParticleOam_Smoke_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sParticleOam_Smoke_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sParticleOam_Smoke_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sParticleOam_Smoke_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sParticleOam_Smoke_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sParticleOam_Smoke_Frame5,
        .timer = 8
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_Explosion9[7] = {
    [0] = {
        .pFrame = sParticleOam_Explosion9_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sParticleOam_Explosion9_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sParticleOam_Explosion9_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sParticleOam_Explosion9_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sParticleOam_Explosion9_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sParticleOam_Explosion9_Frame5,
        .timer = 8
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_TailSmoke1[6] = {
    [0] = {
        .pFrame = sParticleOam_TailSmoke1_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sParticleOam_TailSmoke1_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sParticleOam_TailSmoke1_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sParticleOam_TailSmoke1_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sParticleOam_TailSmoke1_Frame4,
        .timer = 6
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_TailExplosion[6] = {
    [0] = {
        .pFrame = sParticleOam_TailExplosion_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sParticleOam_TailExplosion_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sParticleOam_TailExplosion_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sParticleOam_TailExplosion_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sParticleOam_TailExplosion_Frame4,
        .timer = 6
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3edd6c[6] = {
    [0] = {
        .pFrame = sParticleOam_3edd6c_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sParticleOam_3edd6c_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sParticleOam_3edd6c_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sParticleOam_3edd6c_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sParticleOam_3edd6c_Frame4,
        .timer = 8
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_Explosion8[9] = {
    [0] = {
        .pFrame = sParticleOam_3edd6c_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sParticleOam_3edd6c_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sParticleOam_3edd6c_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sParticleOam_3edd6c_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sParticleOam_3edd6c_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sParticleOam_Explosion8_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sParticleOam_Explosion8_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sParticleOam_Explosion8_Frame7,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3edde4[6] = {
    [0] = {
        .pFrame = sParticleOam_3edde4_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sParticleOam_3edde4_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sParticleOam_3edde4_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sParticleOam_3edde4_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sParticleOam_3edde4_Frame4,
        .timer = 6
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3ede14[6] = {
    [0] = {
        .pFrame = sParticleOam_3ede14_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sParticleOam_3ede14_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sParticleOam_3ede14_Frame2,
        .timer = 5
    },
    [3] = {
        .pFrame = sParticleOam_3ede14_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sParticleOam_3ede14_Frame4,
        .timer = 5
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3ede44[6] = {
    [0] = {
        .pFrame = sParticleOam_3ede44_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sParticleOam_3ede44_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sParticleOam_3ede44_Frame2,
        .timer = 5
    },
    [3] = {
        .pFrame = sParticleOam_3ede44_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sParticleOam_3ede44_Frame4,
        .timer = 5
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3ede74[6] = {
    [0] = {
        .pFrame = sParticleOam_3ede74_Frame0,
        .timer = 7
    },
    [1] = {
        .pFrame = sParticleOam_3ede74_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sParticleOam_3ede74_Frame2,
        .timer = 7
    },
    [3] = {
        .pFrame = sParticleOam_3ede74_Frame3,
        .timer = 7
    },
    [4] = {
        .pFrame = sParticleOam_3ede74_Frame4,
        .timer = 7
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_TailSmoke2[8] = {
    [0] = {
        .pFrame = sParticleOam_TailSmoke2_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sParticleOam_TailSmoke2_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sParticleOam_TailSmoke2_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sParticleOam_TailSmoke2_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sParticleOam_TailSmoke2_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sParticleOam_TailSmoke2_Frame5,
        .timer = 8
    },
    [6] = {
        .pFrame = sParticleOam_TailSmoke2_Frame6,
        .timer = 8
    },
    [7] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_TailExplosionSmoke[6] = {
    [0] = {
        .pFrame = sParticleOam_TailExplosionSmoke_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sParticleOam_TailExplosionSmoke_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sParticleOam_TailExplosionSmoke_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sParticleOam_TailExplosionSmoke_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sParticleOam_TailExplosionSmoke_Frame4,
        .timer = 6
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_Explosion7[12] = {
    [0] = {
        .pFrame = sParticleOam_Explosion7_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sParticleOam_Explosion7_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sParticleOam_Explosion7_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sParticleOam_Explosion7_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sParticleOam_Explosion7_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sParticleOam_Explosion7_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sParticleOam_Explosion7_Frame6,
        .timer = 5
    },
    [7] = {
        .pFrame = sParticleOam_Explosion7_Frame7,
        .timer = 5
    },
    [8] = {
        .pFrame = sParticleOam_Explosion7_Frame8,
        .timer = 4
    },
    [9] = {
        .pFrame = sParticleOam_Explosion7_Frame9,
        .timer = 5
    },
    [10] = {
        .pFrame = sParticleOam_Explosion7_Frame10,
        .timer = 5
    },
    [11] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3edf74[11] = {
    [0] = {
        .pFrame = sParticleOam_3edf74_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_3edf74_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_3edf74_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_3edf74_Frame3,
        .timer = 1
    },
    [4] = {
        .pFrame = sParticleOam_3edf74_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sParticleOam_3edf74_Frame5,
        .timer = 1
    },
    [6] = {
        .pFrame = sParticleOam_3edf74_Frame6,
        .timer = 2
    },
    [7] = {
        .pFrame = sParticleOam_3edf74_Frame7,
        .timer = 3
    },
    [8] = {
        .pFrame = sParticleOam_3edf74_Frame8,
        .timer = 4
    },
    [9] = {
        .pFrame = sParticleOam_3edf74_Frame9,
        .timer = 4
    },
    [10] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3edfcc[11] = {
    [0] = {
        .pFrame = sParticleOam_3edfcc_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_3edfcc_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_3edfcc_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_3edfcc_Frame3,
        .timer = 1
    },
    [4] = {
        .pFrame = sParticleOam_3edfcc_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sParticleOam_3edfcc_Frame5,
        .timer = 1
    },
    [6] = {
        .pFrame = sParticleOam_3edfcc_Frame6,
        .timer = 2
    },
    [7] = {
        .pFrame = sParticleOam_3edfcc_Frame7,
        .timer = 3
    },
    [8] = {
        .pFrame = sParticleOam_3edfcc_Frame8,
        .timer = 4
    },
    [9] = {
        .pFrame = sParticleOam_3edfcc_Frame9,
        .timer = 4
    },
    [10] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3ee024[9] = {
    [0] = {
        .pFrame = sParticleOam_3ee024_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sParticleOam_3ee024_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sParticleOam_3ee024_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_3ee024_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sParticleOam_3ee024_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sParticleOam_3ee024_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sParticleOam_3ee024_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sParticleOam_3ee024_Frame7,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3ee06c[9] = {
    [0] = {
        .pFrame = sParticleOam_3ee06c_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sParticleOam_3ee06c_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sParticleOam_3ee06c_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_3ee06c_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sParticleOam_3ee06c_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sParticleOam_3ee06c_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sParticleOam_3ee06c_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sParticleOam_3ee06c_Frame7,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_Explosion10[12] = {
    [0] = {
        .pFrame = sParticleOam_Explosion7_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_Explosion7_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_Explosion7_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sParticleOam_Explosion7_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sParticleOam_Explosion7_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sParticleOam_Explosion7_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sParticleOam_Explosion7_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sParticleOam_Explosion7_Frame7,
        .timer = 7
    },
    [8] = {
        .pFrame = sParticleOam_Explosion7_Frame8,
        .timer = 8
    },
    [9] = {
        .pFrame = sParticleOam_Explosion7_Frame9,
        .timer = 9
    },
    [10] = {
        .pFrame = sParticleOam_Explosion7_Frame10,
        .timer = 10
    },
    [11] = FRAME_DATA_TERMINATOR
};

static const u16 sParticleOam_Dust1_Frame0[] = {
    1,
    0xf8, 0x1f2, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_Dust1_Frame1[] = {
    1,
    0xf5, 0x1f0, OBJ_PALETTE_3 | 0x159
};

static const u16 sParticleOam_Dust1_Frame2[] = {
    1,
    0xf4, 0x1ed, OBJ_PALETTE_3 | 0x15a
};

static const u16 sParticleOam_Dust1_Frame3[] = {
    1,
    0xf1, 0x1ec, OBJ_PALETTE_3 | 0x15b
};

static const u16 sParticleOam_Dust1_Frame4[] = {
    1,
    0xee, 0x1e9, OBJ_PALETTE_3 | 0x15c
};

static const u16 sParticleOam_Dust2_Frame0[] = {
    1,
    0xf8, 0x6, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_Dust2_Frame1[] = {
    1,
    0xf5, 0x8, OBJ_PALETTE_3 | 0x159
};

static const u16 sParticleOam_Dust2_Frame2[] = {
    1,
    0xf4, 0xb, OBJ_PALETTE_3 | 0x15a
};

static const u16 sParticleOam_Dust2_Frame3[] = {
    1,
    0xf1, 0xc, OBJ_PALETTE_3 | 0x15b
};

static const u16 sParticleOam_Dust2_Frame4[] = {
    1,
    0xee, 0xf, OBJ_PALETTE_3 | 0x15c
};

const struct FrameData sParticleOam_Dust1[6] = {
    [0] = {
        .pFrame = sParticleOam_Dust1_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sParticleOam_Dust1_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sParticleOam_Dust1_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sParticleOam_Dust1_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sParticleOam_Dust1_Frame4,
        .timer = 3
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_Dust2[6] = {
    [0] = {
        .pFrame = sParticleOam_Dust2_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sParticleOam_Dust2_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sParticleOam_Dust2_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sParticleOam_Dust2_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sParticleOam_Dust2_Frame4,
        .timer = 3
    },
    [5] = FRAME_DATA_TERMINATOR
};

static const u16 sOam_3ee1c4[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xcb
};

static const u16 sOam_3ee1cc[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x143,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x143,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x143,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x143
};

static const u16 sOam_3ee1e6[] = {
    4,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x140,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x140,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x140,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x140
};

static const u16 sOam_3ee200[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x141,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x141,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x141,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x141
};

static const u16 sOam_3ee21a[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x152,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x152,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x152,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x152
};

static const u16 sOam_3ee234[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x154,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x154,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x154,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x154
};

static const u16 sOam_3ee24e[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x156,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x156,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x156,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x156
};

static const u16 sParticleOam_FlareHit_Frame0[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x0, OBJ_PALETTE_3 | 0xd3,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x10, OBJ_PALETTE_3 | 0xf3,
    0xfc, 0x20, OBJ_PALETTE_3 | 0xf7,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x1f0, OBJ_PALETTE_3 | 0xd3,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x1e0, OBJ_PALETTE_3 | 0xf3,
    0xfc, OBJ_X_FLIP | 0x1d8, OBJ_PALETTE_3 | 0xf7
};

static const u16 sParticleOam_FlareHit_Frame1[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1fc, OBJ_PALETTE_3 | 0xd3,
    0xfc, 0xc, OBJ_PALETTE_3 | 0xf3,
    0xfc, 0x14, OBJ_PALETTE_3 | 0xf7,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x1f4, OBJ_PALETTE_3 | 0xd3,
    0xfc, OBJ_X_FLIP | 0x1ec, OBJ_PALETTE_3 | 0xf3,
    0xfc, OBJ_X_FLIP | 0x1e4, OBJ_PALETTE_3 | 0xf7
};

static const u16 sParticleOam_FlareHit_Frame2[] = {
    4,
    0xfc, 0x0, OBJ_PALETTE_3 | 0xd3,
    0xfc, 0x8, OBJ_PALETTE_3 | 0xf3,
    0xfc, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_3 | 0xd3,
    0xfc, OBJ_X_FLIP | 0x1f0, OBJ_PALETTE_3 | 0xf3
};

static const u16 sParticleOam_FlareHit_Frame3[] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fc, OBJ_PALETTE_3 | 0xd2,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1fc, OBJ_PALETTE_3 | 0xd5,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x1fc, OBJ_PALETTE_3 | 0xd6,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0xd2,
    OBJ_SHAPE_VERTICAL | 0x18, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0xd5,
    OBJ_SHAPE_VERTICAL | 0x28, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0xd6
};

static const u16 sParticleOam_FlareHit_Frame4[] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xfc, 0x1fc, OBJ_PALETTE_3 | 0xd2,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0xd2,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1fc, OBJ_PALETTE_3 | 0xd5,
    OBJ_SHAPE_VERTICAL | 0x4, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0xd5,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1fc, OBJ_PALETTE_3 | 0xd6,
    OBJ_SHAPE_VERTICAL | 0xc, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0xd6
};

static const u16 sParticleOam_FlareHit_Frame5[] = {
    6,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0xd2,
    0xf2, 0x1fc, OBJ_PALETTE_3 | 0xd5,
    0xec, 0x1fc, OBJ_PALETTE_3 | 0xf6,
    0x0, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0xd2,
    0x6, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0xd5,
    0xc, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0xf6
};

static const u16 sParticleOam_FlareHit_Frame6[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0xd0,
    0xe8, 0x1e8, OBJ_PALETTE_3 | 0xd7,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0xd0,
    0x10, OBJ_X_FLIP | OBJ_Y_FLIP | 0x10, OBJ_PALETTE_3 | 0xd7
};

static const u16 sParticleOam_FlareHit_Frame7[] = {
    4,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_3 | 0xd0,
    0xec, 0x1ec, OBJ_PALETTE_3 | 0xd7,
    0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_3 | 0xd0,
    0xc, OBJ_X_FLIP | OBJ_Y_FLIP | 0xc, OBJ_PALETTE_3 | 0xd7
};

static const u16 sParticleOam_FlareHit_Frame8[] = {
    4,
    0xf9, 0x1f9, OBJ_PALETTE_3 | 0xf1,
    0xff, 0x1ff, OBJ_PALETTE_3 | 0xf1,
    0xf4, 0x1f4, OBJ_PALETTE_3 | 0xd0,
    0x3, OBJ_X_FLIP | OBJ_Y_FLIP | 0x3, OBJ_PALETTE_3 | 0xd0
};

static const u16 sParticleOam_FlareHit_Frame9[] = {
    4,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_3 | 0xd0,
    0xe8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_3 | 0xd7,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_3 | 0xd0,
    0x10, OBJ_Y_FLIP | 0x1e8, OBJ_PALETTE_3 | 0xd7
};

static const u16 sParticleOam_FlareHit_Frame10[] = {
    4,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_3 | 0xd0,
    0xec, OBJ_X_FLIP | 0xc, OBJ_PALETTE_3 | 0xd7,
    0xfe, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_3 | 0xd0,
    0xc, OBJ_Y_FLIP | 0x1ec, OBJ_PALETTE_3 | 0xd7
};

static const u16 sParticleOam_FlareHit_Frame11[] = {
    4,
    0xfa, OBJ_X_FLIP | 0x1fe, OBJ_PALETTE_3 | 0xf1,
    0x0, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_3 | 0xf1,
    0xf5, OBJ_X_FLIP | 0x3, OBJ_PALETTE_3 | 0xd0,
    0x4, OBJ_X_FLIP | 0x1f4, OBJ_PALETTE_3 | 0xd0
};

const struct FrameData sParticleOam_FlareHit[13] = {
    [0] = {
        .pFrame = sParticleOam_FlareHit_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sParticleOam_FlareHit_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sParticleOam_FlareHit_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_FlareHit_Frame3,
        .timer = 1
    },
    [4] = {
        .pFrame = sParticleOam_FlareHit_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sParticleOam_FlareHit_Frame5,
        .timer = 1
    },
    [6] = {
        .pFrame = sParticleOam_FlareHit_Frame6,
        .timer = 1
    },
    [7] = {
        .pFrame = sParticleOam_FlareHit_Frame7,
        .timer = 1
    },
    [8] = {
        .pFrame = sParticleOam_FlareHit_Frame8,
        .timer = 1
    },
    [9] = {
        .pFrame = sParticleOam_FlareHit_Frame9,
        .timer = 1
    },
    [10] = {
        .pFrame = sParticleOam_FlareHit_Frame10,
        .timer = 1
    },
    [11] = {
        .pFrame = sParticleOam_FlareHit_Frame11,
        .timer = 1
    },
    [12] = FRAME_DATA_TERMINATOR
};

static const u16 sParticleOam_NormalBeamHit_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xca
};

static const u16 sParticleOam_NormalBeamHit_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xcb
};

static const u16 sParticleOam_NormalBeamHit_Frame2[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xcc
};

static const u16 sParticleOam_NormalBeamHit_Frame3[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xcd
};

const struct FrameData sParticleOam_NormalBeamHit[5] = {
    [0] = {
        .pFrame = sParticleOam_NormalBeamHit_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sParticleOam_NormalBeamHit_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sParticleOam_NormalBeamHit_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_NormalBeamHit_Frame3,
        .timer = 1
    },
    [4] = FRAME_DATA_TERMINATOR
};

static const u16 sParticleOam_ChargeBeamHit_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xca
};

static const u16 sParticleOam_ChargeBeamHit_Frame1[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x143,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x143,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x143,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x143
};

static const u16 sParticleOam_ChargeBeamHit_Frame2[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x144,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x144,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x144,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x144
};

static const u16 sParticleOam_ChargeBeamHit_Frame3[] = {
    4,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x145,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x145,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x145,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x145
};

static const u16 sParticleOam_ChargeBeamHit_Frame4[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x146,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x146,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x146,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x146
};

const struct FrameData sParticleOam_ChargeBeamHit[6] = {
    [0] = {
        .pFrame = sParticleOam_ChargeBeamHit_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sParticleOam_ChargeBeamHit_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sParticleOam_ChargeBeamHit_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_ChargeBeamHit_Frame3,
        .timer = 1
    },
    [4] = {
        .pFrame = sParticleOam_ChargeBeamHit_Frame4,
        .timer = 1
    },
    [5] = FRAME_DATA_TERMINATOR
};

static const u16 sParticleOam_WideBeamHit_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xcb
};

static const u16 sParticleOam_WideBeamHit_Frame1[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x143,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x143,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x143,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x143
};

static const u16 sParticleOam_WideBeamHit_Frame2[] = {
    4,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x140,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x140,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x140,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x140
};

static const u16 sParticleOam_WideBeamHit_Frame3[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x141,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x141,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x141,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x141
};

static const u16 sParticleOam_WideBeamHit_Frame4[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x152,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x152,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x152,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x152
};

static const u16 sParticleOam_WideBeamHit_Frame5[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x154,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x154,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x154,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x154
};

static const u16 sParticleOam_WideBeamHit_Frame6[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x156,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x156,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x156,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0x156
};

const struct FrameData sParticleOam_WideBeamHit[8] = {
    [0] = {
        .pFrame = sParticleOam_WideBeamHit_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sParticleOam_WideBeamHit_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sParticleOam_WideBeamHit_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_WideBeamHit_Frame3,
        .timer = 1
    },
    [4] = {
        .pFrame = sParticleOam_WideBeamHit_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sParticleOam_WideBeamHit_Frame5,
        .timer = 1
    },
    [6] = {
        .pFrame = sParticleOam_WideBeamHit_Frame6,
        .timer = 1
    },
    [7] = FRAME_DATA_TERMINATOR
};

static const u16 sOam_3ee610[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xca
};

static const u16 sOam_3ee618[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xcb
};

static const u16 sOam_3ee620[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x140,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x140,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x140,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x140
};

static const u16 sOam_3ee63a[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x141,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x141,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x141,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x141
};

static const u16 sOam_3ee654[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x142,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x142,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x142,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x142
};

static const u16 sParticleOam_PlasmaBeamHit_Frame2[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0xd8,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0xd8,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_2 | 0xd8,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0xd8
};

static const u16 sOam_3ee688[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0xed,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xed,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xed,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xed
};

static const u16 sOam_3ee6a2[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0xec,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xec,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xec,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xec
};

static const u16 sParticleOam_PlasmaBeamHit_Frame0[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0xeb,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xeb,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xeb,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xeb
};

static const u16 sParticleOam_PlasmaBeamHit_Frame1[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0xee,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xee,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xee,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xee
};

static const u16 sOam_3ee6f0[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x144,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x144,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x144,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x144
};

static const u16 sOam_3ee70a[] = {
    4,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x145,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x145,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x145,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x145
};

static const u16 sParticleOam_PlasmaBeamHit_Frame5[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x146,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x146,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x146,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x146
};

const struct FrameData sParticleOam_PlasmaBeamHit[7] = {
    [0] = {
        .pFrame = sParticleOam_PlasmaBeamHit_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sParticleOam_PlasmaBeamHit_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sParticleOam_PlasmaBeamHit_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_PlasmaBeamHit_Frame0,
        .timer = 1
    },
    [4] = {
        .pFrame = sParticleOam_PlasmaBeamHit_Frame1,
        .timer = 1
    },
    [5] = {
        .pFrame = sParticleOam_PlasmaBeamHit_Frame5,
        .timer = 1
    },
    [6] = FRAME_DATA_TERMINATOR
};

static const u16 sParticleOam_InvincibleHit_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0x118
};

static const u16 sParticleOam_InvincibleHit_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0x119
};

static const u16 sParticleOam_InvincibleHit_Frame2[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x11a
};

static const u16 sParticleOam_InvincibleHit_Frame3[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x5c
};

static const u16 sParticleOam_InvincibleHit_Frame4[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x5e
};

const struct FrameData sParticleOam_InvincibleHit[6] = {
    [0] = {
        .pFrame = sParticleOam_InvincibleHit_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sParticleOam_InvincibleHit_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sParticleOam_InvincibleHit_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sParticleOam_InvincibleHit_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sParticleOam_InvincibleHit_Frame4,
        .timer = 2
    },
    [5] = FRAME_DATA_TERMINATOR
};

static const u16 sOam_3ee7d0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xe8
};

static const u16 sParticleOam_3eeb28_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xe9
};

static const u16 sParticleOam_3eeb28_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xea
};

static const u16 sParticleOam_3eeb28_Frame4[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x167,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x167,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x167,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x167
};

static const u16 sParticleOam_3eeb28_Frame5[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0xeb,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xeb,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xeb,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xeb
};

static const u16 sParticleOam_3eeb28_Frame8[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0xee,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xee,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xee,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xee
};

static const u16 sParticleOam_3eebc0_Frame0[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0xed,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xed,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xed,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xed
};

static const u16 sParticleOam_3eebc0_Frame1[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0xec,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xec,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xec,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xec
};

static const u16 sParticleOam_3eeb28_Frame11[] = {
    12,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0xeb,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f0, OBJ_PALETTE_2 | 0xce,
    0xf0, 0x1f8, OBJ_PALETTE_2 | 0xef,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xeb,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xeb,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xeb,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xce,
    0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xef,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xce,
    0x8, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xef,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_2 | 0xce,
    0x8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xef
};

static const u16 sParticleOam_3eebe8_Frame4[] = {
    8,
    0xf0, OBJ_Y_FLIP | 0x8, OBJ_PALETTE_2 | 0x163,
    0x8, 0x8, OBJ_PALETTE_2 | 0x163,
    0x8, OBJ_X_FLIP | 0x1f0, OBJ_PALETTE_2 | 0x163,
    0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_2 | 0x163,
    0xf9, 0x1f9, OBJ_PALETTE_2 | 0x164,
    0xf9, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_2 | 0x164,
    0xff, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_2 | 0x164,
    0xff, OBJ_Y_FLIP | 0x1f9, OBJ_PALETTE_2 | 0x164
};

static const u16 sParticleOam_3eebe8_Frame0[] = {
    4,
    0xf2, 0x1f2, OBJ_PALETTE_2 | 0x164,
    0xf2, OBJ_X_FLIP | 0x6, OBJ_PALETTE_2 | 0x164,
    0x6, OBJ_X_FLIP | OBJ_Y_FLIP | 0x6, OBJ_PALETTE_2 | 0x164,
    0x6, OBJ_Y_FLIP | 0x1f2, OBJ_PALETTE_2 | 0x164
};

static const u16 sParticleOam_3eebe8_Frame1[] = {
    4,
    0xf3, 0x1f3, OBJ_PALETTE_2 | 0x165,
    0xf3, OBJ_X_FLIP | 0x5, OBJ_PALETTE_2 | 0x165,
    0x5, OBJ_X_FLIP | OBJ_Y_FLIP | 0x5, OBJ_PALETTE_2 | 0x165,
    0x5, OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_2 | 0x165
};

static const u16 sParticleOam_3eebe8_Frame2[] = {
    4,
    0xf3, 0x1f3, OBJ_PALETTE_2 | 0x166,
    0xf3, OBJ_X_FLIP | 0x5, OBJ_PALETTE_2 | 0x166,
    0x5, OBJ_X_FLIP | OBJ_Y_FLIP | 0x5, OBJ_PALETTE_2 | 0x166,
    0x5, OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_2 | 0x166
};

static const u16 sParticleOam_3eebe8_Frame3[] = {
    8,
    0xf6, 0x1f6, OBJ_PALETTE_2 | 0x168,
    0xf6, OBJ_X_FLIP | 0x2, OBJ_PALETTE_2 | 0x168,
    0x2, OBJ_X_FLIP | OBJ_Y_FLIP | 0x2, OBJ_PALETTE_2 | 0x168,
    0x2, OBJ_Y_FLIP | 0x1f6, OBJ_PALETTE_2 | 0x168,
    0xee, 0x1ee, OBJ_PALETTE_2 | 0x163,
    0xee, OBJ_X_FLIP | 0xa, OBJ_PALETTE_2 | 0x163,
    0xa, OBJ_X_FLIP | OBJ_Y_FLIP | 0xa, OBJ_PALETTE_2 | 0x163,
    0xa, OBJ_Y_FLIP | 0x1ee, OBJ_PALETTE_2 | 0x163
};

static const u16 sOam_3ee966[] = {
    3,
    0xf3, 0x1f4, OBJ_PALETTE_2 | 0x149,
    0xf6, 0x9, OBJ_PALETTE_2 | 0x149,
    0x7, 0x1fc, OBJ_PALETTE_2 | 0x149
};

static const u16 sParticleOam_3eec18_Frame0[] = {
    3,
    0xf5, 0x1f5, OBJ_PALETTE_2 | 0x148,
    0xf7, 0x6, OBJ_PALETTE_2 | 0x148,
    0x4, 0x1fc, OBJ_PALETTE_2 | 0x148
};

static const u16 sParticleOam_3eec18_Frame1[] = {
    3,
    0xf7, 0x1f7, OBJ_PALETTE_2 | 0x148,
    0xf9, 0x4, OBJ_PALETTE_2 | 0x148,
    0x2, 0x1fc, OBJ_PALETTE_2 | 0x148
};

static const u16 sParticleOam_3eec18_Frame2[] = {
    6,
    0xee, 0x1f1, OBJ_PALETTE_2 | 0x149,
    0xf3, 0xc, OBJ_PALETTE_2 | 0x149,
    0xc, 0x1fd, OBJ_PALETTE_2 | 0x149,
    0xf8, 0x1f9, OBJ_PALETTE_2 | 0x148,
    0xfb, 0x2, OBJ_PALETTE_2 | 0x148,
    0x0, 0x1fc, OBJ_PALETTE_2 | 0x148
};

static const u16 sParticleOam_3eec18_Frame3[] = {
    6,
    0xf1, 0x1f3, OBJ_PALETTE_2 | 0x148,
    0xf4, 0x9, OBJ_PALETTE_2 | 0x148,
    0x9, 0x1fc, OBJ_PALETTE_2 | 0x148,
    0xf9, 0x1fa, OBJ_PALETTE_2 | 0x148,
    0xfc, 0x1, OBJ_PALETTE_2 | 0x148,
    0xff, 0x1fc, OBJ_PALETTE_2 | 0x148
};

static const u16 sOam_3ee9ee[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xca
};

static const u16 sOam_3ee9f6[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x143,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x143,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x143,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x143
};

static const u16 sOam_3eea10[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x144,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x144,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x144,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x144
};

static const u16 sOam_3eea2a[] = {
    4,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x145,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x145,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x145,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x145
};

static const u16 sOam_3eea44[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0x146,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0x146,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x146,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0x146
};

static const u16 sParticleOam_3eec40_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_4 | 0xe8
};

static const u16 sParticleOam_3eec40_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_4 | 0xe9
};

static const u16 sParticleOam_3eec40_Frame8[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_4 | 0xea
};

static const u16 sParticleOam_3eec40_Frame15[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_4 | 0xeb,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0xeb,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0xeb,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_4 | 0xeb
};

static const u16 sParticleOam_3eec40_Frame22[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_4 | 0xee,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0xee,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_4 | 0xee,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0xee
};

static const u16 sParticleOam_3eed58_Frame0[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_4 | 0xec,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0xec,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0xec,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_4 | 0xec
};

static const u16 sParticleOam_3eed58_Frame1[] = {
    8,
    0xf8, 0x1f8, OBJ_PALETTE_4 | 0xeb,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0xeb,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0xeb,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_4 | 0xeb,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x154,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x154,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x154,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x154
};

static const u16 sParticleOam_3eed58_Frame2[] = {
    8,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x156,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x156,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x156,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x156,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x152,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x152,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0x152,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0x152
};

const struct FrameData sParticleOam_3eeb28[19] = {
    [0] = {
        .pFrame = sParticleOam_3eeb28_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_3eeb28_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_3eeb28_Frame0,
        .timer = 4
    },
    [3] = {
        .pFrame = sParticleOam_3eeb28_Frame1,
        .timer = 4
    },
    [4] = {
        .pFrame = sParticleOam_3eeb28_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sParticleOam_3eeb28_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sParticleOam_3eeb28_Frame4,
        .timer = 4
    },
    [7] = {
        .pFrame = sParticleOam_3eeb28_Frame1,
        .timer = 4
    },
    [8] = {
        .pFrame = sParticleOam_3eeb28_Frame8,
        .timer = 4
    },
    [9] = {
        .pFrame = sParticleOam_3eeb28_Frame4,
        .timer = 4
    },
    [10] = {
        .pFrame = sParticleOam_3eeb28_Frame8,
        .timer = 4
    },
    [11] = {
        .pFrame = sParticleOam_3eeb28_Frame11,
        .timer = 4
    },
    [12] = {
        .pFrame = sParticleOam_3eeb28_Frame8,
        .timer = 4
    },
    [13] = {
        .pFrame = sParticleOam_3eeb28_Frame11,
        .timer = 4
    },
    [14] = {
        .pFrame = sParticleOam_3eeb28_Frame8,
        .timer = 4
    },
    [15] = {
        .pFrame = sParticleOam_3eeb28_Frame11,
        .timer = 4
    },
    [16] = {
        .pFrame = sParticleOam_3eeb28_Frame8,
        .timer = 4
    },
    [17] = {
        .pFrame = sParticleOam_3eeb28_Frame11,
        .timer = 4
    },
    [18] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3eebc0[5] = {
    [0] = {
        .pFrame = sParticleOam_3eebc0_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_3eebc0_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_3eeb28_Frame11,
        .timer = 4
    },
    [3] = {
        .pFrame = sParticleOam_3eeb28_Frame8,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3eebe8[6] = {
    [0] = {
        .pFrame = sParticleOam_3eebe8_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sParticleOam_3eebe8_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sParticleOam_3eebe8_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sParticleOam_3eebe8_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sParticleOam_3eebe8_Frame4,
        .timer = 2
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3eec18[5] = {
    [0] = {
        .pFrame = sParticleOam_3eec18_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_3eec18_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_3eec18_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sParticleOam_3eec18_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3eec40[35] = {
    [0] = {
        .pFrame = sParticleOam_3eec40_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_3eec40_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_3eec40_Frame0,
        .timer = 4
    },
    [3] = {
        .pFrame = sParticleOam_3eec40_Frame1,
        .timer = 4
    },
    [4] = {
        .pFrame = sParticleOam_3eec40_Frame0,
        .timer = 4
    },
    [5] = {
        .pFrame = sParticleOam_3eec40_Frame1,
        .timer = 4
    },
    [6] = {
        .pFrame = sParticleOam_3eec40_Frame0,
        .timer = 4
    },
    [7] = {
        .pFrame = sParticleOam_3eec40_Frame1,
        .timer = 4
    },
    [8] = {
        .pFrame = sParticleOam_3eec40_Frame8,
        .timer = 4
    },
    [9] = {
        .pFrame = sParticleOam_3eec40_Frame1,
        .timer = 4
    },
    [10] = {
        .pFrame = sParticleOam_3eec40_Frame8,
        .timer = 4
    },
    [11] = {
        .pFrame = sParticleOam_3eec40_Frame1,
        .timer = 4
    },
    [12] = {
        .pFrame = sParticleOam_3eec40_Frame8,
        .timer = 4
    },
    [13] = {
        .pFrame = sParticleOam_3eec40_Frame1,
        .timer = 4
    },
    [14] = {
        .pFrame = sParticleOam_3eec40_Frame8,
        .timer = 4
    },
    [15] = {
        .pFrame = sParticleOam_3eec40_Frame15,
        .timer = 4
    },
    [16] = {
        .pFrame = sParticleOam_3eec40_Frame8,
        .timer = 4
    },
    [17] = {
        .pFrame = sParticleOam_3eec40_Frame15,
        .timer = 4
    },
    [18] = {
        .pFrame = sParticleOam_3eec40_Frame8,
        .timer = 4
    },
    [19] = {
        .pFrame = sParticleOam_3eec40_Frame15,
        .timer = 4
    },
    [20] = {
        .pFrame = sParticleOam_3eec40_Frame8,
        .timer = 4
    },
    [21] = {
        .pFrame = sParticleOam_3eec40_Frame15,
        .timer = 4
    },
    [22] = {
        .pFrame = sParticleOam_3eec40_Frame22,
        .timer = 4
    },
    [23] = {
        .pFrame = sParticleOam_3eec40_Frame15,
        .timer = 4
    },
    [24] = {
        .pFrame = sParticleOam_3eec40_Frame22,
        .timer = 4
    },
    [25] = {
        .pFrame = sParticleOam_3eec40_Frame15,
        .timer = 4
    },
    [26] = {
        .pFrame = sParticleOam_3eec40_Frame22,
        .timer = 4
    },
    [27] = {
        .pFrame = sParticleOam_3eec40_Frame15,
        .timer = 4
    },
    [28] = {
        .pFrame = sParticleOam_3eec40_Frame22,
        .timer = 4
    },
    [29] = {
        .pFrame = sParticleOam_3eec40_Frame15,
        .timer = 4
    },
    [30] = {
        .pFrame = sParticleOam_3eec40_Frame22,
        .timer = 4
    },
    [31] = {
        .pFrame = sParticleOam_3eec40_Frame15,
        .timer = 4
    },
    [32] = {
        .pFrame = sParticleOam_3eec40_Frame22,
        .timer = 4
    },
    [33] = {
        .pFrame = sParticleOam_3eec40_Frame15,
        .timer = 4
    },
    [34] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_3eed58[4] = {
    [0] = {
        .pFrame = sParticleOam_3eed58_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sParticleOam_3eed58_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sParticleOam_3eed58_Frame2,
        .timer = 3
    },
    [3] = FRAME_DATA_TERMINATOR
};

static const u8 sBlob_3eed78_413afc[] = INCBIN_U8("data/Blob_3eed78_413afc.bin");
