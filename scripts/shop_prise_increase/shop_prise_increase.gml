///@param default_gold, sales

var default_gold = argument0;
var sales = argument1;
var nesessary_gold = default_gold;

for(var i=0; i<sales; i++){
	nesessary_gold *= PRICE_INCREASE;
}
return nesessary_gold