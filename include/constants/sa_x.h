#ifndef SA_X_CONSTANTS_H
#define SA_X_CONSTANTS_H

#include "types.h"

enum SaXPose {
    SA_X_POSE_RUNNING,
    SA_X_POSE_WALKING,
    SA_X_POSE_STANDING,
    SA_X_POSE_SHOOTING,
    SA_X_POSE_TURNING,
    SA_X_POSE_MID_AIR,
    SA_X_POSE_LANDING,
    SA_X_POSE_FALLING,
    SA_X_POSE_GETTING_HURT,
    SA_X_POSE_SHOOTING_RESTRICTED_LABORATORY,
    SA_X_POSE_COVERED_BY_METROIDS,
    SA_X_POSE_KNEELING,
    SA_X_POSE_TRANSFORMING_INTO_MONSTER,
    SA_X_POSE_MORPHING,
    SA_X_POSE_UNMORPHING,
    SA_X_POSE_MORPH_BALL,
    SA_X_POSE_ROLLING,
    SA_X_POSE_SWAG_WALK,
    SA_X_POSE_TURNING_TOWARDS_CAMERA,
    SA_X_POSE_TURNING_AWAY_FROM_CAMERA,
    
    SA_X_POSE_END,

    SA_X_POSE_NONE = UCHAR_MAX
};

enum SaXScreenFlag {
    SA_X_SCREEN_FLAG_NOT_PRESENT,
    SA_X_SCREEN_FLAG_OFF_SCREEN,
    SA_X_SCREEN_FLAG_ON_SCREEN
};

#endif /* SA_X_CONSTANTS_H */