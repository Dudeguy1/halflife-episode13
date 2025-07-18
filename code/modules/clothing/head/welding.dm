/obj/item/clothing/head/utility/welding
	name = "welding helmet"
	desc = "An old welding helmet. Useful for welding of course, but also functions as a makeshift helmet to provide some protection against injuries." //hl13 edit
	icon_state = "welding"
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH | PEPPERPROOF
	inhand_icon_state = "welding"
	lefthand_file = 'icons/mob/inhands/clothing/masks_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/clothing/masks_righthand.dmi'
	custom_materials = list(/datum/material/iron=HALF_SHEET_MATERIAL_AMOUNT*1.75, /datum/material/glass=SMALL_MATERIAL_AMOUNT * 4)
	flash_protect = FLASH_PROTECTION_WELDER
	tint = 2
	armor_type = /datum/armor/utility_welding
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDESNOUT
	actions_types = list(/datum/action/item_action/toggle)
	visor_flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDESNOUT
	visor_flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH | PEPPERPROOF
	visor_vars_to_toggle = VISOR_FLASHPROTECT | VISOR_TINT
	resistance_flags = FIRE_PROOF
	clothing_flags = SNUG_FIT | STACKABLE_HELMET_EXEMPT

/obj/item/clothing/head/utility/welding/Initialize(mapload)
	. = ..()
	if(!up)
		AddComponent(/datum/component/adjust_fishing_difficulty, 8)

/datum/armor/utility_welding
	melee = 10
	bullet = 10 //hl13 edit
	fire = 100
	acid = 60

/obj/item/clothing/head/utility/welding/attack_self(mob/user)
	adjust_visor(user)

/obj/item/clothing/head/utility/welding/adjust_visor(mob/user)
	. = ..()
	if(up)
		qdel(GetComponent(/datum/component/adjust_fishing_difficulty))
	else
		AddComponent(/datum/component/adjust_fishing_difficulty, 8)

/obj/item/clothing/head/utility/welding/update_icon_state()
	. = ..()
	icon_state = "[initial(icon_state)][up ? "up" : ""]"
	inhand_icon_state = "[initial(inhand_icon_state)][up ? "off" : ""]"
