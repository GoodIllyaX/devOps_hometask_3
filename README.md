# Hometask #3 (19/09)

## Settings and start

0. run instance:
    - chmod +x create_instance.sh
    - ./create_instance.sh {KEY_NAME} {SECURITY_GROUP_ID} {SUBNET_ID} {IAM_PROFILE_NAME}

1. systemctl status cron  - перевірка чи працює крон
2. sudo cat /var/log/sysinfo  - перевірка чи sysinfo створено

3. delete instance:
    - chmod +x delete_instance.sh
    - ./delete_instance.sh {instance-id} 