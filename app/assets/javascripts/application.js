// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.minicolors
//= require jquery.minicolors.simple_form
//= require foundation
//= require turbolinks
//= require foundation-datepicker
//= require jquery.formatter.min
//= require starrr
//= require Chart
//= require knockout
//= require pikaday
//= require jstz.min
//= require moment
//= require utils
//= require_tree .


$(function(){ $(document).foundation(); });

//Hack for turbolinks
$(document).ready(rs_ready);
$(document).on('page:load', rs_ready);