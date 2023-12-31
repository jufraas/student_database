#!/bin/bash

# Database connection variables
DB_USER="postgres"
DB_PASSWORD="password"
DB_NAME="estudent_database"
SCHEMA_NAME="public"
PORT=5432
# Function to add information to the Student table
add_student() {
    echo "Enter student data:"
    read -p "Name: " name
    read -p "LastName: " last_name
    read -p "Gender: " gender
    read -p "Address: " address

    psql  -U "$DB_USER" -d "$DB_NAME" -c "  INSERT INTO $SCHEMA_NAME.student (name, last_name, gender, address) VALUES ('$name', '$lastname', '$gender', '$address');"
    echo "Student information"
}

#Function to add information to the Course table
add_course() { 
    echo "Enter course data"
    read -p "NameCourse: " name_course
    read -p "LastName: " last_name
    read -p "StartDate: " start_date
    read -p "CompleteDate: " complete_date
    
    psql -U "$DB_USER" -d "$DB_NAME" -c "INSERT INTO $SCHEMA_NAME.course (name_course, last_name, start_date, complete_date) VALUES ('$name_course', '$last_name', '$start_date', '$complete_date')"
    echo "Course information"
}

#Function to add information to the professor table
add_professor() {
    echo "Enter professor data"
    read -p "Name: " name
    read -p "LastName: " last_name
    read -p "Specialization" specialization 
    read -p "Email" email

    psql -U "$DB_USER" -d "$DB_NAME" -c "INSERT INTO $SCHEMA_NAME.professor (name, last_name, specialization, email) VALUES ('$name', '$last_name', '$specialization', '$email');"
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


