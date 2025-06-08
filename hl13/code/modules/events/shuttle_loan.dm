/datum/shuttle_loan_situation/halflife/department_resupply
	sender = "City Worker's Union"
	announcement_text = "As part of a grant, you've been authorized a resupply of additional departmental goods sent on your cargo train."
	shuttle_transit_text = "Department resupply incoming."
	thanks_msg = "The cargo shuttle should return in five minutes."
	bonus_points = 0
	logging_desc = "Resupply packages"

/datum/shuttle_loan_situation/halflife/department_resupply/spawn_items(list/spawn_list, list/empty_shuttle_turfs, list/blocked_shutte_turfs)
	var/list/crate_types = list(
		/datum/supply_pack/organic/complete_rationsupplies,
		/datum/supply_pack/organic/alcohol,
		/datum/supply_pack/security/armory/uspammo,
		/datum/supply_pack/medical/medvial
		)
	for(var/crate in crate_types)
		var/datum/supply_pack/pack = SSshuttle.supply_packs[crate]
		pack.generate(pick_n_take(empty_shuttle_turfs))

	for(var/i in 1 to 5)
		var/decal = pick(/obj/effect/decal/cleanable/food/flour, /obj/effect/decal/cleanable/robot_debris, /obj/effect/decal/cleanable/oil)
		new decal(pick_n_take(empty_shuttle_turfs))

/datum/shuttle_loan_situation/halflife/necrotics
	sender = "Ministry of Infestation Control"
	announcement_text = "Necrotics have infested one of our supply depots. If you send your train to take some of them away with you, we can reward you well."
	shuttle_transit_text = "Necrotics incoming."
	logging_desc = "Necrotic Infestation"
	bonus_points = CARGO_CRATE_VALUE * 22

/datum/shuttle_loan_situation/halflife/necrotics/spawn_items(list/spawn_list, list/empty_shuttle_turfs, list/blocked_shutte_turfs)

	spawn_list.Add(/mob/living/basic/halflife/zombie)
	spawn_list.Add(/mob/living/basic/halflife/zombie/zombine)
	spawn_list.Add(/mob/living/basic/halflife/headcrab)
	spawn_list.Add(/mob/living/basic/halflife/headcrab/armored)
	spawn_list.Add(/mob/living/basic/halflife/headcrab/poison)
	if(prob(50))
		spawn_list.Add(/mob/living/basic/halflife/zombie/poison)

/datum/shuttle_loan_situation/halflife/heavy_infestation
	sender = "Ministry of Infestation Control"
	announcement_text = "A heavy infestation has been detected aboard one of our trains, and is in dire need of cleaning. If you send your train to take some of them away with you, we can reward you well."
	shuttle_transit_text = "Many Necrotics incoming."
	logging_desc = "Heavy Necrotic Infestation"
	bonus_points = CARGO_CRATE_VALUE * 28

/datum/shuttle_loan_situation/halflife/heavy_infestation/spawn_items(list/spawn_list, list/empty_shuttle_turfs, list/blocked_shutte_turfs)

	spawn_list.Add(/mob/living/basic/halflife/zombie/fungal)
	spawn_list.Add(/mob/living/basic/halflife/zombie/fungal)
	spawn_list.Add(/mob/living/basic/halflife/zombie/fungal)
	spawn_list.Add(/mob/living/basic/halflife/zombie/fungal)
	spawn_list.Add(/mob/living/basic/halflife/headcrab/armored)
	spawn_list.Add(/mob/living/basic/halflife/headcrab/armored)
	spawn_list.Add(/mob/living/basic/halflife/headcrab/armored)
	spawn_list.Add(/obj/structure/flora/xen/cougher)
	spawn_list.Add(/obj/structure/flora/xen/cougher)
	spawn_list.Add(/obj/structure/alien/weeds)
	spawn_list.Add(/obj/structure/alien/weeds)
	spawn_list.Add(/obj/structure/alien/weeds)
	spawn_list.Add(/obj/structure/alien/weeds)
	spawn_list.Add(/obj/structure/alien/weeds)
	spawn_list.Add(/obj/structure/alien/weeds)
