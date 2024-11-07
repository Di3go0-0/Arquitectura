int sumatoria(int n) {
    int suma = 0;
    for (int i = 0; i < n; i++) {
        suma += i;
    }
    return suma;
}

int main() {
    int n = 10;
    int resultado = sumatoria(n);
    return 0;
}
