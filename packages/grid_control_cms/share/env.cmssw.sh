#!/bin/bash
#-#  Copyright 2010-2013 Karlsruhe Institute of Technology
#-#
#-#  Licensed under the Apache License, Version 2.0 (the "License");
#-#  you may not use this file except in compliance with the License.
#-#  You may obtain a copy of the License at
#-#
#-#      http://www.apache.org/licenses/LICENSE-2.0
#-#
#-#  Unless required by applicable law or agreed to in writing, software
#-#  distributed under the License is distributed on an "AS IS" BASIS,
#-#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#-#  See the License for the specific language governing permissions and
#-#  limitations under the License.

# grid-control: https://ekptrac.physik.uni-karlsruhe.de/trac/grid-control

echo "Searching for CMSSW environment..."
if [ -n "$VO_CMS_SW_DIR" ]; then
	echo "[CMS-SITE] Using $VO_CMS_SW_DIR"
else
	# Fallback - try different default values for CMSSW directory

	# Fix for OSG sites
	if [ -n "$OSG_APP" -a -d "$OSG_APP" ]; then
		export VO_CMS_SW_DIR="$OSG_APP/cmssoft/cms"
		echo "[OSG-SITE] Using $VO_CMS_SW_DIR"

	# User forced directories / known during development
	elif [ -n "$CMSSW_DIR_USER" -a -d "$CMSSW_DIR_USER" ]; then
		export VO_CMS_SW_DIR="$CMSSW_DIR_USER"
		echo "[USER-SITE] Using $VO_CMS_SW_DIR"
	elif [ -n "$CMSSW_DIR_PRO" -a -d "$CMSSW_DIR_PRO" ]; then
		export VO_CMS_SW_DIR="$CMSSW_DIR_PRO"
		echo "[PROJ-SITE] Using $VO_CMS_SW_DIR"

	# Try other software directories
	elif [ -d "/afs/cern.ch/cms" ]; then
		export VO_CMS_SW_DIR="/afs/cern.ch/cms"
		echo "[AFS-SITE] Using $VO_CMS_SW_DIR"
	fi
fi
