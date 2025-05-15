#!/bin/bash

FLAG_FILE="/tmp/battery_low.flag"
LOW_BATTERY_THRESHOLD=15
CHARGING_ICONS=("󰢟 " "󰢜 " "󰂆 " "󰂇 " "󰂈 " "󰢝 " "󰂉 " "󰢞 " "󰂊 " "󰂋 " "󰂅 ")
SESSION_TYPE="$XDG_SESSION_TYPE"
DISCHARGED_COLOR="#D35F5D"
CHARGED_COLOR="#A0E8A2"

has_battery() {
    local battery_path=$(upower -e | grep 'BAT')
    [ -z "$battery_path" ] && return 1 || return 0
}

get_battery_charge() {
    upower -i $(upower -e | grep 'BAT') | grep percentage | awk '{print $2}' | sed s/%//
}

is_charging() {
    upower -i $(upower -e | grep 'BAT') | grep state | awk '{print $2}'
}

notify_battery_time() {
    local remaining_time=$(upower -i $(upower -e | grep 'BAT') | grep --color=never -E "time to empty|time to full" | awk '{print $4, $5}')
    if [ -z "$remaining_time" ] || [[ "$remaining_time" == *"0"* ]]; then
        notify-send "Battery Status" "Remaining time: data is being calculated or unavailable."
    else
        notify-send "Battery Status" "Remaining time: $remaining_time"
    fi
}

print_status() {
    local charge=$(get_battery_charge)
    local charging_status=$(is_charging)
    local icon=""
    local color=""

    if [ "$charging_status" == "charging" ]; then
        icon="${CHARGING_ICONS[9]}" # Иконка для 100%
        color=$CHARGED_COLOR
    elif [ "$charging_status" == "fully-charged" ]; then
        icon="󰁹 "
        color=$CHARGED_COLOR
    else
        if [ "$charge" -le "$LOW_BATTERY_THRESHOLD" ]; then
            color=$DISCHARGED_COLOR
        else
            color=$CHARGED_COLOR
        fi
        case $charge in
        100 | 9[0-9]) icon="󰁹 " ;;
        8[0-9]) icon="󰂂 " ;;
        7[0-9]) icon="󰂁 " ;;
        6[0-9]) icon="󰂀 " ;;
        5[0-9]) icon="󰁿 " ;;
        4[0-9]) icon="󰁾 " ;;
        3[0-9]) icon="󰁽 " ;;
        2[0-9]) icon="󰁼 " ;;
        1[5-9]) icon="󰁺 " ;;
        *) icon="󰂎 " ;;
        esac
    fi

    if [[ "$SESSION_TYPE" == "wayland" ]]; then
        echo "<span color=\"$color\">$icon$charge%</span>"
    elif [[ "$SESSION_TYPE" == "x11" ]]; then
        echo "%{F$color}$icon$charge%%{F-}"
    fi
}

main() {
    local status_mode=false
    local notify_mode=false

    while [[ "$#" -gt 0 ]]; do
        case "$1" in
        --status)
            status_mode=true
            shift
            ;;
        --notify)
            notify_mode=true
            shift
            ;;
        --charged-color)
            CHARGED_COLOR="$2"
            shift 2
            ;;
        --discharged-color)
            DISCHARGED_COLOR="$2"
            shift 2
            ;;
        *)
            echo "Invalid option: $1"
            exit 1
            ;;
        esac
    done

    if [[ $status_mode == true ]]; then
        print_status
    fi

    if [[ $notify_mode == true ]]; then
        notify_battery_time
    fi

    # Получаем текущий заряд батареи и статус зарядки
    BATTERY_CHARGE=$(get_battery_charge)
    CHARGING_STATUS=$(is_charging)

    # Если началась зарядка, удаляем флаг, чтобы сбросить предупреждение
    if [ "$CHARGING_STATUS" == "charging" ] && [ -f "$FLAG_FILE" ]; then
        rm "$FLAG_FILE"
    fi

    # Отправка уведомления при низком уровне заряда
    if [ "$BATTERY_CHARGE" -le "$LOW_BATTERY_THRESHOLD" ]; then
        if [ ! -f "$FLAG_FILE" ] && [ "$CHARGING_STATUS" != "charging" ]; then
            notify-send "Low battery charge" "The battery charge level is $BATTERY_CHARGE%, connect the charger." -u critical
            touch "$FLAG_FILE"
        fi
    elif [ "$BATTERY_CHARGE" -gt "$LOW_BATTERY_THRESHOLD" ]; then
        if [ -f "$FLAG_FILE" ]; then
            rm "$FLAG_FILE"
        fi
    fi
}

if has_battery; then
    main "$@"
fi
