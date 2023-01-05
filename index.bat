set /p YEAR="YEAR: "
set /p USERNAME="Github Username: "
set /p REPO="Github Repository: "
set /p ACCESS_TOKEN="Github Access Token: "

"%USERNAME%" == "" && EXIT /B 0
"%REPO%" == "" && EXIT /B 0
"%ACCESS_TOKEN%" == "" && EXIT /B 0
"%YEAR%" == "" && EXIT /B 0

mkdir "%YEAR%" >nul 2>&1
cd "%YEAR%"
git init
echo "**%YEAR%** - Generated by https://github.com/mugishap/commit-time-travel-machine" \
    >README.md
git add .
GIT_AUTHOR_DATE="%YEAR%-01-01T18:00:00" \
GIT_COMMITTER_DATE="%YEAR%-01-01T18:00:00" \
git commit -m "%YEAR%"
git remote add origin "https://%ACCESS_TOKEN%@github.com/%USERNAME%/%REPO%.git"
git branch -M main
git push -u origin main -f
cd ..
rm -rf "%YEAR%"

echo.
echo "Cool, check your profile now: https://github.com/%USERNAME%"