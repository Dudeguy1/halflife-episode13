/datum/job/prisoner
	title = JOB_PRISONER
	description = "Try to survive in the outlands, find a way into the city for supplies, help or rob citizens for your own gain."
	department_head = list("Nobody")
	total_positions = 12
	spawn_positions = 4
	supervisors = "nobody"
	exp_granted_type = EXP_TYPE_CREW
	paycheck = PAYCHECK_ZERO
	config_tag = "PRISONER"

	outfit = /datum/outfit/job/refugee/fixeditems
	plasmaman_outfit = /datum/outfit/plasmaman/prisoner

	display_order = JOB_DISPLAY_ORDER_PRISONER
	department_for_prefs = /datum/job_department/assistant

	exclusive_mail_goodies = TRUE
	mail_goodies = list (
		/obj/effect/spawner/random/contraband/prison = 1
	)

	family_heirlooms = list(/obj/item/pen/blue)
	rpg_title = "Defeated Miniboss"

	job_flags = JOB_EQUIP_RANK|JOB_CREW_MEMBER|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS
	faction = FACTION_STATION

	cmode_music = 'hl13/sound/music/combat/cpviolation.ogg' //cause they're a cp violation

	gameplay_help = "As a refugee, expect to die a lot, espescially if you do not stay with allies. The outlands are a harsh, dangerous, and unforgiving place. You'll have to try to scavenge, craft, and loot what you need to survive. Your first priority should be to craft an armored vest from cloth and scrap, and get some food."

/datum/outfit/job/prisoner
	name = "Outlands Refugee"
	jobtype = /datum/job/prisoner

	id = null
	uniform = /obj/item/clothing/under/citizen/refugee

/datum/outfit/job/refugee/fixeditems
	name = "Outlands Refugee with items pouch"
	jobtype = /datum/job/prisoner

	id = /obj/item/card/id/advanced/halflife/orange
	id_trim = /datum/id_trim/job/prisoner
	uniform = /obj/item/clothing/under/citizen/refugee

	r_pocket = /obj/item/flashlight

	belt = /obj/item/storage/belt/pouch/refugee

/datum/outfit/job/refugee/randomitems
	name = "Outlands Refugee with a random item"
	jobtype = /datum/job/prisoner
	id = /obj/item/card/id/advanced/halflife/orange

	id_trim = /datum/id_trim/job/prisoner
	uniform = /obj/item/clothing/under/citizen/refugee

	r_pocket = /obj/item/flashlight
	var/list/rhand_items = list(
		/obj/item/storage/belt/pouch,
		/obj/item/reagent_containers/pill/patch/medkit,
		/obj/item/storage/box/halflife/ration/ration,
		/obj/item/knife/kitchen,
		/obj/item/clothing/suit/armor/armored
		) //Refugees get a random item from this list

/datum/outfit/job/refugee/randomitems/post_equip(mob/living/carbon/human/H, visualsOnly=FALSE)
	if(visualsOnly)
		return
	var/chosen = pick(rhand_items)
	var/turf/T = get_turf(H)
	var/obj/item/I = new chosen(T)
	H.put_in_hands(I)

/datum/job/prisoner/after_latejoin_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.outlands_latejoin)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))

/datum/outfit/job/refugee/armed
	name = "Armed Outlands Refugee"
	jobtype = /datum/job/prisoner

	id = /obj/item/card/id/advanced/halflife/orange
	id_trim = /datum/id_trim/job/prisoner
	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/armored
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp

	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted

	r_pocket = /obj/item/flashlight
	l_pocket = /obj/item/reagent_containers/pill/patch/medkit/vial

	belt = /obj/item/storage/belt/pouch/refugee

/datum/outfit/job/refugee/armed/medium
	name = "Armed Outlands Refugee (Medium)"

	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	back = /obj/item/storage/backpack/halflife/satchel

	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
		/obj/item/ammo_box/magazine/usp9mm = 2,
	)

/datum/outfit/job/refugee/armed/heavy
	name = "Armed Outlands Refugee (Heavy)"

	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	suit_store = /obj/item/gun/ballistic/rifle/boltaction/mosin_nagant

	head = /obj/item/clothing/head/helmet/halflife/military

	back = /obj/item/storage/backpack/halflife/satchel

	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
		/obj/item/ammo_box/strilka310/a762 = 2,
	)
