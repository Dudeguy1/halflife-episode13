//The combine are supposed to Hunt Down The Freeman this guy.
/datum/outfit/deployment_loadout/freeman/the_freeman
	name = "VS Freeman: The Free Man"
	display_name = "The Free Man"
	desc = "Time to fuck up someone's face."

	uniform = /obj/item/clothing/under/citizen/rebel
	back = /obj/item/storage/backpack/halflife/satchel/huge
	suit = /obj/item/clothing/suit/hooded/hev/deathmatch/freeman //extra fast
	glasses = /obj/item/clothing/glasses/regular/thin

	l_hand = /obj/item/crowbar/large/freeman //little bit weaker than the standard classes's crowbar, to make using the guns better

	backpack_contents = list(
		/obj/item/grenade/syndieminibomb/bouncer = 2,
		/obj/item/gun/ballistic/automatic/pistol/usp,
		/obj/item/ammo_box/magazine/usp9mm,
		/obj/item/gun/ballistic/revolver/coltpython,
		/obj/item/ammo_box/colta357,
		/obj/item/gun/ballistic/shotgun/spas12,
		/obj/item/storage/box/lethalshot/halflife,
		/obj/item/gun/ballistic/automatic/mp7,
		/obj/item/ammo_box/magazine/mp7,
		/obj/item/gun/ballistic/automatic/ar2/standardpin,
		/obj/item/gun/ballistic/rifle/rebarxbow,
		/obj/item/ammo_casing/rebar,
		/obj/item/ammo_casing/rebar,
		/obj/item/reagent_containers/pill/patch/medkit,
		/obj/item/reagent_containers/pill/patch/medkit/vial,
	)

/datum/outfit/deployment_loadout/freeman/the_freeman/pre_equip(mob/living/carbon/human/H)
	. = ..()
	H.set_species(/datum/species/human)
	H.skin_tone = "caucasian2"
	H.set_haircolor("#663300", update = FALSE)
	H.set_hairstyle("Business Hair", update = TRUE)
	H.set_facial_haircolor("#996633", update = FALSE)
	H.set_facial_hairstyle("Goatee", update = TRUE)
	H.eye_color_left = "#666633"
	H.eye_color_right = "#666633"
	H.update_body()
	ADD_TRAIT(H, TRAIT_ANALGESIA, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHUNGER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_FREERUNNING, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_MUTE, OUTFIT_TRAIT) //...

	H.setdeploymentfaction(FREEMAN_DEPLOYMENT_FACTION)
	if(update_globals)
		GLOB.number_of_freemen++

/datum/outfit/deployment_loadout/freeman/the_freeman/post_equip(mob/living/carbon/human/H)
	. = ..()
	H.fully_replace_character_name(H.real_name,"Gordon Freeman")
	var/list/spawn_locs = list()
	for(var/X in GLOB.vs_freeman)
		spawn_locs += X

	if(!spawn_locs.len)
		message_admins("No valid spawn locations found, aborting...")
		return MAP_ERROR

	H.forceMove(pick(spawn_locs))
