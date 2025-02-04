# @@@@@@@@@@@@@@@@@@@@@@@ notes @@@@@@@@@@@@@@@@@@@@@@ -

# defining dice for the game -
# these are functions + tools that will be
# registered to pachamama to handle any dice rolls

# @@@@@@@@@@@@@@@@@@@@@ functions @@@@@@@@@@@@@@@@@@@@@ -

#' 4-sided die
#'
#' @returns a number
#' @export
#'
#' @examples roll_d4()
roll_d4 <- \(){
  return(base::sample(1:4, 1))
}

#' 6-sided die
#'
#' @returns a number
#' @export
#'
#' @examples roll_d6()
roll_d6 <- \(){
  return(base::sample(1:6, 1))
}

#' 8-sided die
#'
#' @returns a number
#' @export
#'
#' @examples roll_d8()
roll_d8 <- \(){
  return(base::sample(1:8, 1))
}

#' 10-sided die
#'
#' @returns a number
#' @export
#'
#' @examples roll_d10()
roll_d10 <- \(){
  return(base::sample(1:10, 1))
}

#' 12-sided die
#'
#' @returns a number
#' @export
#'
#' @examples roll_d12()
roll_d12 <- \(){
  return(base::sample(1:12, 1))
}

#' 20-sided die
#'
#' @returns a number
#' @export
#'
#' @examples roll_d20()
roll_d20 <- \(){
  return(base::sample(1:20, 1))
}

# @@@@@@@@@@@@@@@@@@@@@ tools @@@@@@@@@@@@@@@@@@@@@ -
#
#' a 4-sided die tool
#' @export
d4 <- ellmer::tool(
  roll_d4,
  "rolls a random number for a 4-sided die."
)

#' a 6-sided die tool
#' @export
d6 <- ellmer::tool(
  roll_d6,
  "rolls a random number for a 6-sided die."
)

#' a 8-sided die tool
#' @export
d8 <- ellmer::tool(
  roll_d8,
  "rolls a random number for a 8-sided die."
)

#' a 10-sided die tool
#' @export
d10 <- ellmer::tool(
  roll_d10,
  "rolls a random number for a 10-sided die."
)

#' a 12-sided die tool
#' @export
d12 <- ellmer::tool(
  roll_d12,
  "rolls a random number for a 12-sided die."
)

#' a 20-sided die tool
#' @export
d20 <- ellmer::tool(
  roll_d20,
  "rolls a random number for a 20-sided die."
)
