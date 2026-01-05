#!/bin/sh
while true; do
  read -p "Enter Oracle username: " USERNAME
  if [[ -n "${USERNAME//[[:space:]]/}" ]]; then
    break
  fi
  echo "Username cannot be empty. Please try again."
done

while true; do
  read -s -p "Enter Oracle password: " PASSWORD
  echo
  if [[ -n "${PASSWORD//[[:space:]]/}" ]]; then
    break
  fi
  echo "Password cannot be empty. Please try again."
done

while true; do
  read -p "Enter Oracle SID (e.g., orcl): " SID
  if [[ -n "${SID//[[:space:]]/}" ]]; then
    break
  fi
  echo "SID cannot be empty. Please try again."
done

# Build and export connection string
STR="${USERNAME}/${PASSWORD}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.cs.torontomu.ca)(Port=1521))(CONNECT_DATA=(SID=${SID})))"
export STR
MainMenu()
{
	while [ "$CHOICE" != "START" ]
	do
		clear
		echo "================================================================="
		echo "| 		Online Job Bank System	               |"
		echo "| 	Main Menu - Select Desired Operation(s):       |"
		echo "|    <CTRL-Z Anytime to Enter Interactive CMD Prompt>    |"
		echo "-----------------------------------------------------------------"
	echo " $IS_SELECTEDM M) View Manual"
	echo " "
	echo " $IS_SELECTED1 1) Drop Tables"
	echo " $IS_SELECTED2 2) Create Tables"
	echo " $IS_SELECTED3 3) Populate Tables"
	echo " $IS_SELECTED4 4) Query Tables"
        echo " $IS_SELECTED5 5) View Tables"
	echo " $IS_SELECTED6 6) Drop View Tables"
	echo " $IS_SELECTED7 7) Custom SQL"
	echo " "
	echo " $IS_SELECTEDX X) Force/Stop/Kill Oracle DB"
	echo " "
	echo " $IS_SELECTEDE E) End/Exit"
	echo "Choose: "

	read CHOICE

	if [ "$CHOICE" == "0" ]
	then
		echo "Nothing Here"

	elif [ "$CHOICE" == "1" ]
	then
		bash drop_tables.sh
		echo "Press any key to continue"
                while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done

	elif [ "$CHOICE" == "2" ]
	then
		bash create_tables.sh
		echo "Press any key to continue"
                while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done

	elif [ "$CHOICE" == "3" ]
	then
		bash populate_tables.sh
		echo "Press any key to continue"
                while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done

	elif [ "$CHOICE" == "4" ]
	then
		bash queries.sh
		echo "Press any key to continue"
            	while true; do
                	read -rsn1 key  # Read a single character silently
                	if [[ -n "$key" ]]; then
                        	echo "Key pressed. Continuing..."
                        	break  # Exit the loop if a key is pressed
                	fi
            	done

	elif [ "$CHOICE" == "5" ]
	then
		bash views.sh
		echo "Press any key to continue"
                while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done

	elif [ "$CHOICE" == "6" ]
	then
		bash drop_views.sh
		echo "Press any key to continue"
                while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done

	elif [ "$CHOICE" == "7" ]
	then
		echo "Enter SQL statement. Press ENTER to run it."
		echo "To exit, enter M, then press ENTER."
		while true; do
			# Prompting user for SQL statement
			read -p "SQL> " sql_query

			# Check if user entered M to exit
			if [ "$sql_query" == "M" ]; then
				echo "Returning to main menu..."
				break
			fi
			#Execute SQL query
sqlplus64 -s "$STR"<<EOF
SET LINESIZE 200;
SET PAGESIZE 50;
SET FEEDBACK ON;
SET TRIMSPOOL ON;
SET WRAP OFF;
SET TAB OFF;
SET COLSEP ' | ';
$sql_query;
EXIT;
EOF

    		done

	elif [ "$CHOICE" == "E" ]
	then
		exit
	fi
	done
}

#--COMMENTS BLOCK--
# Main Program
#--COMMENTS BLOCK--
ProgramStart()
{
	StartMessage
	while [ 1 ]
	do
		MainMenu
	done
}

ProgramStart