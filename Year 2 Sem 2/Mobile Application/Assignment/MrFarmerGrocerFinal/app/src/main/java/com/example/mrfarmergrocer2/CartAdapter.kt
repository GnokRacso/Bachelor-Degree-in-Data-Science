package com.example.mrfarmergrocer2

import android.content.Context
import android.content.Intent
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.*
import androidx.recyclerview.widget.RecyclerView
import com.cepheuen.elegantnumberbutton.view.ElegantNumberButton
import com.firebase.ui.database.FirebaseRecyclerAdapter
import com.firebase.ui.database.FirebaseRecyclerOptions
import com.google.firebase.database.DataSnapshot
import com.google.firebase.database.DatabaseError
import com.google.firebase.database.FirebaseDatabase
import com.google.firebase.database.ValueEventListener
import com.squareup.picasso.Picasso
import java.text.DecimalFormat

class CartAdapter(options: FirebaseRecyclerOptions<Cart>, context: Context, userName: String, tolPrice: TextView, pIdArrayList: MutableMap<String, String>, nameArrayList: MutableMap<String, String>, checkOutButton: Button) : FirebaseRecyclerAdapter<Cart, CartAdapter.CartViewHolder>(options) {
    val context: Context = context
    val userName: String = userName
    val options = options

    val checkOutButton: Button = checkOutButton
    private var overAllTotal = 0.00F
    private var oneTypeTolPrice = 0.00F
    private val tolPrice: TextView = tolPrice
    private val pIdArrayList: MutableMap<String, String> = pIdArrayList
    private val nameArrayList: MutableMap<String, String> = nameArrayList
    private val df: DecimalFormat = DecimalFormat("0.00")

    //View holder hold the input for the data set inside recycler view
    class CartViewHolder(itemView: View): RecyclerView.ViewHolder(itemView)  {
        val cartProdName: TextView = itemView.findViewById(R.id.cartAdapterProdName)
        val cartProdImage: ImageView = itemView.findViewById(R.id.cartAdapterProdImage)
        val cartProdPrice: TextView = itemView.findViewById(R.id.cartAdapterProdPrice)
        val cartProdCategory: TextView = itemView.findViewById(R.id.cartAdapterProdCategory)
        val cartProdTol: ElegantNumberButton = itemView.findViewById(R.id.cartAdapterTolNumProd)
        val cartProdCheckBox: CheckBox = itemView.findViewById(R.id.cartAdapterCheckBox)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CartViewHolder {
        val cartView: View = LayoutInflater.from(parent.context).inflate(R.layout.cart_product_layout, parent, false)
        return CartViewHolder(cartView)
    }

    //Input the data into the holder items
    override fun onBindViewHolder(holder: CartViewHolder, position: Int, model: Cart) {
        val price = "RM" + model.getPrice()
        holder.cartProdName.text = model.getName()
        holder.cartProdPrice.text = price
        holder.cartProdCategory.text = model.getCategory()
        holder.cartProdTol.number = model.getTolOfProd()
//        holder.cartProdCheckBox.isChecked = true
        tolPrice.text = overAllTotal.toString()
        if(model.getImage().isEmpty()){
            holder.cartProdImage.setImageResource(R.drawable.mr_farmer_small_logo)
        }
        else{
            Picasso.get().load(model.getImage()).into(holder.cartProdImage)
        }

//        oneTypeTolPrice = model.getPrice().toDouble() * model.getTolOfProd().toInt()
//        Log.i("hi", model.getPrice().toDouble().toString())
//        overAllTotal += oneTypeTolPrice
//        Log.i("hi", overAllTotal.toString())
//        tolPrice.text = overAllTotal.toString()


        //Allow user to update the number of product he/she want at the shopping cart
        holder.cartProdTol.setOnValueChangeListener(object: ElegantNumberButton.OnValueChangeListener{
            val shoppingCartDatabaseRef = FirebaseDatabase.getInstance().reference.child("cart")
            override fun onValueChange(view: ElegantNumberButton?, oldValue: Int, newValue: Int) {
                holder.cartProdCheckBox.isChecked = false
                shoppingCartDatabaseRef.addListenerForSingleValueEvent(object:ValueEventListener{
                    override fun onDataChange(snapshot: DataSnapshot) {
                        shoppingCartDatabaseRef.child(userName).child(model.getPid()).child("tolOfProd").setValue(newValue.toString()).addOnCompleteListener(){ task ->
                            if(task.isSuccessful){
                                Toast.makeText(context, "Update cart Successfully!", Toast.LENGTH_SHORT).show()
                            }
                            else{
                                Toast.makeText(context, " Error. Please try again some time.", Toast.LENGTH_SHORT).show()
                            }
                        }
                    }
                    override fun onCancelled(error: DatabaseError) {
                        TODO("Not yet implemented")
                    }

                })
            }
        })

        //Check if the checkbox is checked or not
        holder.cartProdCheckBox.setOnCheckedChangeListener { buttonView, isChecked ->
            if (isChecked) {
                pIdArrayList[model.getPid()] = model.getCategory()
                nameArrayList[model.getName()] = model.getTolOfProd()
                checkOutButton.isEnabled = true
                oneTypeTolPrice = model.getPrice().toFloat() * model.getTolOfProd().toInt()
                overAllTotal += oneTypeTolPrice
                tolPrice.text = df.format(overAllTotal)
            } else if (!isChecked) {
                pIdArrayList.remove(model.getPid())
                nameArrayList.remove(model.getCategory())
                checkOutButton.isEnabled = pIdArrayList.count() != 0
                oneTypeTolPrice = model.getPrice().toFloat() * model.getTolOfProd().toInt()
                overAllTotal -= oneTypeTolPrice
                tolPrice.text = df.format(overAllTotal)
            }
            else{

            }

        }

        //Item click will lead to this product details activity
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
}