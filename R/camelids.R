# @@@@@@@@@@@@@@@@ playable character parent class @@@@@@@@@ #

#                @@@@@ camelid parent class @@@@@
#' a base class for camelids
#' @export
camelids <- S7::new_class(
  "camelids",
  properties = list(
    name         = new_property(class_character, default = "Larry"),

    strength     = new_property(class_numeric, default = 10),
    perception   = new_property(class_numeric, default = 10),
    endurance    = new_property(class_numeric, default = 10),
    charisma     = new_property(class_numeric, default = 10),
    intelligence = new_property(class_numeric, default = 10),
    agility      = new_property(class_numeric, default = 10),
    luck         = new_property(class_numeric, default = 10),
    level        = new_property(class_numeric, default = 1),
    hp           = new_property(class_numeric, default = 12)
  )
)


# @@@@@@@@@@@@   camelid-lamini species & sub-classes @@@@@@@@@@@@@@@@@@ #
# sub-classes can be expanded
# which willl allow for
# separate properties depending on species-subclass

#                    @@@@   llama   @@@@
#' llama species
#' @export
llama <- new_class(
  "llama",
  parent = camelids,
  properties = list(
    species  = new_property(class_character, default = "llama"),
    subclass = new_property(class_character, default = "guardian"),
    special  = new_property(class_character, default = "pack healer"),
    info     = new_property(class_character, default = "keeps the herd together and safe"),
    is_human = new_property(class_logical,   default = TRUE),
    model    = new_property(class_character, default = "none")
  )
)

#                    @@@@  alpaca  @@@@
#' alpaca species
#' @export
alpaca <- new_class(
  "alpaca",
  parent = camelids,
  properties = list(
    species  = new_property(class_character, default = "alpaca"),
    subclass = new_property(class_character, default = "ranger"),
    special  = new_property(class_character, default = "pack scout"),
    info     = new_property(class_character, default = "keeps the herd aware of and avoids danger"),
    is_human = new_property(class_logical,   default = FALSE),
    model    = new_property(class_character, default = "smollm2")
  )
)

#                    @@@@ guanaco @@@@
#' guanaco species
#' @export
guanaco <- new_class(
  "guanaco",
  parent = camelids,
  properties = list(
    species  = new_property(class_character, default = "guanaco"),
    subclass = new_property(class_character, default = "survivalist"),
    special  = new_property(class_character, default = "climbing and trekking"),
    info     = new_property(class_character, default = "high probability of safe routes and survival"),
    is_human = new_property(class_logical,   default = FALSE),
    model    = new_property(class_character, default = "tinyllama")
  )
)

#                   @@@@  vicuna  @@@@
#' vicuna species
#' @export
vicuna <- new_class(
  "vicuna",
  parent = camelids,
  properties = list(
    species  = new_property(class_character, default = "vicuna"),
    subclass = new_property(class_character, default = "rogue"),
    special  = new_property(class_character, default = "stealth and camouflage"),
    info     = new_property(class_character, default = "quick, quiet, and evades easily"),
    is_human = new_property(class_logical,   default = FALSE),
    model    = new_property(class_character, default = "tinyllama")
  )
)


# @@@@@@@@@@@@@@@@@@@@ character description @@@@@@@@@@@@@@@@@@@ #
#
#' character describer
#' @export
describe <- S7::new_generic("describe", "x")
method(describe, camelids) <- \(x) {
  paste0(
    x@name, " is a level ", x@level, " ", x@subclass, " ", x@species, " with ",
    x@hp, " hp, ",
    x@strength, " strength, ", x@perception, " perception, ", x@endurance, " endurance, ",
    x@charisma, " charisma, ", x@intelligence, " intelligence, ", x@agility, " agility, and ",
    x@luck, " luck.     \n

    trait: ", x@info, " \n
    specialty: ", x@special,

    "you must follow the lead of the previous character. \n
    Try to maintain agreement with (party leader). \n
    keep your response within a 10 to 200 token range.\n

    pachamama is the game moderator, respect the storyline.
    "
  )
}


# larry_llama <- llama()
# describe(larry_llama) |> cat()

# @@@@@@@@@@@@@@@@@@@@@@@@@ herd builder @@@@@@@@@@@@@@@@@@@@@@@@@ #

#                @@@@ define a crias herd @@@@
#' herd of lamini
#' @export
herd <- new_class(
  name = "herd",
  properties = list(
    characters = class_list
  )
)

# herd(characters = list(llama(), alpaca()))
