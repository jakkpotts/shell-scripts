# this will create 50 fake access points. the ssid is enclosed in brackets
# because they tend to get listed first in "available networks" wifi lists

# mdk3 is required:
# sudo apt install mdk3

# usage:
# ap_flood <wifi_interface> <ap_ssid>


# Check if the number of arguments is less than 2
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <wifi_interface> <ap_ssid>"
    exit 1
fi

wifi_interface=$1
ap_ssid=$2

# Function to create a fake access point
create_fake_ap() {
    sudo mdk3 "$wifi_interface" b -f beacons.txt -w -m -s 1100
}

echo "Writing beacons.txt file with ssid's"

# iterate 50 ssid's to beacons.txt file
for i in $(seq 1 50); do
        echo "[$ap_ssid-$i]" >> beacons.txt
done

create_fake_ap

echo -e "\nRemoving beacons.txt file..."
rm -f beacons.txt
echo Complete.