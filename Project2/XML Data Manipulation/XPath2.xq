
//country[
  count(tokenize(@memberships, '\s+')) > 3 
  and number(population[last()]) > 5000000
]
/concat(
  name, 
  ' (Organizata: ', 
  count(tokenize(@memberships, '\s+')), 
  ', Popullsia: ', 
  population[last()],
')'
)