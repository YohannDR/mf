#include "data/sa_x_close_up.h"
#include "macros.h"

const u16 sSaXCloseupPal[16 * 16] = INCBIN_U16("data/sa_x_close_up/palette.pal");
const u16 sSaXCloseupPalGreyscale[16 * 16] = INCBIN_U16("data/sa_x_close_up/palette_greyscale.pal");
const u8 sSaXCloseupGfx[] = INCBIN_U8("data/sa_x_close_up/graphics.gfx.lz"); ALIGN2();
const u8 sSaXCloseupFirstTileTable[] = INCBIN_U8("data/sa_x_close_up/first.tt.lz"); ALIGN2();
const u8 sSaXCloseupSecondTileTable[] = INCBIN_U8("data/sa_x_close_up/second.tt.lz"); ALIGN2();

const u8 sSaXCloseupDurations[2] = { 25, 60 };

static const u8 sBlob_73421e_79a29c[] = INCBIN_U8("data/Blob_73421e_79a29c.bin");
