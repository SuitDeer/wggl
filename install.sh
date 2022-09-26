#!/bin/bash

# Wireguard-GUI for unix systems (zenity) required
# Author: SuitDeer
# Project: WGGL (Wireguard GUI for Linux)
# Github: https://github.com/SuitDeer/wggl
#

# Create base directory 
if test -d ~/wggl
	then
		echo "Base directory exists."
	else
		mkdir ~/wggl
		cp $0 ~/wggl/wggl.sh
		chmod a+x ~/wggl/wggl.sh
	fi

# Create Wireguard.desktop file on desktop 
# Get folder name of desktop
DESKTOP_FOLER_NAME=$(cat ~/.config/user-dirs.dirs | sed -n '/XDG_DESKTOP_DIR/p' | sed 's/.*\///g' | sed 's/"//g')
if test -f ~/${DESKTOP_FOLER_NAME}/Wireguard.desktop
then
	echo "Wireguard.desktop exists."
else
	echo "~/${DESKTOP_FOLER_NAME}/Wireguard.desktop dont exists. Create it."
	
	# Create icon.svg file for .desktop file on desktop
	echo '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="90px"
	height="90px" viewBox="-0.8 -0.8 80 80">
	<defs/>
	<g>
		<ellipse cx="39.5" cy="39.5" rx="39.5" ry="36" fill="#ffffff" stroke="none" transform="rotate(-90,39.5,39.5)"
			pointer-events="all" />
		<image x="-0.5" y="-0.5" width="88" height="88"
			xlink:href="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI4OC4xNG1tIiB2aWV3Qm94PSIwLDAsODguMTQyNyw4OC4xNDI3IiBoZWlnaHQ9Ijg4LjE0bW0iPiYjeGE7IDxtZXRhZGF0YS8+JiN4YTsgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMTU4Ljc4IC03OC4zKSIgc3Ryb2tlLXdpZHRoPSIuMjY1Ij4mI3hhOyAgPHBhdGggZmlsbD0iIzg4MTcxYSIgZD0ibS03OS40NzA5IDExNi44MTZzMS44MzYxLTM4LjUxMjgtNDAuNDkxOC0zOC41MTI4Yy0zNy40MzMyIDAtMzguNjAyNyAzNi45NDM4LTM4LjYwMjcgMzYuOTQzOHMtNS41MDYyNCA0Mi40MzEyIDM5LjQ2NTIgNDIuNDMxMmM0My4xMzI0IDAgMzkuNjI5My00MC44NjIyIDM5LjYyOTMtNDAuODYyMnptLTUyLjMzNDYtMTMuNDU3NWM3Ljk0Mi00Ljg1ODgxIDE4LjA4ODUtMS44ODkxNiAyMS44OTAzIDUuNDE3Ni43MjA1NCAxLjM4NDc4LjgxMjExIDMuNTE2NTguMzU1NzggNC45Njk0MS0xLjU3NTQ4IDUuMDE1NDQtNS4yOTUzNyA3LjgyODIzLTEwLjQwMTMgOS4wMjMwOCAxLjUwNTI3LTEuMjg4NyAyLjcwMzUyLTIuNzUwMDcgMy4wODQ3OC00Ljc2OTExYTYuOTg1NTMgNi45ODU1MyAwIDAgMCAtMS4yMDE4Ny01LjU0NDYxIDcuMDgwMjUgNy4wODAyNSAwIDAgMCAtOC4xNTIwOC0yLjQ4NDIyYy0zLjE0MzUxIDEuMTkzNTYtNC44NjU0MiA0LjA2MjQxLTQuNTU1MDYgNy41ODkwNC4yODgzNCAzLjI3NTgxIDIuNzczODkgNS4zOTg4MiA3LjQyNDQ3IDYuMjA1MjctLjY5NTA2LjM2Nzg4LTEuMjMwMzkuNjM4ODEtMS43NTQxNi45MzA1OWExNi45MTE2IDE2LjkxMTYgMCAwIDAgLTUuNDM1NiA0LjcyNzU4Yy0uNDcxOTkuNjM3MjItLjc5NjUuNjg4NTUtMS41MTUyNy4yNDkwMS05LjM0OTg0LTUuNzE3NjQtOS45NTA3MS0yMC4wNjcuMjU5ODktMjYuMzEzNnptLTYuOTk3OTcgMzUuMzI5OGMtMS41MDIwMS4zODEyNi0yLjk1NzUxLjk0NTY3LTQuNDkyODkgMS40NDkyNS43NTEwMi01LjA2NzAzIDYuNjg0Ny05LjczMzQ5IDExLjcwMjUtOS4yMDExNWExMi45MzMxIDEyLjkzMzEgMCAwIDAgLTIuNDQ1MjggNi44NTA4NmMtMS42Njc0LjMwNzA4LTMuMjM4NzYuNTEzNjYtNC43NjQzNS45MDA5MXptMzEuOTU5LTQ5LjQ3MThjMS40ODQyOS4wNTQ1NCAyLjk3MTI3LjAzMTk5IDQuNDU2NjUuMDY3MTVhNy42ODY2OCA3LjY4NjY4IDAgMCAxIDEuMTAyNjIuMTUzNjQgMTAuNzQzOSAxMC43NDM5IDAgMCAxIC0xLjEyMDcgMS40Mzc1M2MtLjUzMTAxLjQ5NDgtMS4xMzA5Ni45Nzg1OS0xLjg5NjAzLjIyNjQ4LS4xODQwMS0uMTgwOS0uNjE4NzUtLjEzOTM4LS45Mzg5Mi0uMTQzNi0xLjQ3Njk5LS4wMTk0MS0yLjk1NTkzLS4wNjY2MS00LjQzMDcyLS4wMTA5M2EyNy41MjcyIDI3LjUyNzIgMCAwIDAgLTMuODE2NjEuMzg5NzNjLS4yMzY0NS4wNDI0Ni0uNTg5OTkuODI4NTQtLjQ4MTMgMS4xMTgzOS4yNTY0Ni42ODQwMy42MzA1OCAxLjQzODM1IDEuMTg0NzcgMS44NzU4NCAyLjA0Nzk2IDEuNjE2NiA0LjIyNTkzIDMuMDY4MTEgNi4yODMzMyA0LjY3MzYgMS45OTkxOSAxLjU2MDE0IDMuODYgMy4yNjk3MiA0Ljk5NDAxIDUuNjIzMTkgMS40Nzc1MSAzLjA2NjUyIDEuNTIwNTYgNi4yODIuODgzMzkgOS41MTE3Ny0xLjA2MzcgNS4zOTE2OC0zLjc5MjI3IDkuODU4NjQtOC4yMTA1NSAxMy4xMDMyLTEuNzgwMzMgMS4zMDczMS0zLjk4NDYzIDIuMDQ5MjMtNi4wMjM3NyAyLjk4ODQ3LTEuNzkzMzQuODI2MTYtMy42MzkzNCAxLjUzNzYzLTUuNDM2OTIgMi4zNTUwMS0zLjI0MDg4IDEuNDczNTktNS4wNjIyNyA0Ljk5MTM2LTQuNTI2NDkgOC42NDg3LjQ5MTcyIDMuMzU2MjQgMy40MzYxNCA2LjE1NzExIDYuODA5MDUgNi43MzUyMyA0LjA0NjAxLjY5MzYzIDguMjIwODctMS45MzU3NyA5LjIxMDY3LTYuMDQ4MzggMS4xMTMwMy00LjYyNDM4LTEuMzk5NTktOC43NTMyMS02LjEwMjYxLTEwLjAwNDctLjIwNzA5LS4wNTUxLS40MTQ5Ny0uMTA3MjktLjg0Njk5LS4yMTg3OCAxLjI1ODA3LS41NjIxMSAyLjM0NDU4LS45NjI1OCAzLjM0Nzc4LTEuNTE0NThxMi42MjUwMS0xLjQ0NDQ3IDUuMTU0MzUtMy4wNTkxMWMuNDk1ODgtLjMxNzI0Ljc2Mzc5LS4zMTc0IDEuMTg2Ny4wNDgyIDMuMjM0NTQgMi43OTY2NCA1LjE2NDE0IDYuMjc1MzkgNS43MDUyMiAxMC41NDA3Ljg5NTQ4IDcuMDYwMTQtMi40NDY2MyAxMy41NDYxLTguNzUwMyAxNi44NzA0LTkuNzUyNTUgNS4xNDMyMy0yMS42ODY2LS43MTA3OC0yMy44NDA2LTExLjUyMzEtMS44NDUxNS05LjI2MTIxIDQuNjkxMDYtMTcuNjYyIDEyLjU1NzYtMTkuMjgzOSAzLjM4MzIzLS42OTc1NSA2LjQ3Ny0yLjEwNTk4IDguODgyMDctNC43MTE0MyAxLjU1MTgzLTEuNjgxMTkgMi4zMDQwOS0zLjEyMzY4IDIuNTYwNDItMy43NzQ1NWExMC40NjgyIDEwLjQ2ODIgMCAwIDAgLjcxOTk2LTMuODI4MjYgOC45NjA2NCA4Ljk2MDY0IDAgMCAwIC0uNzg0Ni0zLjI4MDNjLS44MjEyNi0xLjg3MTkzLTMuOTY3NDItNC44NDk4Mi00Ljc0NjM2LTUuNDc3OTRsLTcuNDA4MzMtNS43OTk5M2MtLjI2MTMtLjIxNDk5LS41NTU0Ny0uMTk5NDEtMS4xOTI3MS0uMTU2MjItLjc1Ny4wNTEzMS0yLjY5MjE0LjE1ODQ1LTMuNTI3MTctLjA2MDM2LjY3NTQ5LS41MTEyIDIuNTE3MDQtMS4yNTU0OCAzLjMwNzgzLTEuODUzOTQtMi40MDA2Ny0xLjYyMTgyLTUuMTQwODYtMS4wMzYwNi03LjY1NzMxLTEuNTIwMzIuNTgxODctMS4wODM3MSAzLjQ2MTAxLTIuNzQ5MDIgNS4wOTg1Mi0yLjkzNDQ5YTI0LjIxODEgMjQuMjE4MSAwIDAgMCAtLjQ0NjUxLTIuNzIwMThjLS4xLS4zNjgyMi0uNTEwOTYtLjcyNTE3LS44Njk1My0uOTM1NDQtLjg2OTQyLS41MDk3Ny0xLjc5MTA3LS45MzA0Ni0yLjc5MTA5LTEuNDM3NGE1LjgwMzkgNS44MDM5IDAgMCAxIDIuOTk4MjYtLjkyNzUgMTEuMTk2MSAxMS4xOTYxIDAgMCAxIDMuMDAyNDkuMjkyNTJjMS43ODM4OC40MDc1OSAzLjIwNzgxLjE0MTUzIDQuNjI3MDQtMS4wNzEwMy0xLjExNzA3LS40NDk4NS0yLjIzNDAxLS44NjA4Mi0zLjMxNzM1LTEuMzQ2OTJhMzIuNTU0MyAzMi41NTQzIDAgMCAxIC0zLjExNjUzLTEuNjI5MzhjMi44MTA0MS4zOTAzOSA1LjUyODc0IDEuNDQ0MjMgOC40MDIzOCAxLjA1OTIzcS4wMzY3LS4xOTU5Mi4wNzM0LS4zOTE4MmMtMi4xNDgyNi0uNTAwMDQtNC4yOTY1Ny0xLjAwMDA3LTYuNjc1MTctMS41NTM3NCAzLjk3OTMzLS4zNjQzMSA3LjY4NDAzLS40MjQzOSAxMS4xOTIxIDEuMjg0MzEuOTg3MTYuNDgwODMgMi4wMjAwNC44Nzg4MSAyLjk2NjI0IDEuNDI4MDEuNDYxNTEuMjY3ODYuNzcyMjEuNzk1ODEgMS4xNTA4MyAxLjIwNjM0LjMwMDczLjMyNjEuNTQyMjcuNzYyOTguOTExNzYuOTU5NDkgMS40MDIyOS43NDU3IDIuOTQ1ODcuNzc0OTkgNC41MTg1NS43Mzc2My4wMTE3LS4xNzkxMS4wMjI4LS4zNDY5Ny4wMzQ2LS41MjczOSAxLjU4Mjc2LjQ5NDU5IDMuMzY0MTggMi4zMTk4NCAzLjM2MTI3IDMuNjUyODQtMi41NjQxMSAwLTUuMTI2MDQtLjAwOTgtNy42ODc3NC4wMTQyNi0uMjczNzkuMDAyNi0uNTQ1NzMuMjAyNTctLjgxODUxLjMxMDk5LjI1OTI1LjE1MDk5LjUxNDAzLjQyMzE3Ljc3ODQ4LjQzMjkxeiIvPiYjeGE7ICA8cGF0aCBkPSJtLTExMC4xNTIgODUuNDIyNWEuMzkxNzQuMzkxNzQgMCAwIDAgLS4wNTAxLjYyNjY5LjU5MDcxLjU5MDcxIDAgMCAwIC44MTI5LjIxNzQ2Yy4yNDY4MS0uMTI0NDkuNDg4OS0uMjU3MDEuNzg3MTQtLjQxNDQ3LS4yNDAyMS0uMjA1MDUtLjQzMjkxLS4zNzQzMy0uNjMxMjItLjUzNzc0LS4zNDg3Mi0uMjg3MzQtLjYzNzkxLS4xMDY4Ni0uOTE4NzMuMTA4MDR6Ii8+JiN4YTsgPC9nPiYjeGE7PC9zdmc+"
			preserveAspectRatio="none" />
	</g>
