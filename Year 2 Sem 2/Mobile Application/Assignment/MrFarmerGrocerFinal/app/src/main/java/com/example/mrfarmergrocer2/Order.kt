package com.example.mrfarmergrocer2

data class Order(
private var totalItem: String,
private var totalPrice: String,
private var userName: String,
private var oid: String,
private var orderAddress: String) {
    constructor(): this("", "", "","", "")

    fun getOid(): String{
        return oid
    }

    fun getTotalItem(): String{
        return totalItem
    }

    fun getTotalPrice(): String{
        return totalPrice
    }

    fun getUserName(): String{
        return userName
    }

    fun getOrderAddress(): String{
        return orderAddress
    }

}