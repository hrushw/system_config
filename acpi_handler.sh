#!/bin/sh

case "$1" in
	button/power)
        case "$2" in
            PBTN|PWRF)
				logger "ACPI: PowerButton pressed: $2"
				zzz -S
				;;
			*) logger "ACPI action undefined: $2" ;;
		esac;;
    button/lid)
        case "$3" in
            close)
                logger "ACPI: LID closed"
				zzz -z
				;;
            open) logger "ACPI: LID opened";;
			*) logger "ACPI action undefined (LID): $2" ;;
		esac;;
    button/sleep)
        case "$2" in
            SBTN|SLPB)
                logger "ACPI: Sleep Button pressed: $2"
				zzz -S
				;;
            *)  logger "ACPI action undefined: $2" ;;
		esac;;
    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0)
                case "$4" in
                    00000000) cat "$minspeed" >"$setspeed";;
                    00000001) cat "$maxspeed" >"$setspeed";;
                esac;;
            *)  logger "ACPI action undefined: $2" ;;
        esac;;
    battery)
        case "$2" in
            BAT0)
                case "$4" in
                    00000000) logger "ACPI: BAT0 offline";;
                    00000001) logger "ACPI: BAT0 online";;
                esac;;
            CPU0) ;;
            *)  logger "ACPI action undefined: $2" ;;
        esac;;
	*) logger "ACPI group/action undefined: $1 / $2";;
esac
