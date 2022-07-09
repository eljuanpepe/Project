#/usr/bin/bash

value=($HOME/.local/share/project/projects-locations)

help_command()
{
	echo "Usage: project [Name] [Route] [App (optional)]"
	echo "-l --list	shows list of files"		
	echo "-r --remove	removes file from the list"
	echo "-h --help	shows this message"
}

case $1 in
	-r | --remove)
		search_destroy=$(cat $value	| grep ^$2)
		if [[ $search_destroy ]]; then
			sed -i /$2/d $value
			echo $2 "Removed successfully"
		else 
			echo "Key does not exist"
		fi
		;;
	-l | --list)
		cat $value
		;;
	-h | --help)
		help_command
		;;
	"")
		help_command
		;;
	*)
		search=$(cat $value	| grep -w ^$1)
		result=$(echo $search | awk '{print $2;}')
		app=$(echo $search | awk '{$1=$2=""; print $0;}')
		if [[ $2 ]]; then
			if [[ $search ]]; then
				echo "Key already in use"
			else 
				echo $1 $2 $3 >> $value
				echo "Added successfully"
			fi
		else
			if [[ $app != " " ]]; then
				$app $result &
			else
				if [[ $result ]]; then
					#########################
					#  default text editor  #
					#########################
					nvim $result
				else 
					echo "Entry does not exist"
				fi
			fi
		fi
		;;
esac
