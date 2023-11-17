#!/bin/bash



ESMI_TOOL=/opt/e-sms/e_smi/bin/e_smi_tool
SYSINFO_FILE=sysinfo.txt

if test -f "$SYSINFO_FILE"; then
    rm $SYSINFO_FILE
    echo "$SYSINFO_FILE removed."
else
    echo "$SYSINFO_FILE does not exist."
fi

echo -e "This is a script to capture the basic info of a system\n" >> sysinfo.txt
echo -e "Below will be the info that is captured\n" >> sysinfo.txt
echo -e "\t 1. CPU info from lscpu " >> sysinfo.txt
echo -e "\t 2. BIOS info from dmidecode " >> sysinfo.txt
echo -e "\t 3. Memory Channel Population " >> sysinfo.txt
echo -e "\t 4. Memory DIMMs detail " >> sysinfo.txt
echo -e "\t Optional tool for more details " >> sysinfo.txt
echo -e "\t 5. Power and Energy info - need ESMI installed" >> sysinfo.txt
echo -e "\n\n" >> sysinfo.txt

echo -e "============================ \t\t CPU info \t\t ==========================\n\n" >> sysinfo.txt
lscpu >> sysinfo.txt
echo -e "\n\n" >> sysinfo.txt

echo -e "============================= \t\t BIOS info from DMIDECODE \t\t ========================\n\n" >> sysinfo.txt
dmidecode -t BIOS >> sysinfo.txt
echo -e "\n\n" >> sysinfo.txt

echo -e "============================= \t\t Memory Channel population \t\t =======================\n\n" >> sysinfo.txt
lshw -c memory -short >> sysinfo.txt
echo -e "\n\n" >> sysinfo.txt

echo -e "============================= \t\t Memory DIMMs detail \t\t =======================\n\n" >> sysinfo.txt
dmidecode -t memory >> sysinfo.txt
echo -e "\n\n" >> sysinfo.txt

if which $ESMI_TOOL >/dev/null 2>&1; then
    echo "$ESMI_TOOL is installed, running the tool now..."
echo -e "============================= \t\t Power and Energy info \t\t =======================\n\n" >> sysinfo.txt
    $ESMI_TOOL	>> sysinfo.txt
else
    echo "$ESMI_TOOL is not installed."
fi
