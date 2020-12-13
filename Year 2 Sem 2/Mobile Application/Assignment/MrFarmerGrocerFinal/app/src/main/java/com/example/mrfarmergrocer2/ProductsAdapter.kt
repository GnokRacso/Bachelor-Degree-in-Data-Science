package com.example.mrfarmergrocer2

import android.content.Context
import android.content.Intent
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.firebase.ui.database.FirebaseRecyclerAdapter
import com.firebase.ui.database.FirebaseRecyclerOptions
import com.squareup.picasso.Picasso

class ProductsAdapter(options: FirebaseRecyclerOptions<Product>, context: Context, userName: String) : FirebaseRecyclerAdapter<Product, ProductsAdapter.ProductsViewHolder>(options) {

    val context: Context = context
    val userName: String = userName
    class ProductsViewHolder(itemView: View): RecyclerView.ViewHolder(itemView)  {
        val pName: TextView = itemView.findViewById(R.id.adapterProdName)
        val pImage: ImageView = itemView.findViewById(R.id.adapterProdImage)
        val pPrice: TextView = itemView.findViewById(R.id.adapterProdPrice)
        val pDesc: TextView = itemView.findViewById(R.id.adapterProdDescription)
        val pCategory: TextView = itemView.findViewById(R.id.adapterProdCategory)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ProductsViewHolder {
        val productView: View = LayoutInflater.from(parent.context).inflate(R.layout.products_layout, parent, false)
        return ProductsViewHolder(productView)
    }

    override fun onBindViewHolder(holder: ProductsViewHolder, position: Int, model: Product) {
        val price = "RM" + model.getPrice()
        holder.pName.text = model.getName()
        holder.pPrice.text = price
        holder.pDesc.text = model.getDesc()
        holder.pCategory.text = model.getCategory()
        Picasso.get().load(model.getImage()).into(holder.pImage)

        holder.itemView.setOnClickListener(object: View.OnClickListener{
            override fun onClick(p0: View) {
                val intent = Intent(context, ProductDetailsActivity::class.java)
                intent.putExtra("pid",model.getPid())
                intent.putExtra("userName",userName)
                intent.putExtra("category",model.getCategory())
                p0.context.startActivity(intent)
            }
        })
    }

    override fun getItemCount(): Int {
        return super.getItemCount()
    }
}