#ifndef SPRITE_DEBRIS_CONSTANTS_H
#define SPRITE_DEBRIS_CONSTANTS_H

enum SpriteDebrisType {
    DEBRIS_TYPE_NONE,
    DEBRIS_TYPE_HOPPING_SLOW_LEFT,
    DEBRIS_TYPE_HOPPING_SLOW_RIGHT,
    DEBRIS_TYPE_HOPPING_FAST_RIGHT,
    DEBRIS_TYPE_HOPPING_FAST_LEFT,
    
    DEBRIS_TYPE_LIGHT_SLOW_LEFT,
    DEBRIS_TYPE_HEAVY_SLOW_RIGHT,
    DEBRIS_TYPE_LIGHT_SLOW_RIGHT,
    DEBRIS_TYPE_HEAVY_SLOW_LEFT,

    DEBRIS_TYPE_FALLING = (1 << 4),
    DEBRIS_TYPE_BOUNCING = (1 << 7),
};

#endif /* SPRITE_DEBRIS_CONSTANTS_H */
