function species_count(target_species, whale_list) {
    var amount = 0;
  for (var i in whale_list){
      if(whale_list[i].species == target_species){
          amount += whale_list[i].how_many;
      }
  }
  return amount;
}

module.exports = species_count;
