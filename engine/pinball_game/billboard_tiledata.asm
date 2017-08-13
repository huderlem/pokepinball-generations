LoadMapBillboardTileData:
	ld a, [wCurrentMap]
	sla a
	ld c, a
	ld b, $0
	push bc
	ld hl, MapBillboardTileDataPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, Bank(MapBillboardTileDataPointers)
	call QueueGraphicsToLoad
	pop bc
	ld hl, MapBillboardPaletteDataPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, Bank(MapBillboardPaletteDataPointers)
	call QueueGraphicsToLoad
	ret

LoadBillboardTileData:
	sla a
	ld c, a
	ld b, $0
	push bc
	ld hl, BillboardTileDataPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, Bank(BillboardTileDataPointers)
	call QueueGraphicsToLoad
	pop bc
	ld hl, BillboardPaletteDataPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, Bank(BillboardPaletteDataPointers)
	call QueueGraphicsToLoad
	ret

INCLUDE "data/queued_tiledata/billboard.asm"
