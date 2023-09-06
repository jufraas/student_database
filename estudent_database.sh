#!/bin/bash

# Database connection variables
DB_USER="postgres"
DB_PASSWORD="meliodas1605"
DB_NAME="estudent_database"
PORT = 5000
SCHEMA_NAME = "estudentsschema"
validate_id() {
    local table_name=$1
    local column_name=$2
    local id=$3
    local query="SELECT COUNT(*) FROM $SCHEMA_NAME.$table_name WHERE $column_name = '$id';"
    local result=$(psql -U $DB_USER -d $DB_NAME -t -c "$query")
    
    if [ "$result" -gt 0 ]; then
        return 0  # El ID existe
    else
        return 1  # El ID no existe
    fi
}


# Function to add information to the Student table
add_student() {
    echo "Enter student data:"
    read -p "Name: " name
    read -p "LastName: " last_name
    read -p "Gender: " gender
    read -p "Address: " address

    psql -U $DB_USER -d $DB_NAME -c "INSERT INTO $SCHEMA_NAME (name, last_name, gender, address) VALUES ('$name', '$lastname', '$gender', '$address');"
    echo "Student information"
}

#Function to add information to the Course table
add_course() { 
    echo "Enter course data"
    read -p "NameCourse: " name_course
    read -p "LastName: " last_name
    read -p "StartDate: " start_date
    read -p "CompleteDate: " complete_date
    
    psql -U "$DB_USER" -d "$DB_NAME" -c "INSERT INTO $SCHEMA_NAME(name_course, last_name, start_date, complete_date) VALUES ('$name_course', '$last_name', '$start_date', '$complete_date')"
    echo "Course information"
}

#Function to add information to the professor table
add_professor() {
    echo "Enter professor data"
    read -p "Name: " name
    read -p "LastName: " last_name
    read -p "Specialization" specialization 
    read -p "Email" email

    psql -U "$DB_USER" -d "$DB_NAME" -c "INSERT INTO $SCHEMA_NAME (name, last_name, specialization, email) VALUES ('$name', '$last_name', '$specialization', '$email');"
    echo "Professor information"
}

# Selection menu
echo "Select a table to add information:"
echo "1. Student"
echo "2. Course"
echo "3. Professor"
echo "5. Exit"
read choice

# Option handling
case $choice in
    1)
        add_student
        ;;
    2)
        add_course
        ;;
    3)
        add_prosessor
        ;;

    4)
        echo "Coming out..."
        exit
        ;;
    *)
        echo "Invalid option."
        ;;
esac


