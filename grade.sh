CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if[[-f ListExamples.java]]
then echo 'File Found'
else
echo 'File not found! Try to make sure your file is named correctly and in the
 right folder'
 exit
 fi

cp ListExamples.java List-Examples-Grader
cd List-Examples-Grader

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
if[[ $? == 0]]
then echo 'compile success'
else
echo 'compile failed'
fi

java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > file.txt


if [[grep "E" file.txt -c == 0]]
then echo '100%'
else echo grep "E" file.txt -c /1 '%'
fi



