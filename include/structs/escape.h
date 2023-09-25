#ifndef ESCAPE_STRUCTS_H
#define ESCAPE_STRUCTS_H

#include "types.h"
#include "macros.h"

struct __attribute__((packed)) EscapeDigits {
    u8 hundredths;
    u8 tenths;
    u8 secondsOnes;
    u8 secondsTens;
    u8 minutesOnes;
    u8 minutesTens;
};

enum EscapeStatus {
    ESCAPE_STATUS_NONE,
    ESCAPE_STATUS_HAPPENNING,
    ESCAPE_STATUS_FAILED
};

extern u8 gEscapeStatus;
extern u8 gEscapeTimerCounter;
extern struct EscapeDigits gEscapeTimerDigits;
extern u16 gEscapeDigitsOam[OAM_DATA_SIZE(8)];

#define CREATE_ESCAPE_TIMER(minutes, seconds, milli)\
{\
    gEscapeTimerDigits.hundredths = (milli) % 10;\
    gEscapeTimerDigits.tenths = (milli) / 10;\
    gEscapeTimerDigits.secondsOnes = (seconds) % 10;\
    gEscapeTimerDigits.secondsTens = (seconds) / 10;\
    gEscapeTimerDigits.minutesOnes = (minutes) % 10;\
    gEscapeTimerDigits.minutesTens = (minutes) / 10;\
}

#endif /* ESCAPE_STRUCTS_H */