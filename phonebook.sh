#! bin/bash

printf "\n\n----------**Welcome to Phone Book Utility**-------------\n"
stop=0
while test $stop -eq 0
do 
cat << ENDOFMENU

------------Operations Available------------

1 : Print the Phone Book
2 : Delete a contact 
3 : Edit contact's information
4.  Add a contact
5 : Exit
ENDOFMENU
printf "\nSelect any one option from menu: "
read response
echo
case $response in
     "1")
        printf "\nReading file......\n\n"
        printf "\tFirst_name  Last_name   Address\t\t   Phone\n\n"
        sort -k1 -o db.xlsx db.xlsx
        find ./ -name 'db.xlsx' -exec cat -n  {} \;
        printf "\nEnd of file\n\n"
       ;;
     "2")
        printf "Please enter line number on which contact needs to be deleted: "
        read num
        printf "\nDeleting......\n\n"
        sed -i "$num d" db.xlsx 
        sort -k1 -o db.xlsx db.xlsx
        printf "\nDeleted!!!\n\n" 
       ;;
     "3")
        printf "\nEditing.......\n\n"
        printf "Enter a line num: "
        read line
        printf "Enter a field num: "
        read field
        printf "Enter the value(from database) that needs to be replaced: "
        read name
        printf "Enter the new value: "
        read newvalue
        sed -ie ""$line"s/$name/$newvalue/"$field"" db.xlsx
        sort -k1 -o db.xlsx db.xlsx
        printf "\nEdit Successful!!!\n\n" 
       ;;
     "4")
        printf "\n----Contact Details----\n\n"
        printf "\nEnter First Name: "
        read fname
        printf "\nEnter Last Name: "
        read lname
        printf "\nEnter address: "
	read address
 	printf "\nEnter contact number: "
        read cnum
	sed -i '$a'"$fname    $lname    $address     $cnum" db.xlsx
 	sort -k1 -o db.xlsx db.xlsx
	printf "\nContact Added!"
        ;;
     "5")
        stop=1
       ;;
     *)
        printf "\nSorry, I can't help you\n"
      ;;
 esac
done

