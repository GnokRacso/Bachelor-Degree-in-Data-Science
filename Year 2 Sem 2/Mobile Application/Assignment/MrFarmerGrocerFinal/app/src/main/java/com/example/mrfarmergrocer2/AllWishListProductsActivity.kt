package com.example.mrfarmergrocer2

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.MenuItem
import android.view.View
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.widget.Toolbar
import androidx.databinding.DataBindingUtil
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.mrfarmergrocer2.databinding.ActivityAllWishListProductsBinding
import com.firebase.ui.database.FirebaseRecyclerOptions
import com.google.firebase.database.*

class AllWishListProductsActivity : AppCompatActivity() {
    private lateinit var productDatabaseRef: DatabaseReference
    private lateinit var recyclerView: RecyclerView
    private lateinit var layoutManager: RecyclerView.LayoutManager
    private lateinit var productsAdapter: ProductsAdapter
    private lateinit var toolbar: Toolbar

    private lateinit var noItemInWishListText: TextView
    private lateinit var goToShopButton: Button

    private var userName: String? = ""
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = DataBindingUtil.setContentView<ActivityAllWishListProductsBinding>(this, R.layout.activity_all_wish_list_products)
        getCurrentUserName()

        noItemInWishListText = binding.noItemInWishListText
        goToShopButton = binding.goToShoppingButton

        toolbar = binding.productsToolBar
        toolbar.navigationIcon = resources.getDrawable(R.drawable.icon_arrow)
        toolbar.setNavigationOnClickListener(View.OnClickListener {
            val intent = Intent(this, MyAccountActivity::class.java)
            intent.putExtra("userName", userName)
            startActivity(intent)
        })

        productDatabaseRef = FirebaseDatabase.getInstance().reference.child("wishlist").child(userName.toString())
        recyclerView = findViewById(R.id.wishListProdRecyclerView)
        recyclerView.setHasFixedSize(true)
        layoutManager = GridLayoutManager(this, 2)
        recyclerView.layoutManager = layoutManager

        goToShopButton.setOnClickListener(View.OnClickListener { goToProductPage() })
    }

    override fun onStart() {
        super.onStart()

        //If nothing in wish list at the moment, show the goToshop button to the user instead of products layout
        productDatabaseRef = FirebaseDatabase.getInstance().reference.child("wishlist").child(userName.toString())
        productDatabaseRef.addListenerForSingleValueEvent(object: ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                if(!snapshot.exists()){
                    goToShopButton.visibility = View.VISIBLE
                    noItemInWishListText.visibility = View.VISIBLE
                }
                else{
                    goToShopButton.visibility = View.INVISIBLE
                    noItemInWishListText.visibility = View.INVISIBLE
                }
            }

            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }

        })

        //Wish list Adapter to show the wish list products
        val options: FirebaseRecyclerOptions<Product> = FirebaseRecyclerOptions.Builder<Product>().setQuery(productDatabaseRef, Product::class.java).build()
        productsAdapter = ProductsAdapter(options, applicationContext, userName.toString())
        recyclerView.adapter = productsAdapter
        productsAdapter.startListening()
    }

    private fun getCurrentUserName() {
        val intent = intent
        userName = intent.getStringExtra("userName")
        Log.i("hi", userName.toString())
    }

    private fun goToProductPage(){
        val intent = Intent(this, AllProductsActivity::class.java)
        intent.putExtra("userName", userName)
        startActivity(intent)
    }


    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        val id: Int = item.itemId

        if(id == android.R.id.home){
            this.finish()
        }
        return super.onOptionsItemSelected(item)
    }
}