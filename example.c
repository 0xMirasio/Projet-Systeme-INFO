int main(){
    
    int a = 4;
    int res;

    if(a == 5){
        res = 5;
    }else if(a>5){
        res = a + 2;
    }else{
        res = a*3;
    }

    int i=3;
    while(i>0){
        res += 1;
        i -= 1;
    }
    
    return res;
}