//
//  HelloCpp.cpp
//  Overview
//
//  Created by Jinping Shi on 2025/10/27.
//

#include "HelloCpp.hpp"

HelloCpp::HelloCpp() : message("Hello World from C++") {
}

HelloCpp::~HelloCpp() {
}

std::string HelloCpp::getHelloWorld() const {
    return message;
}

void HelloCpp::printHelloWorld() const {
    std::cout << message << std::endl;
}
