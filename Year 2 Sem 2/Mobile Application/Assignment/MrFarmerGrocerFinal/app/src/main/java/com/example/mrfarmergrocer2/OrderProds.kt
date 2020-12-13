package com.example.mrfarmergrocer2

data class OrderProds(private var pid: String,
                      private var category: String,
                      private var image: String,
                      private var price: String,
                      private var name: String,
                      private var tolOfProd: String) {
    constructor(): this("", "", "", "","", "")
    fun getPid(): String{
        return pid
    }

    fun getCategory(): String{
        return category
    }

    fun getImage(): String{
        return image
    }

    fun getPrice(): String{
        return price
    }

    fun getName(): String{
        return name
    }

    fun getTolOfProd(): String{
        return tolOfProd
    }
}