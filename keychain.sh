validate_inputs() {
    if [ -z "$1" ];
    then
        echo "Service is not specified"
        return -1
    fi
    if [ -z "$2" ];
    then
        echo "Account is not specified"
        return -1
    fi
}


key_save() {
    if ! validate_inputs "$@";
    then
        return -1
    fi

    security add-generic-password -s $1 -a $2 -w
}

key_delete() {
    if ! validate_inputs "$@";
    then
        return -1
    fi

    security delete-generic-password -s $1 -a $2
}

key_get() {
    if ! validate_inputs "$@";
    then
        return -1
    fi

    security find-generic-password -s $1 -a $2 -w
}