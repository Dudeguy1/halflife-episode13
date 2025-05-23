/datum/job/shaft_miner
	title = JOB_SHAFT_MINER
	description = "Travel underground to the mines. Bring ores back to the factory for processing, loot underground regions."
	department_head = list(JOB_QUARTERMASTER)
	total_positions = 3
	spawn_positions = 3
	supervisors = SUPERVISOR_QM
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "SHAFT_MINER"

	outfit = /datum/outfit/job/miner
	plasmaman_outfit = /datum/outfit/plasmaman/mining

	paycheck = PAYCHECK_CITIZEN //Because you're supposed to earn money from mining.
	paycheck_department = ACCOUNT_CAR

	mind_traits = list(TRAIT_DETECT_STORM)

	display_order = JOB_DISPLAY_ORDER_SHAFT_MINER
	bounty_types = CIV_JOB_MINE
	departments_list = list(
		/datum/job_department/cargo,
		)

	skills = list(/datum/skill/mining = SKILL_EXP_JOURNEYMAN) //Of course they would know how to mine

	family_heirlooms = list(/obj/item/pickaxe/mini, /obj/item/shovel)
	rpg_title = "Adventurer"

	ration_bonus = 1


/datum/outfit/job/miner
	name = "Shaft Miner"
	jobtype = /datum/job/shaft_miner

	id_trim = /datum/id_trim/job/shaft_miner

	uniform = /obj/item/clothing/under/citizen
	head = /obj/item/clothing/head/utility/hardhat/halflife/mining
	r_pocket = /obj/item/hl2key/factory

	suit = /obj/item/clothing/suit/greenjacket

/datum/outfit/job/miner/equipped
	name = "Shaft Miner (Equipment)"

	suit = /obj/item/clothing/suit/hooded/explorer
	suit_store = /obj/item/tank/internals/oxygen
	backpack_contents = list(
		/obj/item/flashlight/seclite = 1,
		/obj/item/gun/energy/recharge/kinetic_accelerator = 1,
		/obj/item/knife/combat/survival = 1,
		/obj/item/mining_voucher = 1,
		/obj/item/stack/marker_beacon/ten = 1,
		/obj/item/t_scanner/adv_mining_scanner/lesser = 1,
	)
	glasses = /obj/item/clothing/glasses/meson
	mask = /obj/item/clothing/mask/gas/explorer
	internals_slot = ITEM_SLOT_SUITSTORE

/datum/outfit/job/miner/equipped/mod
	name = "Shaft Miner (Equipment + MODsuit)"
	back = /obj/item/mod/control/pre_equipped/mining
	suit = null
	mask = /obj/item/clothing/mask/gas/explorer

/datum/outfit/job/miner/equipped/combat
	name = "Shaft Miner (Combat-Ready)"
	glasses = /obj/item/clothing/glasses/hud/health/night/meson
	gloves = /obj/item/clothing/gloves/bracer
	accessory = /obj/item/clothing/accessory/talisman
	backpack_contents = list(
		/obj/item/storage/box/miner_modkits = 1,
		/obj/item/gun/energy/recharge/kinetic_accelerator = 2,
		/obj/item/kinetic_crusher/compact = 1,
		/obj/item/resonator/upgraded = 1,
		/obj/item/t_scanner/adv_mining_scanner/lesser = 1,
	)
	box = /obj/item/storage/box/survival/mining/bonus
	l_pocket = /obj/item/modular_computer/pda/shaftminer
	r_pocket = /obj/item/extinguisher/mini
	belt = /obj/item/storage/belt/mining/healing

/datum/outfit/job/miner/equipped/combat/post_equip(mob/living/carbon/human/miner, visuals_only = FALSE)
	. = ..()
	if(visuals_only)
		return
	var/list/miner_contents = miner.get_all_contents()
	var/obj/item/clothing/suit/hooded/explorer/explorer_suit = locate() in miner_contents
	if(explorer_suit)
		for(var/i in 1 to 3)
			var/obj/item/stack/sheet/animalhide/goliath_hide/plating = new()
			explorer_suit.attackby(plating)
		for(var/i in 1 to 3)
			var/obj/item/stack/sheet/animalhide/goliath_hide/plating = new()
			explorer_suit.hood.attackby(plating)
	for(var/obj/item/gun/energy/recharge/kinetic_accelerator/accelerator in miner_contents)
		var/datum/component/bayonet_attachable/bayonet = accelerator.GetComponent(/datum/component/bayonet_attachable)
		bayonet.add_bayonet(new /obj/item/knife/combat/survival(accelerator))
		var/obj/item/flashlight/seclite/flashlight = new()
		var/datum/component/seclite_attachable/light_component = accelerator.GetComponent(/datum/component/seclite_attachable)
		light_component.add_light(flashlight)
