#include "types.h"
#include "macros.h"

#include "structs/audio.h"

const struct TrackGroupROMData sMusicTrackDataRom[8] = {
    [0] = {
        .pTrack = 0x3005530,
        .pVariables = 0x3003e10,
        .maxAmountOfTracks = 10,
        .unknonw_A = 0
    },
    [1] = {
        .pTrack = 0x3005470,
        .pVariables = 0x3004130,
        .maxAmountOfTracks = 10,
        .unknonw_A = 1
    },
    [2] = {
        .pTrack = 0x30055b0,
        .pVariables = 0x3004450,
        .maxAmountOfTracks = 2,
        .unknonw_A = 1
    },
    [3] = {
        .pTrack = 0x3005430,
        .pVariables = 0x30044f0,
        .maxAmountOfTracks = 2,
        .unknonw_A = 0
    },
    [4] = {
        .pTrack = 0x30054f0,
        .pVariables = 0x3004590,
        .maxAmountOfTracks = 2,
        .unknonw_A = 1
    },
    [5] = {
        .pTrack = 0x30055f0,
        .pVariables = 0x3004630,
        .maxAmountOfTracks = 2,
        .unknonw_A = 1
    },
    [6] = {
        .pTrack = 0x30054b0,
        .pVariables = 0x30046d0,
        .maxAmountOfTracks = 3,
        .unknonw_A = 0
    },
    [7] = {
        .pTrack = 0x3005570,
        .pVariables = 0x30047c0,
        .maxAmountOfTracks = 1,
        .unknonw_A = 1
    }
};
