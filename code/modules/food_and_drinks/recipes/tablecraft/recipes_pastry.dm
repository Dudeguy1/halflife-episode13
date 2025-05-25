
// see code/module/crafting/table.dm

////////////////////////////////////////////////DONUTS////////////////////////////////////////////////

/datum/crafting_recipe/food/donut
	time = 15
	name = "Donut"
	reqs = list(
		/datum/reagent/consumable/sugar = 1,
		/obj/item/food/pastrybase = 1
	)
	result = /obj/item/food/donut/plain
	category = CAT_PASTRY

// It is so stupid that we have to do this but because food crafting clears all reagents that got added during init,
// here we are adding it again (but only for crafting, maploaded and spawned donuts work fine).
// Until the issues with crafted items' reagents are resolved this will have to do
/datum/crafting_recipe/food/donut/on_craft_completion(mob/user, atom/result)
	. = ..()
	var/obj/item/food/donut/donut_result = result
	if(donut_result.is_decorated)
		donut_result.reagents.add_reagent(/datum/reagent/consumable/sprinkles, 1)

/datum/crafting_recipe/food/donut/jelly
	name = "Jelly donut"
	reqs = list(
		/datum/reagent/consumable/berryjuice = 5,
		/obj/item/food/pastrybase = 1
	)
	result = /obj/item/food/donut/jelly/plain

/datum/crafting_recipe/food/donut/berry
	name = "Berry Donut"
	reqs = list(
		/datum/reagent/consumable/berryjuice = 3,
		/obj/item/food/donut/plain = 1
	)
	result = /obj/item/food/donut/berry

/datum/crafting_recipe/food/donut/apple
	name = "Apple Donut"
	reqs = list(
		/datum/reagent/consumable/applejuice = 3,
		/obj/item/food/donut/plain = 1
	)
	result = /obj/item/food/donut/apple

/datum/crafting_recipe/food/donut/caramel
	name = "Caramel Donut"
	reqs = list(
		/datum/reagent/consumable/caramel = 3,
		/obj/item/food/donut/plain = 1
	)
	result = /obj/item/food/donut/caramel

/datum/crafting_recipe/food/donut/choco
	name = "Chocolate Donut"
	reqs = list(
		/obj/item/food/chocolatebar = 1,
		/obj/item/food/donut/plain = 1
	)
	result = /obj/item/food/donut/choco

/datum/crafting_recipe/food/donut/blumpkin
	name = "Blumpkin Donut"
	reqs = list(
		/datum/reagent/consumable/blumpkinjuice = 3,
		/obj/item/food/donut/plain = 1
	)
	result = /obj/item/food/donut/blumpkin

/datum/crafting_recipe/food/donut/bungo
	name = "Bungo Donut"
	reqs = list(
		/datum/reagent/consumable/bungojuice = 3,
		/obj/item/food/donut/plain = 1
	)
	result = /obj/item/food/donut/bungo

/datum/crafting_recipe/food/donut/matcha
	name = "Matcha Donut"
	reqs = list(
		/datum/reagent/toxin/teapowder = 3,
		/obj/item/food/donut/plain = 1
	)
	result = /obj/item/food/donut/matcha

////////////////////////////////////////////////////JELLY DONUTS///////////////////////////////////////////////////////

/datum/crafting_recipe/food/donut/jelly/berry
	name = "Berry Jelly Donut"
	reqs = list(
		/datum/reagent/consumable/berryjuice = 3,
		/obj/item/food/donut/jelly/plain = 1
	)
	result = /obj/item/food/donut/jelly/berry

/datum/crafting_recipe/food/donut/jelly/apple
	name = "Apple Jelly Donut"
	reqs = list(
		/datum/reagent/consumable/applejuice = 3,
		/obj/item/food/donut/jelly/plain = 1
	)
	result = /obj/item/food/donut/jelly/apple

/datum/crafting_recipe/food/donut/jelly/caramel
	name = "Caramel Jelly Donut"
	reqs = list(
		/datum/reagent/consumable/caramel = 3,
		/obj/item/food/donut/jelly/plain = 1
	)
	result = /obj/item/food/donut/jelly/caramel

/datum/crafting_recipe/food/donut/jelly/choco
	name = "Chocolate Jelly Donut"
	reqs = list(
		/obj/item/food/chocolatebar = 1,
		/obj/item/food/donut/jelly/plain = 1
	)
	result = /obj/item/food/donut/jelly/choco

