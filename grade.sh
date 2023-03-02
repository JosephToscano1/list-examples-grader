CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf file.txt
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission
if [[ -f ListExamples.java ]]
then 
    echo 'Code Submitted'
else
    echo 'Code not found.'
    exit
fi 
javac *.java
cd ..
cp TestListExamples.java student-submission/
javac -cp $CPATH student-submission/*.java
cd student-submission
if [[ $? == 0 ]]
then
    echo "Successfully compiled"
else 
    echo "Failed to compile"
    exit
fi
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > file.txt
fail=`grep -c "E" file.txt`
if [[ $fail -eq 0 ]]
then 
    echo "100%"
else 
    echo "0% Try again."
fi


