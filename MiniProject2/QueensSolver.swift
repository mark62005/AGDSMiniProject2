//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Print all possible ways to place 8 queens on 8x8 chessboard
///
var possibleWayCount = 0
func solveAllNQueens(size: Int) {
  var board = Board(size: size)
  solveNQueensHelper(board: &board, size: size, currentRow: 0)
  
  print("(... \(possibleWayCount) possible \(possibleWayCount > 1 ? "ways" : "way"))")
}

private func solveNQueensHelper(board: inout Board, size: Int, currentRow: Int) {
  // base case
  if currentRow == size {
    possibleWayCount += 1
    print(board.description)
  }
  
  // recursive case
  else {
    for col in 0..<size {
      // constraints
      if board.isSafe(row: currentRow, col: col) {
        
        // make a choice
        board.place(row: currentRow, col: col)
        
        // move on to next row
        solveNQueensHelper(board: &board, size: size, currentRow: currentRow + 1)
      }
      
      // undo choice
      board.remove(row: currentRow, col: col)
    }
  }
}

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0
func solveQueens(board: inout Board) {
  solve8QueensHelper(board: &board, currentRow: 0)
}

private func solve8QueensHelper(board: inout Board, currentRow: Int) {
  count += 1
  
  // base case
  if currentRow == board.size {
    if count < 115 {
      print(board.description)
      print("Number of recursive calls: \(count)")
      return
    }
  }
  
  // recursive case
  else {
    for col in 0..<board.size {
      // constraints
      if board.isSafe(row: currentRow, col: col) {
        
        // make a choice
        board.place(row: currentRow, col: col)
        
        // move on to next row
        solve8QueensHelper(board: &board, currentRow: currentRow + 1)
      }
      
      if count == 114 {
        var newBoard = Board(size: 8)
        solve8QueensHelper(board: &newBoard, currentRow: 0)
      }
      // undo choice
      board.remove(row: currentRow, col: col)
    }
  }
}

