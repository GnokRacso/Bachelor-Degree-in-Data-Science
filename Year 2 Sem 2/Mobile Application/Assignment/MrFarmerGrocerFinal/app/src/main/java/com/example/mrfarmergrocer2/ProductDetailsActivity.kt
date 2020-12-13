package com.example.mrfarmergrocer2

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.renderscript.Sampler
import android.util.Log
import android.view.View
import android.widget.*
import androidx.databinding.DataBindingUtil
import com.cepheuen.elegantnumberbutton.view.ElegantNumberButton
import com.example.mrfarmergrocer2.databinding.ActivityProductDetailsBinding
import com.google.firebase.database.*
import com.squareup.picasso.Picasso

class ProductDetailsActivity : AppCompatActivity() {

    private lateinit var prodDatabaseRef: DatabaseReference
    private lateinit var wishListProdDatabaseRef: DatabaseReference
    private lateinit var shoppingCartDatabaseRef: DatabaseReference
    private lateinit var productImage: ImageView
    private lateinit var productName: TextView
    private lateinit var productPrice: TextView
    private lateinit var productCategory: TextView
    private lateinit var productDescription: TextView
    private lateinit var numOfProdAdded: ElegantNumberButton
    private lateinit var addToCartButton: Button
    private lateinit var productID: String
    private lateinit var wishListButton: ImageButton
    private lateinit var removeFromWishListButton: ImageButton
    private var userName: String? = ""
    private var categoryType: String? = ""
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = DataBindingUtil.setContentView<ActivityProductDetailsBinding>(this, R.layout.activity_product_details)

        productImage = binding.productPicture
        productName = binding.productName
        productPrice = binding.productPrice
        productCategory = binding.productCategory
        productDescription = binding.productDescription
        addToCartButton = binding.addToCart
        wishListButton = binding.wishListButton
        numOfProdAdded = binding.numberOfProductAdded
        removeFromWishListButton = binding.removeFromWishListButton

