package com.example.mrfarmergrocer2

data class User(private var userName: String = "",
                private var fullName: String = "",
                private var email: String = "",
                private var password: String = ""){

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
}