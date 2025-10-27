//
//  HelloCpp.hpp
//  Overview
//
//  Created by Jinping Shi on 2025/10/27.
//

#ifndef HELLOCPP_HPP
#define HELLOCPP_HPP

#include <string>
#include <iostream>

class HelloCpp {
private:
    std::string message;
    
public:
    HelloCpp();
    ~HelloCpp();
    
    std::string getHelloWorld() const;
    void printHelloWorld() const;
};

#endif /* HELLOCPP_HPP */
