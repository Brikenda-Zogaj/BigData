for $prov in doc("C:\Users\dell\Downloads\mondial-database-main\mondial-database-main\mondial.xml")//province[@country='CDN']
let $capitalId := $prov/@capital
let $capital := $prov/city[@id=$capitalId]
let $cityName := $capital/name
let $population := $capital/population[last()]
where $capital/located_at[@watertype='river']
return <Capital>
  <Province>{ $prov/name/text() }</Province>
  <City>{ $cityName/text() }</City>
  <Population>{ $population/text() }</Population>
</Capital>
