
$b = 10;
module te(){
    $b = 11;
    square([1,1]);
    
echo($b);
}

te($b);
echo($b);