// FIXME: Tell people that this is a manifest file, real code should go into discrete files
// FIXME: Tell people how Sprockets and CoffeeScript works
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_self
//= require_directory ./application

if (typeof console == "undefined" || typeof console.log == "undefined") {
    console = {
        log : function() {
        }
    };
}
