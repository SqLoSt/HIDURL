# Bash Script for Hide Phishing URL Created by KP

url_checker() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            echo -e "\e[31m EROR 404 : Invalid Link , use https/http please ps.\e[0m"
            exit 1
        fi
    fi
}
echo -e "\n\e[1;91;40m
_   _ ___________   _   _______ _
| | | |_   _|  _  \ | | | | ___ \ |
| |_| | | | | | | | | | | | |_/ / |
|  _  | | | | | | | | | | |    /| |
| | | |_| |_| |/ /  | |_| | |\ \| |____
\_| |_/\___/|___/    \___/\_| \_\_____/

 \e[0m"
echo -e "\e[40;38;5;82m SQLOST - HID URL \e[30;49;5;82m V0.5 \e[0m"
echo -e "\e[1;31;40m github.com/SqLoSt [ily my kitti]\e[0m \n"
echo -n "Paste link here (http or https): "
read phish
url_checker $phish
sleep 1
echo "Hiding the url..."
echo ""
short=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${phish})
shorter=${short#https://}
echo -e "\n\e[1;31;40m Domain setup... \e[0m"
echo 'New link (with http or https)::'
echo -en "\e[32mLink ==>\e[0m "
read mask
url_checker $mask
echo -e '\n Type extra words e.p(user , userid-283728)(dont use slash.)'
echo -e "\e[31mDon't use space use '-' instead \e[0m"
echo -en "\e[32mWords ==>\e[0m "
read words
if [[ -z "$words" ]]; then
echo -e "\e[31m No words given. \e[0m"
echo -e "\nLink generating..\n"
final=$mask@$shorter
echo -e "Hidden url :\e[32m ${final} \e[0m\n"
exit
fi
if [[ "$words" =~ " " ]]; then
echo -e "\e[31m Eror : Don't use spaces , invalid words. \e[0m"
echo -e "\nGenerating Fake Link...\n"
final=$mask@$shorter
echo -e "Here is the Fake URL:\e[32m ${final} \e[0m\n"
exit
fi
echo -e "\nGenerating Fake Link...\n"
final=$mask-$words@$shorter
echo -e "The Fake URL:\e[31m ${final} \e[0m\n"
