package com.example.mrfarmergrocer2

data class Product(
    private var pid: String,
    private var pDescription: String,
    private var pImage: String,
    private var pPrice: String,
    private var pName: String,
    private var category: String) {
    constructor(): this("", "", "", "","", "")
    fun getPid(): String{
        return pid
    }

    fun getCategory(): String{
        return category
    }

    fun getDesc(): String{
        return pDescription
    }

    fun getImage(): String{
        return pImage
    }


    fun getPrice(): String{
        return pPrice
    }

    fun getName(): String{
        return pName
    }

    fun setDesc(desc: String){
        this.pDescription = desc
    }

    fun setImage(image: String){
        this.pImage = image
    }


    fun setPrice(price: String){
        this.pPrice = price
    }

    fun setName(name: String){
        this.pName = name
    }


}