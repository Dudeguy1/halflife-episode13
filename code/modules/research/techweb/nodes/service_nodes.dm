/datum/techweb_node/office_equip
	id = TECHWEB_NODE_OFFICE_EQUIP
	starting_node = TRUE
	display_name = "Office Equipment"
	description = "The Combine's finest in ergonomic office tech, ensuring district admin stays productive and compliant with union policies — because even postwar, paperwork never stops."
	design_ids = list(
		"fax",
		"sec_pen",
		"handlabel",
		"roll",
		"universal_scanner",
		"desttagger",
		"packagewrap",
		"sticky_tape",
		"toner_large",
		"toner",
		"boxcutter",
		"bounced_radio",
		"radio_headset",
		"earmuffs",
		"recorder",
		"tape",
		"toy_balloon",
		"pet_carrier",
		"chisel",
		"spraycan",
		"camera_film",
		"camera",
		"razor",
		"bucket",
		"mop",
		"pushbroom",
		"normtrash",
		"wirebrush",
		"flashlight",
	)

/datum/techweb_node/sanitation
	id = TECHWEB_NODE_SANITATION
	display_name = "Advanced Sanitation Technology"
	description = "The Combine's latest in janitorial tech, making sure the district stays spotless and bear-free."
	prereq_ids = list(TECHWEB_NODE_OFFICE_EQUIP)
	design_ids = list(
		"advmop",
		"light_replacer",
		"spraybottle",
		"paint_remover",
		"beartrap",
		"buffer",
		"vacuum",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS)
	discount_experiments = list(/datum/experiment/scanning/random/janitor_trash = TECHWEB_TIER_2_POINTS)
	announce_channels = list(RADIO_CHANNEL_SERVICE)

/datum/techweb_node/consoles
	id = TECHWEB_NODE_CONSOLES
	display_name = "Civilian Consoles"
	description = "User-friendly consoles for non-technical citizens, enhancing communication and access to essential district information."
	prereq_ids = list(TECHWEB_NODE_OFFICE_EQUIP)
	design_ids = list(
		"comconsole",
		"automated_announcement",
		"cargo",
		"cargorequest",
		"med_data",
		"crewconsole",
		"bankmachine",
		"account_console",
		"idcard",
		"c-reader",
		"libraryconsole",
		"libraryscanner",
		"bookbinder",
		"barcode_scanner",
		"vendor",
		"custom_vendor_refill",
		"bounty_pad_control",
		"bounty_pad",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_1_POINTS)
	announce_channels = list(RADIO_CHANNEL_SERVICE)

/datum/techweb_node/gaming
	id = TECHWEB_NODE_GAMING
	display_name = "Gaming"
	description = "For district loyalists."
	prereq_ids = list(TECHWEB_NODE_CONSOLES)
	design_ids = list(
		"arcade_battle",
		"arcade_orion",
		"slotmachine",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS)
	discount_experiments = list(/datum/experiment/physical/arcade_winner = TECHWEB_TIER_2_POINTS)

// Kitchen root node
/datum/techweb_node/cafeteria_equip
	id = TECHWEB_NODE_CAFETERIA_EQUIP
	starting_node = TRUE
	display_name = "Cafeteria Equipment"
	description = "When standard-issue tubed food no longer satisfies the ctizen's appetite..."
	design_ids = list(
		"griddle",
		"microwave",
		"bowl",
		"plate",
		"oven_tray",
		"servingtray",
		"tongs",
		"spoon",
		"fork",
		"kitchen_knife",
		"plastic_spoon",
		"plastic_fork",
		"plastic_knife",
		"shaker",
		"drinking_glass",
		"shot_glass",
		"coffee_cartridge",
		"coffeemaker",
		"coffeepot",
		"syrup_bottle",
	)

/datum/techweb_node/food_proc
	id = TECHWEB_NODE_FOOD_PROC
	display_name = "Food Processing"
	description = "Top-tier kitchen appliances from the Combine, designed to keep the district well-fed and happy."
	prereq_ids = list(TECHWEB_NODE_CAFETERIA_EQUIP)
	design_ids = list(
		"deepfryer",
		"oven",
		"stove",
		"range",
		"souppot",
		"processor",
		"gibber",
		"monkey_recycler",
		"reagentgrinder",
		"microwave_engineering",
		"smartfridge",
		"dehydrator",
		"sheetifier",
		"fat_sucker",
		"dish_drive",
		"roastingstick",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS)
	announce_channels = list(RADIO_CHANNEL_SERVICE)

// Fishing root node
/datum/techweb_node/fishing_equip
	id = TECHWEB_NODE_FISHING_EQUIP
	display_name = "Fishing Equipment"
	description = "Basic fishing gear tailored for post-war city environments, perfect for aquatic pursuits."
	design_ids = list(
		"fishing_rod",
		"fish_case",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_1_POINTS)

/datum/techweb_node/fishing_equip_adv
	id = TECHWEB_NODE_FISHING_EQUIP_ADV
	display_name = "Advanced Fishing Tools"
	description = "Continuing advancements in fishing technology, incorporating cutting-edge features in fishing operations."
	prereq_ids = list(TECHWEB_NODE_FISHING_EQUIP)
	design_ids = list(
		"fishing_rod_tech",
		"fishing_portal_generator",
		"fishing_gloves",
		"mod_fishing",
		"stabilized_hook",
		"auto_reel",
		"fish_analyzer",
		"bluespace_fish_case",
		"bluespace_fish_tank_kit",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS)
	required_experiments = list(/datum/experiment/scanning/fish)

/datum/techweb_node/marine_util
	id = TECHWEB_NODE_MARINE_UTIL
	display_name = "Marine Utility"
	description = "Fish are nice to look at and all, but they can be put to use."
	prereq_ids = list(TECHWEB_NODE_FISHING_EQUIP_ADV)
	design_ids = list(
		"bioelec_gen",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)
	// only available if you've done the first fishing experiment (thus unlocking fishing tech), but not a strict requirement to get the tech
	discount_experiments = list(/datum/experiment/scanning/fish/second = TECHWEB_TIER_3_POINTS)
