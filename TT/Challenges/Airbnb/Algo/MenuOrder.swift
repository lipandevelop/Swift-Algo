//
//  MenuOrder.swift
//  TT
//
//  Created by Li Pan on 2019-03-25.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

//func getCombo(menu: [String : Double], target: Double) -> [String] {
//
//
//}
//
//public List<List<String>> getCombo(Map<String, Double> menu, double target) {
//    List<List<String>> res = new ArrayList<>();
//    dishes = menu.keySet().toArray(String[]::new);
//    prices = new double[dishes.length];
//
//    for (int i = 0; i < dishes.length; i++) {
//        prices[i] = menu.get(dishes[i]);
//    }
//
//    dfs(0, new ArrayList<>(), 0.0, target, res);
//
//    return res;
//}
//
//public void dfs(int idx, List<String> curr, double curSum,
//double target, List<List<String>> res) {
//
//    if (Math.abs(curSum - target) < precision) {
//        res.add(new ArrayList<>(curr));
//        return;
//    }
//
//    if (curSum - target > precision) {
//        return;
//    }
//
//    for (int i = idx; i < dishes.length; i++) {
//        curr.add(dishes[i]);//这个不能写到外面
//        dfs(i, curr, curSum + prices[i], target, res);
//        curr.remove(curr.size() - 1);
//    }
//}
