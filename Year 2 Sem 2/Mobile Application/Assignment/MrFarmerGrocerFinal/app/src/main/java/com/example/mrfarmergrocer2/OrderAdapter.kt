package com.example.mrfarmergrocer2

import android.content.Context
import android.content.Intent
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.firebase.ui.database.FirebaseRecyclerAdapter
import com.firebase.ui.database.FirebaseRecyclerOptions
import com.google.firebase.database.*

class OrderAdapter(options: FirebaseRecyclerOptions<Order>, context: Context, userName: String) : FirebaseRecyclerAdapter<Order, OrderAdapter.OrderViewHolder>(options) {

    val context: Context = context
    val userName: String = userName
    var addressDatabaseRef: DatabaseReference = FirebaseDatabase.getInstance().reference.child("addresses")

    //Order View Holder to hold the details of the order summary
    class OrderViewHolder(itemView: View): RecyclerView.ViewHolder(itemView) {
        val orderID: TextView = itemView.findViewById(R.id.orderAdapterOrderID)
        val orderTolItem: TextView = itemView.findViewById(R.id.orderAdapterOrderTotalItem)
        val orderTolPrice: TextView = itemView.findViewById(R.id.orderAdapterOrderTotal)
        val orderAddressName: TextView = itemView.findViewById(R.id.orderAdapterDeliName)
        val orderAddressPhoneNum: TextView = itemView.findViewById(R.id.orderAdapterPhoneNum)
        val orderAddressDetails: TextView = itemView.findViewById(R.id.orderAdapterAddressDetails)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): OrderViewHolder {
        val orderView: View = LayoutInflater.from(parent.context).inflate(R.layout.orders_layout, parent, false)
        return OrderViewHolder(orderView)
    }

    //Fetch the data from the database and pass to the view holder
    override fun onBindViewHolder(holder: OrderViewHolder, position: Int, model: Order) {
        val orderID = "Order #" + model.getOid()
        val totalPrice = "RM" + model.getTotalPrice()
        addressDatabaseRef.addListenerForSingleValueEvent(object: ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                if(snapshot.child(userName).child(model.getOrderAddress()).exists()){
                    val addressDetails = snapshot.child(userName).child(model.getOrderAddress()).child("addressDetails").value.toString()
                    val city = snapshot.child(userName).child(model.getOrderAddress()).child("city").value.toString()
                    val state = snapshot.child(userName).child(model.getOrderAddress()).child("state").value.toString()
                    val postalCode = snapshot.child(userName).child(model.getOrderAddress()).child("postalCode").value.toString()
                    val allAddressDetails = "$addressDetails,\n$postalCode,\n$city,\n$state"
                    holder.orderAddressName.text = snapshot.child(userName).child(model.getOrderAddress()).child("name").value.toString()
                    holder.orderAddressPhoneNum.text = snapshot.child(userName).child(model.getOrderAddress()).child("phoneNum").value.toString()
                    holder.orderAddressDetails.text = allAddressDetails
                }
            }

            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }

        })
        holder.orderID.text = orderID
        holder.orderTolItem.text = model.getTotalItem()
        holder.orderTolPrice.text = totalPrice

        holder.itemView.setOnClickListener(object: View.OnClickListener{
            override fun onClick(p0: View) {
                val intent = Intent(context, OrderDetailsActivity::class.java)
                intent.putExtra("orderID", model.getOid())
                intent.putExtra("userName", userName)
                p0.context.startActivity(intent)
            }

        })
    }
}