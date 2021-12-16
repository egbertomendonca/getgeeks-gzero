robot -l NONE -o NONE -r NONE tasks/Delorean.robot
robot -d ./logs -v BROWSER:chromium -v HEADLESS:False -e smoke tests

rm -rf ./logs/browser
mkdir ./logs/browser
mkdir ./logs/browser/screenshot

cp $(find ./logs/pabot_results -type f -name "*.png") ./logs/browser/screenshot