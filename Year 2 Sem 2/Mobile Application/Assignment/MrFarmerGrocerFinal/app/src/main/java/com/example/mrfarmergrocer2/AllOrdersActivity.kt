package com.example.mrfarmergrocer2

import android.content.Intent
import android.icu.lang.UCharacter
import android.os.Bundle
import android.util.Log
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.Toolbar
import androidx.databinding.DataBindingUtil
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.mrfarmergrocer2.databinding.ActivityAllOrdersBinding
import com.example.mrfarmergrocer2.databinding.ActivityAllProductsBinding
import com.firebase.ui.database.FirebaseRecyclerOptions
import com.google.firebase.database.DatabaseReference
import com.google.firebase.database.FirebaseDatabase

class AllOrdersActivity : AppCompatActivity() {

    //Order Recycler View to show all orders related to the user
    private lateinit var orderDatabaseRef: DatabaseReference
    private lateinit var recyclerView: RecyclerView
    private lateinit var layoutManager: RecyclerView.LayoutManager
    private lateinit var orderAdapter: OrderAdapter

    private lateinit var toolbar: Toolbar

    private var userName: String? = ""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = DataBindingUtil.setContentView<ActivityAllOrdersBinding>(this, R.layout.activity_all_orders)
        getCurrentUserName()

        toolbar = binding.orderToolbar
        toolbar.navigationIcon = resources.getDrawable(R.drawable.icon_arrow)
        toolbar.setNavigationOnClickListener(View.OnClickListener {
            val intent = Intent(this, MyAccountActivity::class.java)
            intent.putExtra("userName", userName)
            startActivity(intent)
        })


        orderDatabaseRef = FirebaseDatabase.getInstance().reference.child("orders").child(userName.toString())
        recyclerView  = binding.orderRecyclerView
        recyclerView.setHasFixedSize(true)
        layoutManager = LinearLayoutManager(this)
        recyclerView.layoutManager = layoutManager



    }

    override fun onStart() {
        super.onStart()

        val options: FirebaseRecyclerOptions<Order> = FirebaseRecyclerOptions.Builder<Order>().
        setQuery(orderDatabaseRef, Order::class.java).
        build()

        orderAdapter = OrderAdapter(options, applicationContext, userName.toString())
        recyclerView.adapter = orderAdapter
        orderAdapter.startListening()
    }

    private fun getCurrentUserName() {
        val intent = intent
        userName = intent.getStringExtra("userName")
        Log.i("hi", userName.toString())
    }
}