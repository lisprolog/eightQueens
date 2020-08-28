NQUEENS = 8
def attack((row1, col1), (row2, col2)):
    return (row1 == row2) or (col1 == col2) or abs(row1 - row2) == abs(col1 - col2)
def safe(square, queens):
    for queen in queens:
        if attack(square, queen): return 0
    return 1
def solve(n):
    if n == 0: return [[]]
    smaller_solutions = solve(n-1)
    return [solution+[(n,i+1)]
        for i in range(NQUEENS)
            for solution in smaller_solutions
                if safe((n,i+1), solution)]
for answer in solve(NQUEENS): print answer