</svg>' > ~/wggl/icon.svg
	sleep 1s

	# Create Wireguard.desktop file on desktop
	echo "[Desktop Entry]
Name=Wireguard
Comment=Disable Wireguard VPN
Exec=bash -c '~/wggl/wggl.sh'
Icon=${HOME}/wggl/icon.svg
Terminal=false
Type=Application" > ~/${DESKTOP_FOLER_NAME}/Wireguard.desktop
	gio set ~/${DESKTOP_FOLER_NAME}/Wireguard.desktop metadata::trusted true
	chmod a+x ~/${DESKTOP_FOLER_NAME}/Wireguard.desktop
fi

while [[ true ]]
do
	# Show main panel
	WG_CONFIG_FILES=$(find ~/wggl/ -name "*.conf" -printf "%f\n")
	WG_INTERFACE_NAME=$(wg show interfaces)
	if [[ -z $WG_INTERFACE_NAME ]]
	then
		DECISSION_MAIN=$(zenity --list --title="WGGL" --extra-button="Add tunnle" --ok-label="Connect" --cancel-label="Close" --column="Name" $WG_CONFIG_FILES)
		EXIT_CODE=$?
	else
		DECISSION_MAIN=$(zenity --list --title="WGGL" --extra-button="Disconnect" --extra-button="Add tunnle" --cancel-label="Close" --column="Name" $WG_CONFIG_FILES)
		EXIT_CODE=$?
	fi

	if [[ -z $DECISSION_MAIN ]]
	then
		if [[ "$EXIT_CODE" == "1" ]]
		then
			break
		fi
	else
		if [[ "$DECISSION_MAIN" == "Add tunnle" ]]
		then
			# Open file selector to select a wireguard config file
			FILE=$(zenity --file-selection --title="Select a Wireguard Config File (*.conf)" --file-filter="*.conf")
			if [[ -z  "$FILE" ]]
			then
				sleep 0s
			else
				FILENAME=$(echo $FILE | sed 's:.*/::')
				cat $FILE > ~/wggl/${FILENAME}
			fi
		fi

		if [[ "$DECISSION_MAIN" == "Disconnect" ]]
		then
			# Check if a wireguard interface is on
			WG_INTERFACE_NAME=$(wg show interfaces)
			if [[ -z $WG_INTERFACE_NAME ]]
			then
				sleep 0s
			else
				USER_PASSWORD=$(zenity --title="WGGL" --password)
				echo "$USER_PASSWORD" | sudo -S wg-quick down ~/wggl/${WG_INTERFACE_NAME}.conf
				sleep 2s
				WG_INTERFACE_NAME=$(wg show interfaces)
				if [[ -z $WG_INTERFACE_NAME ]]
				then
					zenity --notification --window-icon="info" --text="VPN connection disconnected"
				else
					zenity --notification --window-icon="warning" --text="Wrong password or internal error"
				fi
			fi
		fi

		# Connect
		if [[ "$DECISSION_MAIN" != "Disconnect" ]] && [[ "$DECISSION_MAIN" != "Add tunnle" ]]
		then
			DECISSION_QUESTION_CONNECT=$(zenity --question --title="WGGL" --text="Connect or Remove Tunnel?" --ok-label="Connect" --cancel-label="Close" --extra-button="Remove tunnle")
			EXIT_CODE=$?
			if [[ -z $DECISSION_QUESTION_CONNECT ]]
			then
				# Confimed connect
				if [[ "$EXIT_CODE" == "0" ]]
				then
					# Check if a wireguard interface is on
					WG_INTERFACE_NAME=$(wg show interfaces)
					if [[ -z $WG_INTERFACE_NAME ]]
					then
						USER_PASSWORD=$(zenity --title="WGGL" --password)
						echo "$USER_PASSWORD" | sudo -S wg-quick up ~/wggl/${DECISSION_MAIN}
						sleep 2s
						WG_INTERFACE_NAME=$(wg show interfaces)
						if [[ -z $WG_INTERFACE_NAME ]]
						then
							zenity --notification --window-icon="warning" --text="Wrong password or internal error"
						else
							zenity --notification --window-icon="info" --text="VPN connection established"
						fi
					fi
				fi
			else
				# Remove tunnle
				DECISSION_WARNING_REMOVE_TUNNLE=$(zenity --warning --title="WGGL" --text="Remove Tunnel?" --ok-label="Yes" --extra-button="No")
				EXIT_CODE=$?
				# Confimed
				if [[ "$EXIT_CODE" == "0" ]]
				then
					# Remove selected tunnle
					rm ~/wggl/${DECISSION_MAIN}
				fi
			fi			
		fi
	fi
done