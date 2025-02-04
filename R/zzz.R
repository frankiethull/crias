

.onLoad <- function(libname, pkgname) {
  #rlang::run_on_load()
  S7::methods_register()
}
