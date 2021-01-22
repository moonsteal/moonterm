#!/usr/bin/env lua

--[[--
 @package   MoonTerm
 @filename  moonterm.lua
 @version   1.0
 @author    Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      16.01.2021 23:52:45 -04
--]]

shell 				= os.getenv("SHELL") or "/bin/sh"
inifile				= require("libraries.LIP")
utils				= require("libraries.utils")

lgi					= require("lgi")
Gtk					= lgi.require('Gtk', '3.0')
Vte					= lgi.Vte
GLib				= lgi.GLib

app					= Gtk.Application()
term				= Vte.Terminal()

utils:create_config('moonterm','moonterm.ini')
dir 				= ('%s/moonterm'):format(GLib.get_user_config_dir())
conf				= inifile:load(('%s/moonterm.ini'):format(dir))

-- MoonTerm
require('src.moonterm-popover')
require('src.moonterm-app')
require('src.moonterm-dialog')

app:run()
