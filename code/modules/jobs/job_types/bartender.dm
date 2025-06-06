/datum/job/bartender
	title = JOB_BARTENDER
	description = "Operate the city's bar, listen to the labor lead, try not to get shut down. You are also landlord to the attached apartment block and carry keys for it and it's amenities."
	department_head = list(JOB_HEAD_OF_PERSONNEL)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_HOP
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "BARTENDER"

	outfit = /datum/outfit/job/bartender
	plasmaman_outfit = /datum/outfit/plasmaman/bar

	paycheck = PAYCHECK_CITIZEN
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_BARTENDER
	bounty_types = CIV_JOB_DRINK
	departments_list = list(
		/datum/job_department/service,
		)

	family_heirlooms = list(/obj/item/reagent_containers/cup/rag, /obj/item/clothing/head/hats/tophat, /obj/item/reagent_containers/cup/glass/shaker)

	mail_goodies = list(
		/obj/item/storage/box/rubbershot = 30,
		/obj/item/reagent_containers/cup/bottle/clownstears = 10,
		/obj/item/stack/sheet/mineral/plasma = 10,
		/obj/item/stack/sheet/mineral/uranium = 10,
	)

	job_flags = STATION_JOB_FLAGS
	rpg_title = "Tavernkeeper"

/datum/job/bartender/award_service(client/winner, award)
	winner.give_award(award, winner.mob)

	var/datum/venue/bar = SSrestaurant.all_venues[/datum/venue/bar]
	var/award_score = bar.total_income
	var/award_status = winner.get_award_status(/datum/award/score/bartender_tourist_score)
	if(award_score - award_status > 0)
		award_score -= award_status
	winner.give_award(/datum/award/score/bartender_tourist_score, winner.mob, award_score)


/datum/outfit/job/bartender
	name = "Bartender"
	jobtype = /datum/job/bartender
	id = /obj/item/card/id/advanced/halflife/grey

	id_trim = /datum/id_trim/job/bartender
	glasses = /obj/item/clothing/glasses/sunglasses/reagent
	uniform = /obj/item/clothing/under/citizen
	r_pocket = /obj/item/hl2key/bar
	glasses = /obj/item/clothing/glasses/sunglasses/reagent


	skillchips = list(/obj/item/skillchip/drunken_brawler)

/datum/outfit/job/bartender/post_equip(mob/living/carbon/human/H, visuals_only)
	. = ..()

	var/obj/item/card/id/W = H.wear_id
	if(H.age < AGE_MINOR)
		W.registered_age = AGE_MINOR
		to_chat(H, span_notice("You're not technically old enough to access or serve alcohol, but your ID has been discreetly modified to display your age as [AGE_MINOR]. Try to keep that a secret!"))
