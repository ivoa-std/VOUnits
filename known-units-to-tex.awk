{
    # split($2, c, ":")
    # printf "%s&%s", $1, c[2]
    printf "%s", $1
    for (i=3; i<=NF; i++) {
        if ($i == "1")
            printf "&$\\cdot$"
        else
            printf "&%s", substr($i, 2, length($i)-1)
    }
    printf "\\\\\n"
}

    
