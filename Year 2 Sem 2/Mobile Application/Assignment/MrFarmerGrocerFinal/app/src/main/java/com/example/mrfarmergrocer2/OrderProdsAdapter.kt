package com.example.mrfarmergrocer2

import android.content.Context
import android.content.Intent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.CheckBox
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.cepheuen.elegantnumberbutton.view.ElegantNumberButton
import com.firebase.ui.database.FirebaseRecyclerAdapter
import com.firebase.ui.database.FirebaseRecyclerOptions
import com.squareup.picasso.Picasso
import java.text.DecimalFormat

class OrderProdsAdapter(options: FirebaseRecyclerOptions<OrderProds>, context: Context, userName: String) : FirebaseRecyclerAdapter<OrderProds, OrderProdsAdapter.OrderProdsViewHolder>(options) {
    val context: Context = context
    val userName: String = userName
    private val df: DecimalFormat = DecimalFormat("0.00")


    //View holder to hold the data of the products of that particular order
    class OrderProdsViewHolder(itemView: View): RecyclerView.ViewHolder(itemView)  {
        val orderProdName: TextView = itemView.findViewById(R.id.orderProdAdapterProdName)
        val orderProdImage: ImageView = itemView.findViewById(R.id.orderProdAdapterImage)
        val orderProdPrice: TextView = itemView.findViewById(R.id.orderProdAdapterProdPrice)
        val orderProdTolNum: TextView = itemView.findViewById(R.id.orderProdAdapterProdNum)
        val orderProdTolSinglePrice: TextView = itemView.findViewById(R.id.orderProdAdapterProdTolPrice)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): OrderProdsViewHolder {
        val orderProdView: View = LayoutInflater.from(parent.context).inflate(R.layout.order_products_layout, parent, false)
        return OrderProdsViewHolder(orderProdView)
    }

    override fun onBindViewHolder(holder: OrderProdsViewHolder, position: Int, model: OrderProds) {
        val price = "RM" + model.getPrice()
        val singleProdNum = "X" + model.getTolOfProd()
        val oneTypeTolPriceNum = model.getPrice().toDouble() * model.getTolOfProd().toInt()
        val oneTypeTolPriceString = "RM" + df.format(oneTypeTolPriceNum)
        holder.orderProdName.text = model.getName()
        holder.orderProdPrice.text = price
        holder.orderProdTolNum.text = singleProdNum
        Picasso.get().load(model.getImage()).into(holder.orderProdImage)
        holder.orderProdTolSinglePrice.text = oneTypeTolPriceString

    }

    override fun getItemCount(): Int {
        return super.getItemCount()
    }
}