/datum/crafting_recipe/food/donut/jelly/matcha
	name = "Matcha Jelly Donut"
	reqs = list(
		/datum/reagent/toxin/teapowder = 3,
		/obj/item/food/donut/jelly/plain = 1
	)
	result = /obj/item/food/donut/jelly/matcha

////////////////////////////////////////////////WAFFLES////////////////////////////////////////////////

/datum/crafting_recipe/food/waffles
	time = 15
	name = "Waffles"
	reqs = list(
		/obj/item/food/pastrybase = 2
	)
	result = /obj/item/food/waffles
	category = CAT_PASTRY


/datum/crafting_recipe/food/soylenviridians
	name = "Soylent viridians"
	reqs = list(
		/obj/item/food/pastrybase = 2,
		/obj/item/food/grown/soybeans = 1
	)
	result = /obj/item/food/soylenviridians
	category = CAT_PASTRY

/datum/crafting_recipe/food/soylentgreen
	name = "Soylent green"
	reqs = list(
		/obj/item/food/pastrybase = 2,
		/obj/item/food/meat/slab/human = 2
	)
	result = /obj/item/food/soylentgreen
	category = CAT_PASTRY


/datum/crafting_recipe/food/rofflewaffles
	name = "Roffle waffles"
	reqs = list(
		/datum/reagent/drug/mushroomhallucinogen = 5,
		/obj/item/food/pastrybase = 2
	)
	result = /obj/item/food/rofflewaffles
	category = CAT_PASTRY

////////////////////////////////////////////////MUFFINS////////////////////////////////////////////////

/datum/crafting_recipe/food/muffin
	time = 15
	name = "Muffin"
	reqs = list(
		/datum/reagent/consumable/milk = 5,
		/obj/item/food/pastrybase = 1
	)
	result = /obj/item/food/muffin
	category = CAT_PASTRY

/datum/crafting_recipe/food/berrymuffin
	name = "Berry muffin"
	reqs = list(
		/datum/reagent/consumable/milk = 5,
		/obj/item/food/pastrybase = 1,
		/obj/item/food/grown/berries = 1
	)
	result = /obj/item/food/muffin/berry
	category = CAT_PASTRY

////////////////////////////////////////////OTHER////////////////////////////////////////////


/datum/crafting_recipe/food/khachapuri
	name = "Khachapuri"
	reqs = list(
		/datum/reagent/consumable/eggyolk = 2,
		/datum/reagent/consumable/eggwhite = 4,
		/obj/item/food/cheese/wedge = 1,
		/obj/item/food/bread/plain = 1
	)
	result = /obj/item/food/khachapuri
	category = CAT_PASTRY

/datum/crafting_recipe/food/sugarcookie
	time = 15
	name = "Sugar cookie"
	reqs = list(
		/datum/reagent/consumable/sugar = 5,
		/obj/item/food/pastrybase = 1
	)
	result = /obj/item/food/cookie/sugar
	category = CAT_PASTRY

/datum/crafting_recipe/food/spookyskull
	time = 15
	name = "Skull cookie"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/datum/reagent/consumable/sugar = 5,
		/datum/reagent/consumable/milk = 5
	)
	result = /obj/item/food/cookie/sugar/spookyskull
	category = CAT_PASTRY

/datum/crafting_recipe/food/spookycoffin
	time = 15
	name = "Coffin cookie"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/datum/reagent/consumable/sugar = 5,
		/datum/reagent/consumable/coffee = 5
	)
	result = /obj/item/food/cookie/sugar/spookycoffin
	category = CAT_PASTRY

/datum/crafting_recipe/food/fortunecookie
	time = 15
	name = "Fortune cookie"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/paper = 1
	)
	parts = list(
		/obj/item/paper = 1
	)
	result = /obj/item/food/fortunecookie
	category = CAT_PASTRY

/datum/crafting_recipe/food/poppypretzel
	time = 15
	name = "Poppy pretzel"
	reqs = list(
		/obj/item/seeds/poppy = 1,
		/obj/item/food/pastrybase = 1
	)
	result = /obj/item/food/poppypretzel
	category = CAT_PASTRY

/datum/crafting_recipe/food/plumphelmetbiscuit
	time = 15
	name = "Plumphelmet biscuit"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/food/grown/mushroom/plumphelmet = 1
	)
	result = /obj/item/food/plumphelmetbiscuit
	category = CAT_PASTRY

/datum/crafting_recipe/food/cracker
	time = 15
	name = "Cracker"
	reqs = list(
		/datum/reagent/consumable/salt = 1,
		/obj/item/food/pastrybase = 1,
	)
	result = /obj/item/food/cracker
	category = CAT_PASTRY

