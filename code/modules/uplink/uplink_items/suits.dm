// File ordered by progression

/datum/uplink_category/suits
	name = "Armor & Clothes"
	weight = 3

/datum/uplink_item/suits
	category = /datum/uplink_category/suits
	surplus = 40

/datum/uplink_item/suits/rebelsuit
	name = "Rebel Jumpsuit"
	desc = "A partially armored jumpsuit with no sensors built in."
	item = /obj/item/clothing/under/citizen/rebel
	cost = 3
	progression_minimum = 5 MINUTES

/datum/uplink_item/suits/copsuit
	name = "Civil protection vest"
	desc = "An armored vest that civil protection like to use, and rebels like to steal."
	item = /obj/item/clothing/suit/armor/civilprotection
	cost = 3
	progression_minimum = 5 MINUTES

/datum/uplink_item/suits/militaryhelmet
	name = "Military Helmet"
	desc = "A old world metal and kevlar helmet. Provides good protection for your head."
	item = /obj/item/clothing/head/helmet/halflife/military
	cost = 3
	progression_minimum = 5 MINUTES

/datum/uplink_item/suits/hevsuit
	name = "HEV Suit"
	desc = "A heavily armored suit designed for hazardous environments, with built in medical systems."
	item = /obj/item/clothing/suit/hooded/hev
	cost = 30
	progression_minimum = 15 MINUTES
