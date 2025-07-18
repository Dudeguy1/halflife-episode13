/datum/quirk/strong_stomach
	name = "Iron Stomach"
	desc = "You can eat food discarded on the ground without getting sick, won't get stomach parasites from unclean water and raw food, and vomiting affects you less."
	icon = FA_ICON_FACE_GRIN_BEAM_SWEAT
	value = 10
	mob_trait = TRAIT_STRONG_STOMACH
	gain_text = span_notice("You feel like you could eat anything!")
	lose_text = span_danger("Looking at food on the ground makes you feel a little queasy.")
	medical_record_text = "Patient has a stronger than average immune system...to food poisoning, at least."
	mail_goodies = list(
		/obj/item/reagent_containers/pill/ondansetron,
	)
