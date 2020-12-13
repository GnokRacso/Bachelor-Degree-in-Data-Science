package com.example.mrfarmergrocer2

import android.content.Context
import android.content.Intent
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import android.widget.Toast
import androidx.recyclerview.widget.RecyclerView
import com.firebase.ui.database.FirebaseRecyclerAdapter
import com.firebase.ui.database.FirebaseRecyclerOptions

class UserAddressesAdapter(options: FirebaseRecyclerOptions<Addresses>, context: Context, userName: String, selectAddress: Boolean) : FirebaseRecyclerAdapter<Addresses, UserAddressesAdapter.UserAddressesViewHolder>(options) {

    val context: Context = context
    val userName: String = userName
    val selectAddress: Boolean = selectAddress
    class UserAddressesViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val name: TextView = itemView.findViewById(R.id.deliveryName)
        val phoneNum: TextView = itemView.findViewById(R.id.deliveryPhoneNum)
        val addressDetails: TextView = itemView.findViewById(R.id.deliveryAddressDetails)
        val postalCode: TextView = itemView.findViewById(R.id.deliveryPostalCode)
        val city: TextView = itemView.findViewById(R.id.deliveryCity)
        val state: TextView = itemView.findViewById(R.id.deliveryState)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): UserAddressesViewHolder {
        val addressView: View = LayoutInflater.from(parent.context).inflate(R.layout.example_address, parent, false)
        return UserAddressesViewHolder(addressView)
    }

    override fun onBindViewHolder(holder: UserAddressesViewHolder, position: Int, model: Addresses) {
        holder.name.text = model.getName()
        holder.phoneNum.text = model.getPhoneNum()
        holder.addressDetails.text = model.getAddressDetails()
        holder.postalCode.text = model.getPostalCode()
        holder.city.text = model.getCity()
        holder.state.text = model.getState()


        if(selectAddress){
            holder.itemView.setOnClickListener(object: View.OnClickListener{
                override fun onClick(p0: View) {
                    val intent = Intent(context, ShoppingCartActivity::class.java)
                    val itemPosition = holder.adapterPosition
                    intent.putExtra("userName",userName)
                    intent.putExtra("position", itemPosition.toString())
                    intent.putExtra("navigateFromAddress", "true")
                    p0.context.startActivity(intent)
                } })

        }
        else{
            holder.itemView.setOnClickListener(object: View.OnClickListener{
                override fun onClick(p0: View) {
                    val intent = Intent(context, EditAddressActivity::class.java)
                    val itemPosition = holder.adapterPosition
                    intent.putExtra("userName",userName)
                    intent.putExtra("position", itemPosition.toString())
                    p0.context.startActivity(intent)
                } })
        }

    }

}