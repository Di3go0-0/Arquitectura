int suma(int a, int b) {
    return a + b;
}

int main() {
    int x = 10;
    int y = 20;
    int z = suma(x, y);

    if (z > 25) {
        z = 0;
    }

    return z;
}
