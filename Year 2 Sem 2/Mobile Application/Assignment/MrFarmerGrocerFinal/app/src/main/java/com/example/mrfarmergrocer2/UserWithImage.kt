package com.example.mrfarmergrocer2

data class UserWithImage (private var userName: String = "",
                     private var fullName: String = "",
                     private var email: String = "",
                     private var password: String = "",
                    private var image: String = ""){

    fun getUserName(): String{
        return userName
    }

    fun getFullName(): String{
        return fullName
    }

    fun getEmail(): String{
        return email
    }

    fun getPassword(): String{
        return password
    }

    fun getImage(): String{
        return image
    }
}