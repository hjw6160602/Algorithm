package main

import "strings"

func numUniqueEmails(emails []string) int {
    sum := 0
    dict := make(map[string] []string)
    for _, email := range emails {
        slice := strings.Split(email, "@")
        local := slice[0]
        domian := slice[1]

        local = strings.Split(local, "+")[0]
        local = strings.Replace(local, ".", "", -1)
        names := dict[domian]
        contains := false
        for _, name := range names {
            if strings.Compare(name,local) == 0 {
                contains = true
                break
            }
        }
        if !contains {
            names = append(names, local)
            dict[domian] = names

            sum += len(names)
        }
    }
    return sum
}
