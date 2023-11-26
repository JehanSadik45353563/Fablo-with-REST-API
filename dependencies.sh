#!/bin/bash

# Function to display separators
display_separator() {
    echo -e "\n${YELLOW}--------------------------------------------------${NORMAL}\n"
}

# Function to display italic text
italic_text() {
    echo -e "${CYAN}\033[3m$1\033[0m${NORMAL}"
}

# Function to display italic and green text between emojis
display_italic_green() {
    echo -e "${GREEN}\033[3m$1${NORMAL}"
}

# Color codes
NORMAL=$(tput sgr0)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 6)
GREEN=$(tput setaf 2)

while true; do
echo -e "${GREEN}🖥️  🌐 🛠️  What operation do you want to perform? 🛠️ 🌐 🖥️${NORMAL}"
echo -e "${CYAN}1. ${YELLOW}🔧 Install Dependencies.${NORMAL}"
echo -e "${CYAN}2. ${YELLOW}🔍 Check Dependencies Version.${NORMAL}"
echo -e "${CYAN}3. ${YELLOW}🚪 Exit.${NORMAL}"

read -p "$(echo -e ${CYAN}'Enter your choice: '${NORMAL})" choice


if [ "$choice" == "1" ]; then
    # Operation 1: Install Dependencies

    echo -e "\n${YELLOW}🔍🖥️🔄 Updating system packages... 🔄🖥️🔍${NORMAL}\n"
    sudo apt-get update
    display_separator

    echo -e "\n${YELLOW}🔧🛠️🐙 Installing Git... 🐙🛠️🔧${NORMAL}\n"
    sudo apt-get install -y git
    display_separator

    echo -e "\n${YELLOW}🔧🛠️🌀 Installing Curl... 🌀🛠️🔧${NORMAL}\n"
    sudo apt-get install -y curl
    display_separator

    echo -e "\n${YELLOW}🔧🛠️🐳 Installing Docker... 🐳🛠️🔧${NORMAL}\n"
    sudo apt-get install -y docker.io

    echo -e "\n${YELLOW}🔧🛠️🐳 Starting Docker... 🐳🛠️🔧${NORMAL}\n"
    sudo systemctl start docker

    echo -e "\n${YELLOW}🔧🛠️🐳 Setting up Docker for Startup... 🐳🛠️🔧${NORMAL}\n"
    sudo systemctl enable docker
    display_separator

    echo -e "\n${YELLOW}🚀📦  Installing NVM...  📦🚀${NORMAL}\n"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

    echo -e "\n${YELLOW}🔧🛠️  Setting up NVM environment...  🔧🛠️${NORMAL}\n"
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    display_separator

    echo -e "\n${YELLOW}⬇️🛠️  Installing Node.js LTS version...  🛠️⬇️${NORMAL}\n"
    nvm install --lts
    display_separator

    echo -e "\n${YELLOW}🔧🛠️🐹 Installing Go... 🐹🛠️🔧${NORMAL}\n"
    sudo apt-get install -y golang-go
    display_separator
    
    echo -e "\n${YELLOW}🔧🛠️🔍 Installing JQ... 🔍🛠️🔧${NORMAL}\n"
    sudo apt-get install -y jq
    display_separator
    
    echo -e "\n${YELLOW}📝🔧 Installing Visual Studio Code... 🔧📝${NORMAL}\n"
    sudo snap install code --classic

    echo -e "\n${GREEN}✅ All tools installed successfully! ✅${NORMAL}\n"
    echo -e "\nCredit: $(italic_text "Jehan Sadik")\n"

elif [ "$choice" == "2" ]; then
    # Operation 2: Check Dependencies Version

    echo -e "${GREEN}🖥️  🌐 🛠️  Checking System Information 🛠️ 🌐 🖥️${NORMAL}"

    display_italic_green "ℹ️  ℹ️ ℹ️  Ubuntu Version ℹ️ ℹ️ ℹ️"
    lsb_release -a
    display_separator

    display_italic_green "💻  💻 💻  Checking Software Versions 💻 💻 💻"

    display_italic_green "🐙  🐙 🐙  Git Version 🐙 🐙 🐙"
    git --version
    display_separator

    display_italic_green "🌀  🌀 🌀  Curl Version 🌀 🌀 🌀"
    curl --version
    display_separator

    display_italic_green "🐳  🐳 🐳  Docker Version 🐳 🐳 🐳"
    docker --version
    display_separator

    display_italic_green "🐳  🐳 🐳  Docker Compose Version 🐳 🐳 🐳"
    docker-compose --version
    display_separator

    echo -e "\n${GREEN}⬇️🛠️  NPM Version... 🛠️⬇️${NORMAL}\n"
    npm --version
    display_separator

    echo -e "\n${GREEN}⬇️🛠️  Node.js Version... 🛠️⬇️${NORMAL}\n"
    node --version
    display_separator

    display_italic_green "🐹  🐹 🐹  Go Version 🐹 🐹 🐹"
    go version
    display_separator

    display_italic_green "🔍  🔍 🔍  JQ Version 🔍 🔍 🔍"
    jq --version
    display_separator

    display_italic_green "📝  📝 📝  VS Code Version 📝 📝 📝"
    code --version

elif [ "$choice" == "3" ]; then
        # Operation 3: Exit
        echo -e "${GREEN}🚪 Exiting the script. Goodbye! 🚪${NORMAL}"
        break

else
        echo "Invalid choice. Please select 1, 2, or 3."
    fi
done
