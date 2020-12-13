package com.example.mrfarmergrocer2

data class Addresses (  private val name: String,
                        private val phoneNum: String,
                        private val addressDetails: String,
                        private val postalCode: String,
                        private val city: String,
                        private val state: String,
                        private val userName: String){
    constructor():this("", "","","","","","")
    fun getName() : String{
        return name
    }
    fun getPhoneNum() : String{
        return phoneNum
    }
    fun getAddressDetails() : String{
        return addressDetails
    }
    fun getPostalCode() : String{
        return postalCode
    }
    fun getCity() : String{
        return city
    }
    fun getState() : String{
        return state
    }
    fun getUserName() : String{
        return userName
    }
}



