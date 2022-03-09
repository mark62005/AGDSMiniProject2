//
//  main.swift
//  MiniProject2
//
//  Created by Mark Wong on 2022-03-08.
//

import Foundation

print("========== Question 1 ==========\n")
solveAllNQueens(size: 8)
print()
print()

print("========== Question 2 ==========\n")
var board = Board(size: 8)
solveQueens(board: &board)
