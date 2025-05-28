let $doc := doc("C:/Users/dell/Downloads/mondial-database-main/mondial-database-main/mondial.xml")

for $sea in $doc//sea

let $has_island := $doc//island[contains(concat(' ', @sea, ' '), concat(' ', $sea/@id, ' '))]

where empty($has_island)

let $countryCodes := tokenize($sea/@country, '\s+')

let $countries := 
    for $code in $countryCodes
    let $c := $doc//country[@car_code = $code]
    return $c

let $all_in_nato_or_eu := every $c in $countries satisfies 
    (contains($c/@memberships, 'org-NATO') or contains($c/@memberships, 'org-EU'))

where $all_in_nato_or_eu

return $sea/name/text()
