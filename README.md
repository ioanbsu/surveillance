# surveillance
This script configures ubuntu box(apt) to read and store video traffic from sources that broadcast it in __rstp__ format.
By default configured 2 cameras but more cameras can be added as needed. See `record.sh` file for more details.
Steps to get started
1. Install ansible: `sudo apt-get install ansible`
2. Run ansible playbook `ansible-playbook --ask-become-pass ./surveillance.yaml`