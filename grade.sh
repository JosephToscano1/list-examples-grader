CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'
cp TestListExamples.java student-submission
cd sudent-submission
if [[ -f ListExample.java]]
then 
    echo 'Code Submitted'
else
    echo 'Code not found.'
    exit
fi 
javac *.java
javac -cp CPATH *.java
if [[ $? == 0]]
then
    echo "Successfully compiled"
else 
    echo "Failed to compile"
    exit
fi
java -cp CPATH org.junit.runner.JUnitCore TestListExamples > file.txt
if [[ grep -c "Error" == 0]]
then 
    echo "100%"
else 
    echo "0% Try again."

