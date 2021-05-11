#!/bin/bash

source $HOME/.diaryNXBC/src/functions/getInitValues.sh

echo -e "-1.  Create a record"
echo -e "-2.  Open the record"
echo -e "-3.  Open the record from the ID"
echo -e "-4.  Show all records"
echo -e "-5.  Delete a record"
echo -e "-6.  Statistics"
echo -e "-7.  Restore the record"
echo -e "-8.  Show the last 5 records"
echo -e "-9.  Backup"
echo -e "-10. Settings"
echo -e "-11. Quit"

read -p "$(echo -e "->: ")"

while [ 1 ]; do
	case "${REPLY}" in
		1)
			"$HOME/.diaryNXBC/src/functions/menu/menuCreateRecord.sh"
			break;
			;;
		2)
			"$HOME/.diaryNXBC/src/functions/menu/menuOpenRecord.sh"
			break;
			;;
		3)
			"$HOME/.diaryNXBC/src/functions/menu/menuOpenRecordID.sh"
			break;
			;;
		4)
			"$HOME/.diaryNXBC/src/functions/menu/menuShowRecords.sh"
			break;
			;;
		5)
			"$HOME/.diaryNXBC/src/functions/menu/menuRemoveRecord.sh"
			break;
			;;
		6)
			echo -e "---1. Quantity of records"
			echo -e "---2. Date of the last record"
			echo -e "---3. Quantity per year and month"
			echo -e "---4. Longest record"
			echo -e "---5. Quit"
			read -p "$(echo -e "->: ")"
			while [ 1 ]; do
				case "${REPLY}" in
					1)
						"$HOME/.diaryNXBC/src/functions/menu/menuStatQuantRecords.sh"
						break;
						;;
					2)
						"$HOME/.diaryNXBC/src/functions/menu/menuStatDateLastRec.sh"
						break;
						;;
					3)
						"$HOME/.diaryNXBC/src/functions/menu/menuStatPerDates.sh"
						break;
						;;
					4)
						"$HOME/.diaryNXBC/src/functions/menu/menuStatLongestRecord.sh"
						break;
						;;
					5)
						echo "${DIARY_AUTHOR}, Good Bye..."
						break;
						;;
					*)
						read -p "$(echo -e "->: ")"
						;;
				esac
			done
			break;
			;;
		7)
			"$HOME/.diaryNXBC/src/functions/menu/menuRestore.sh"
			break;
			;;
		8)
			"$HOME/.diaryNXBC/src/functions/menu/menuLast5.sh"
			break;
			;;
		9)
			echo -e "---1. Create"
			echo -e "---2. Load"
			while [ 1 ]; do
				case "${REPLY}" in
					1)
						"$HOME/.diaryNXBC/src/functions/menu/menuBackupCreate.sh"
						break;
						;;
					2)
						"$HOME/.diaryNXBC/src/functions/menu/menuBackupLoad.sh"
						break;
						;;
					*)
						read -p "$(echo -e "->: ")"
						;;
				esac
			done
			break;
			;;
		10)
			echo -e "---1. Change directory"
			echo -e "---2. Change default editor"
			echo -e "---3. Change default template"
			echo -e "---4. Quit"
			read -p "$(echo -e "->: ")"
			while [ 1 ]; do
				case "${REPLY}" in
					1)
						"$HOME/.diaryNXBC/src/functions/menu/menuSetChangeDir.sh"
						break;
						;;
					2)
						"$HOME/.diaryNXBC/src/functions/menu/menuSetEditor.sh"
						break;
						;;
					3)
						"$HOME/.diaryNXBC/src/functions/menu/menuSetTempate.sh"
						break;
						;;
					4)
						echo "${DIARY_AUTHOR}, good Bye..."
						break;
						;;
					*)
						read -p "$(echo -e "->: ")"
						;;
				esac
			done
			break;
			;;
		11)
			echo "${DIARY_AUTHOR}, good Bye..."
			break;
			;;
		*)
			read -p "$(echo -e "->: ")"
			;;
	esac
done
