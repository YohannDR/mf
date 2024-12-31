#ifndef PARTICLE_STRUCT_H
#define PARTICLE_STRUCT_H

#include "types.h"
#include "macros.h"

struct ParticleEffect {
    u8 status;
    u8 animationDurationCounter;
    u8 effect;
    u8 stage;
    u8 frameCounter;
    u16 currentAnimationFrame;
    u16 yPosition;
    u16 xPosition;
};

#define MAX_AMOUNT_OF_PARTICLES 16

extern struct ParticleEffect gParticleEffects[MAX_AMOUNT_OF_PARTICLES];
extern struct ParticleEffect gCurrentParticle;
extern const u16* gCurrentParticleEffectOamFramePointer;

#endif /* PARTICLE_STRUCT_H */