/datum/crafting_recipe/food/chococornet
	name = "Choco cornet"
	reqs = list(
		/datum/reagent/consumable/salt = 1,
		/obj/item/food/pastrybase = 1,
		/obj/item/food/chocolatebar = 1
	)
	result = /obj/item/food/chococornet
	category = CAT_PASTRY

/datum/crafting_recipe/food/oatmealcookie
	name = "Oatmeal cookie"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/food/grown/oat = 1
	)
	result = /obj/item/food/cookie/oatmeal
	category = CAT_PASTRY

/datum/crafting_recipe/food/raisincookie
	name = "Raisin cookie"
	reqs = list(
		/obj/item/food/no_raisin = 1,
		/obj/item/food/pastrybase = 1,
		/obj/item/food/grown/oat = 1
	)
	result = /obj/item/food/cookie/raisin
	category = CAT_PASTRY

/datum/crafting_recipe/food/cherrycupcake
	name = "Cherry cupcake"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/food/grown/cherries = 1
	)
	result = /obj/item/food/cherrycupcake
	category = CAT_PASTRY

/datum/crafting_recipe/food/bluecherrycupcake
	name = "Blue cherry cupcake"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/food/grown/bluecherries = 1
	)
	result = /obj/item/food/cherrycupcake/blue
	category = CAT_PASTRY

/datum/crafting_recipe/food/honeybun
	name = "Honey bun"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/datum/reagent/consumable/honey = 5
	)
	result = /obj/item/food/honeybun
	category = CAT_PASTRY

/datum/crafting_recipe/food/cannoli
	name = "Cannoli"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/datum/reagent/consumable/milk = 3,
		/datum/reagent/consumable/sugar = 5
	)
	result = /obj/item/food/cannoli
	category = CAT_PASTRY

/datum/crafting_recipe/food/peanut_butter_cookie
	name = "Peanut butter cookie"
	reqs = list(
		/datum/reagent/consumable/peanut_butter = 5,
		/obj/item/food/pastrybase = 1
	)
	result = /obj/item/food/cookie/peanut_butter
	category = CAT_PASTRY

/datum/crafting_recipe/food/raw_brownie_batter
	name = "Raw brownie batter"
	reqs = list(
		/datum/reagent/consumable/flour = 15,
		/datum/reagent/consumable/sugar = 15,
		/obj/item/food/egg = 2,
		/datum/reagent/consumable/coco = 10,
		/obj/item/food/butterslice = 1
	)
	result = /obj/item/food/raw_brownie_batter
	category = CAT_PASTRY

/datum/crafting_recipe/food/peanut_butter_brownie_batter
	name = "Raw peanut butter brownie batter"
	reqs = list(
		/datum/reagent/consumable/flour = 15,
		/datum/reagent/consumable/sugar = 15,
		/obj/item/food/egg = 2,
		/datum/reagent/consumable/coco = 10,
		/datum/reagent/consumable/peanut_butter = 5,
		/obj/item/food/butterslice = 1
	)
	result = /obj/item/food/peanut_butter_brownie_batter
	category = CAT_PASTRY

/datum/crafting_recipe/food/crunchy_peanut_butter_tart
	name = "Crunchy peanut butter tart"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/datum/reagent/consumable/peanut_butter = 5,
		/obj/item/food/grown/peanut = 1,
		/datum/reagent/consumable/cream = 5,
	)
	result = /obj/item/food/crunchy_peanut_butter_tart
	category = CAT_PASTRY

/datum/crafting_recipe/food/chocolate_chip_cookie
	name = "Chocolate chip cookie"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/food/chocolatebar = 1,
	)
	result = /obj/item/food/cookie/chocolate_chip_cookie
	category = CAT_PASTRY

/datum/crafting_recipe/food/snickerdoodle
	name = "Snickerdoodle"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/datum/reagent/consumable/vanilla = 5,
	)
	result = /obj/item/food/cookie/snickerdoodle
	category = CAT_PASTRY

/datum/crafting_recipe/food/thumbprint_cookie
	name = "Thumbprint cookie"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/datum/reagent/consumable/cherryjelly = 5,
	)
	result = /obj/item/food/cookie/thumbprint_cookie
	category = CAT_PASTRY

/datum/crafting_recipe/food/macaron
	name = "Macaron"
	reqs = list(
		/datum/reagent/consumable/eggwhite = 2,
		/datum/reagent/consumable/cream = 5,
		/datum/reagent/consumable/flour = 5,
	)
	result = /obj/item/food/cookie/macaron
	category = CAT_PASTRY
