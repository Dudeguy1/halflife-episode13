/obj/machinery/crate_spawner //no attrition, kill anticitizen one or die
	name = "crate spawner"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x"
	anchored = TRUE
	layer = OBJ_LAYER
	plane = GAME_PLANE
	invisibility = INVISIBILITY_MAXIMUM
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

	var/last_spawn = 1 MINUTES

/obj/machinery/crate_spawner/Initialize(mapload)
	.=..()
	START_PROCESSING(SSprocessing, src)

/obj/machinery/crate_spawner/process()
	if(last_spawn < 1 SECONDS)
		if(!var/obj/machinery/supply_crate/supply in range(1, src) && prob(50))
			playsound(src, 'hl13/sound/effects/ammo_pickup.ogg', 50, TRUE, extrarange = -3)
			new /obj/machinery/supply_crate(loc)
		last_spawn = 1 MINUTES
	else
		last_spawn -= 1 SECONDS
