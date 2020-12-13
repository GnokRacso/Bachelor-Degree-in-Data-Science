package com.example.mrfarmergrocer2

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.TextView
import androidx.databinding.DataBindingUtil
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.mrfarmergrocer2.databinding.ActivityOrderDetailsBinding
import com.example.mrfarmergrocer2.databinding.ActivityProductDetailsBinding
import com.firebase.ui.database.FirebaseRecyclerOptions
import com.google.firebase.database.*
import com.google.firebase.ktx.Firebase
import java.text.DecimalFormat

class OrderDetailsActivity : AppCompatActivity() {
    private lateinit var orderID: TextView
    private lateinit var recipientName: TextView
    private lateinit var recipientPhone: TextView
    private lateinit var recipientAddressDetails: TextView
    private lateinit var subTotalPrice: TextView
    private lateinit var totalPrice: TextView
    private lateinit var recyclerView: RecyclerView
    private lateinit var layoutManager: RecyclerView.LayoutManager
    private lateinit var addressDatabaseRef: DatabaseReference
    private lateinit var productDatabaseRef: DatabaseReference
    private lateinit var orderDatabaseReference: DatabaseReference
    private lateinit var orderProductsAdapter: OrderProdsAdapter

    private var userName: String? = ""
    private var orderIDIntent: String? = ""
    private var orderAddressPosition: String? = ""

    private val df: DecimalFormat = DecimalFormat("0.00")

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = DataBindingUtil.setContentView<ActivityOrderDetailsBinding>(this, R.layout.activity_order_details)

        getCurrentUserName()
        getCurrentOrderID()
        orderID = binding.orderProdOrderID
        recipientName = binding.orderProdReciName
        recipientPhone = binding.orderProdPhoneNum
        recipientAddressDetails = binding.orderProdAddressDetails
        subTotalPrice = binding.orderProdSubtotalPrice
        totalPrice = binding.orderProdTotalPrice

        addressDatabaseRef = FirebaseDatabase.getInstance().reference.child("addresses").child(userName.toString())
        productDatabaseRef = FirebaseDatabase.getInstance().reference.child("orderProds").child(userName.toString()).child(orderIDIntent.toString())
        orderDatabaseReference = FirebaseDatabase.getInstance().reference.child("orders").child(userName.toString()).child(orderIDIntent.toString())
        recyclerView = findViewById(R.id.orderProdsRecycleView)
        recyclerView.setHasFixedSize(true)
        recyclerView.isNestedScrollingEnabled = false
        layoutManager = LinearLayoutManager(this)
        recyclerView.layoutManager = layoutManager



        getAllOrdersDetails()
        getAllAddressDetails()

    }

    override fun onStart() {
        super.onStart()
        productDatabaseRef = FirebaseDatabase.getInstance().reference.child("orderProds").child(userName.toString()).child(orderIDIntent.toString())

        val options: FirebaseRecyclerOptions<OrderProds> = FirebaseRecyclerOptions.Builder<OrderProds>().setQuery(productDatabaseRef, OrderProds::class.java).build()

        orderProductsAdapter = OrderProdsAdapter(options, applicationContext, userName.toString())
        recyclerView.adapter = orderProductsAdapter
        orderProductsAdapter.startListening()
    }


    private fun getCurrentUserName() {
        val intent = intent
        userName = intent.getStringExtra("userName")
        Log.i("hi", userName.toString())
    }

    private fun getCurrentOrderID() {
        val intent = intent
        orderIDIntent = intent.getStringExtra("orderID")

    }

    //Get all the details of the order summary
    private fun getAllOrdersDetails(){
        orderDatabaseReference.addListenerForSingleValueEvent(object: ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                if(snapshot.exists()){
                    val totalPriceString = "RM" + snapshot.child("totalPrice").value.toString()
                    var totalPriceNum = snapshot.child("totalPrice").value.toString().toDouble()
                    var orderIDString = "Order #$orderIDIntent"
                    totalPriceNum += 10.00
                    val subTotalPriceString = "RM${df.format(totalPriceNum)}"
                    orderAddressPosition = snapshot.child("orderAddress").value.toString()
                    orderID.text = orderIDString
                    totalPrice.text = subTotalPriceString
                    subTotalPrice.text = totalPriceString
                }
            }

            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }

        })
    }

    private fun getAllAddressDetails(){
        addressDatabaseRef.addListenerForSingleValueEvent(object: ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                if(snapshot.child(orderAddressPosition.toString()).exists()){
                    val city = snapshot.child(orderAddressPosition.toString()).child("city").value.toString()
                    val postalCode = snapshot.child(orderAddressPosition.toString()).child("postalCode").value.toString()
                    val state = snapshot.child(orderAddressPosition.toString()).child("state").value.toString()
                    val addressDetails = snapshot.child(orderAddressPosition.toString()).child("addressDetails").value.toString()
                    val allAddressDetails = "$addressDetails,\n$postalCode,\n$city,\n$state"
                     recipientName.text = snapshot.child(orderAddressPosition.toString()).child("name").value.toString()
                    recipientPhone.text = snapshot.child(orderAddressPosition.toString()).child("phoneNum").value.toString()
                    recipientAddressDetails.text = allAddressDetails
                }
            }

            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }

        })
    }




}