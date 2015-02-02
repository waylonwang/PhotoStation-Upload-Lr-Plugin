--[[----------------------------------------------------------------------------

PSUploadExportServiceProvider.lua
Export service provider description for Lightroom PhotoStation Upload
Copyright(c) 2015, Martin Messmer

This file is part of PhotoStation Upload - Lightroom plugin.

PhotoStation Upload is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

PhotoStation Upload is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with PhotoStation Upload.  If not, see <http://www.gnu.org/licenses/>.

This code is derived from the Lr SDK FTP Upload sample code. Copyright: see below
--------------------------------------------------------------------------------

ADOBE SYSTEMS INCORPORATED
 Copyright 2007-2008 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE: Adobe permits you to use, modify, and distribute this file in accordance
with the terms of the Adobe license agreement accompanying it. If you have received
this file from a source other than Adobe, then your use, modification, or distribution
of it requires the prior written permission of Adobe.

------------------------------------------------------------------------------]]

-- PhotoStation Upload plug-in
require "PSUploadExportDialogSections"
require "PSUploadTask"

--============================================================================--

return {
	
	hideSections = { 'exportLocation' },

	allowFileFormats = nil, -- nil equates to all available formats
	
	allowColorSpaces = nil, -- nil equates to all color spaces

	canExportVideo = true,	-- yes, we can
	
	exportPresetFields = {
--		{ key = 'exiftoolprog', default = nil },
		{ key = 'PSUploaderPath', default = nil },	-- local path to Synology PhotoStation Uploader
		{ key = 'proto', default = 'http' },		-- transport protocol for PhotoStation upload
		{ key = 'servername', default = nil },		-- name/address of the PhotoStation, may include ':port' extension
		{ key = 'serverUrl', default = nil },		-- proto + servername
		{ key = 'psUrl', default = nil },			-- serverUrl + destination album (used for synopsis)
		{ key = 'username', default = nil },		-- account for PhotoStation upload
		{ key = 'password', default = nil },		-- guess what...
		{ key = 'copyTree', default = false },		-- upload method: flat copy or tree mirror
		{ key = 'srcRoot', default = nil },			-- local path to root of picture folders (only used if copyTree)
		{ key = 'dstRoot', default = nil },			-- destination Album on PhotoStation: no leading or trailing slash required
		{ key = 'isPS6', default = false },			-- use upload optimization for PhotoStation 6 (not THUMB_L required)
		{ key = 'usePersonalPS', default = false },	-- upload to Personal PhotoStation
		{ key = 'personalPSOwner', default = nil },	-- owner of the Personal PhotoStation to upload to
	},

	startDialog = PSUploadExportDialogSections.startDialog,
	sectionsForBottomOfDialog = PSUploadExportDialogSections.sectionsForBottomOfDialog,
	
	processRenderedPhotos = PSUploadTask.processRenderedPhotos,
	
}