#ifndef AUDIO_STRUCTS_H
#define AUDIO_STRUCTS_H

#include "types.h"

struct MusicTrackInfo {
    u16 currentRoomTrack;
    u8 pauseScreenFlag;
};

struct TrackGroupROMData {
    u32 pTrack;
    u32 pVariables;
    u16 maxAmountOfTracks;
    u16 unknonw_A;
};

struct SoundEntry {
    const u8* pHeader;
    u16 trackGroundNumber;
    u16 trackGroundNumber_2;
};

struct MusicInfo {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
    u8 unk_4;
    u8 unk_5;
    u8 unk_6;
    u8 unk_7;
    u8 unk_8;
    u8 unk_9;
    u8 unk_A;
    u8 unk_B;
    u8 unk_C;
    u8 unk_D;
    u8 unk_E;
    u8 unk_F;
    u8 unk_10;
    u8 unk_11;
    u8 unk_12;
    u8 unk_13;
    u8 unk_14;
    u8 unk_15;
    u8 unk_16;
    u8 unk_17;
    u8 unk_18;
    u8 unk_19;
    u8 unk_1A;
    u8 unk_1B;
    u8 unk_1C;
    u8 unk_1D;
    u8 unk_1E;
    u8 unk_1F;
    u8 unk_20;
    u8 unk_21;
    u8 unk_22;
    u8 unk_23;
    u8 unk_24;
};

extern struct MusicTrackInfo gMusicTrackInfo;

extern struct MusicInfo gMusicInfo;

#endif /* AUDIO_STRUCTS_H */
