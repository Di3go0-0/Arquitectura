int mayor(int a, int b){
    if(a <= b){
        return a;
    }
    return b;
}

int main(){
    int a = 5;
    int b = 10;
    int c = mayor(a, b);
    return 0; 
}