        wishListButton.setOnClickListener(View.OnClickListener { addToWishList() })
        removeFromWishListButton.setOnClickListener(View.OnClickListener { removeFromWishList() })
        addToCartButton.setOnClickListener(View.OnClickListener { addToShoppingCart() })
        getCurrentUserName()
        getDisplayCategoryType()
        getCurrentProductID()
        getAllProductDetails()

    }

    private fun getCurrentProductID(){
        val intent = intent
        productID = intent.getStringExtra("pid").toString()
    }

    private fun getCurrentUserName(){
        val intent = intent
        userName = intent.getStringExtra("userName")
    }

    private fun getDisplayCategoryType(){
        val intent = intent
        categoryType = intent.getStringExtra("category")
    }

    private fun getAllProductDetails(){
        prodDatabaseRef = FirebaseDatabase.getInstance().reference.child("products").child(categoryType.toString())
        wishListProdDatabaseRef = FirebaseDatabase.getInstance().reference.child("wishlist").child(userName.toString())
        wishListProdDatabaseRef.addListenerForSingleValueEvent(object: ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                if(snapshot.child(productID).exists()){
                    val image = snapshot.child(productID).child("image").value.toString()
                    val name = snapshot.child(productID).child("name").value.toString()
                    val description = snapshot.child(productID).child("desc").value.toString()
                    val price = "RM" + snapshot.child(productID).child("price").value.toString()
                    val category = "Category: " + snapshot.child(productID).child("category").value.toString()
                    productName.text = name
                    productPrice.text = price
                    productCategory.text = category
                    productDescription.text = description
                    wishListButton.visibility = View.INVISIBLE
                    removeFromWishListButton.visibility = View.VISIBLE
                    Picasso.get().load(image).into(productImage)
                }
                else{
                    prodDatabaseRef.addListenerForSingleValueEvent(object: ValueEventListener{
                        override fun onDataChange(snapshot: DataSnapshot) {
                            if(snapshot.child(productID).exists()){
                                val image = snapshot.child(productID).child("image").value.toString()
                                val name = snapshot.child(productID).child("name").value.toString()
                                val description = snapshot.child(productID).child("desc").value.toString()
                                val price = "RM" + snapshot.child(productID).child("price").value.toString()
                                val category = "Category: " + snapshot.child(productID).child("category").value.toString()
                                productName.text = name
                                productPrice.text = price
                                productCategory.text = category
                                productDescription.text = description
                                wishListButton.visibility = View.VISIBLE
                                removeFromWishListButton.visibility = View.INVISIBLE
                                Picasso.get().load(image).into(productImage)
                            }
                        }
                        override fun onCancelled(error: DatabaseError) {
                            TODO("Not yet implemented")
                        }
                    })
                }
            }
            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }
        })
    }

    private fun addToWishList(){
        prodDatabaseRef = FirebaseDatabase.getInstance().reference.child("products").child(categoryType.toString()).child(productID)
        wishListProdDatabaseRef = FirebaseDatabase.getInstance().reference.child("wishlist")
        prodDatabaseRef.addListenerForSingleValueEvent(object: ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                val productMap: HashMap<String, String> = HashMap<String, String>()
                productMap["category"] = snapshot.child("category").value.toString()
                productMap["desc"] = snapshot.child("desc").value.toString()
                productMap["image"] = snapshot.child("image").value.toString()
                productMap["pid"] = snapshot.child("pid").value.toString()
                productMap["name"] = snapshot.child("name").value.toString()
                productMap["price"] = snapshot.child("price").value.toString()
                wishListProdDatabaseRef.child(userName.toString()).child(productID).setValue(productMap).addOnCompleteListener(){ task ->
                    if(task.isSuccessful){
                        Toast.makeText(applicationContext, "Add item to wishlist Successfully!", Toast.LENGTH_SHORT).show()
                        wishListButton.visibility = View.INVISIBLE
                        removeFromWishListButton.visibility = View.VISIBLE
                    }

                    else{
                        Toast.makeText(applicationContext, " Error. Please try again some time.", Toast.LENGTH_SHORT).show()
                    }
                }
            }

            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }

        })
    }

    private fun removeFromWishList(){
        wishListProdDatabaseRef = FirebaseDatabase.getInstance().reference.child("wishlist")
        wishListProdDatabaseRef.addListenerForSingleValueEvent(object: ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                wishListProdDatabaseRef.child(userName.toString()).child(productID).removeValue().addOnCompleteListener(){ task ->
                    if(task.isSuccessful){
                        Toast.makeText(applicationContext, "Remove item from wishlist Successfully!", Toast.LENGTH_SHORT).show()
                        wishListButton.visibility = View.VISIBLE
                        removeFromWishListButton.visibility = View.INVISIBLE
                    }

                    else{
                        Toast.makeText(applicationContext, " Error. Please try again some time.", Toast.LENGTH_SHORT).show()
                    }
                }
            }
            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }

        })
    }

    private fun addToShoppingCart(){
        prodDatabaseRef = FirebaseDatabase.getInstance().reference.child("products").child(categoryType.toString()).child(productID)
        shoppingCartDatabaseRef = FirebaseDatabase.getInstance().reference.child("cart")
        shoppingCartDatabaseRef.addListenerForSingleValueEvent(object:ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                if(snapshot.child(userName.toString()).child(productID).exists()){
                    val currentNum = snapshot.child(userName.toString()).child(productID).child("tolOfProd").value.toString()
                    Log.i("hi", currentNum)
                    var currentNum1 = currentNum.toInt()
                    currentNum1 += numOfProdAdded.number.toInt()
                    shoppingCartDatabaseRef.child(userName.toString()).child(productID).child("tolOfProd").setValue(currentNum1.toString()).addOnCompleteListener(){ task ->
                        if(task.isSuccessful){
                            Toast.makeText(applicationContext, "Add item to cart Successfully!", Toast.LENGTH_SHORT).show()
                        }
                        else{
                            Toast.makeText(applicationContext, " Error. Please try again some time.", Toast.LENGTH_SHORT).show()
                        }
                    }

                }
                else{
                    prodDatabaseRef.addListenerForSingleValueEvent(object: ValueEventListener{
                        override fun onDataChange(snapshot: DataSnapshot) {
                            val productMap: HashMap<String, String> = HashMap<String, String>()
                            productMap["category"] = snapshot.child("category").value.toString()
                            productMap["image"] = snapshot.child("image").value.toString()
                            productMap["pid"] = snapshot.child("pid").value.toString()
                            productMap["name"] = snapshot.child("name").value.toString()
                            productMap["price"] = snapshot.child("price").value.toString()
                            productMap["tolOfProd"] = numOfProdAdded.number.toString()
                            shoppingCartDatabaseRef.child(userName.toString()).child(productID).setValue(productMap).addOnCompleteListener(){ task ->
                                if(task.isSuccessful){
                                    Toast.makeText(applicationContext, "Add item to cart Successfully!", Toast.LENGTH_SHORT).show()
                                }

                                else{
                                    Toast.makeText(applicationContext, " Error. Please try again some time.", Toast.LENGTH_SHORT).show()
                                }
                            }
                        }

                        override fun onCancelled(error: DatabaseError) {
                            TODO("Not yet implemented")
                        }

                    })
                }
            }
            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }

        })

    }
}