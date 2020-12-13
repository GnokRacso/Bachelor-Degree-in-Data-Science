package com.example.mrfarmergrocer2

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import androidx.databinding.DataBindingUtil
import com.example.mrfarmergrocer2.databinding.ActivityPaymentBinding
import com.google.android.material.textfield.TextInputLayout
import java.text.DecimalFormat

class PaymentActivity : AppCompatActivity() {

    private val otp: String = "345678"
    private val df: DecimalFormat = DecimalFormat("0.00")

    private lateinit var userName: String
    private lateinit var subTotalPrice: String
    private lateinit var subTotal: TextView
    private lateinit var total: TextView
    private lateinit var cardNumberInput: TextInputLayout
    private lateinit var cardExpireMonth: TextInputLayout
    private lateinit var cardExpireYear: TextInputLayout
    private lateinit var cardCVVInput: TextInputLayout
    private lateinit var cardOTP: TextInputLayout

    private lateinit var paymentBeforeOTPButton: Button
    private lateinit var paymentAfterOTPButton: Button
    private lateinit var cancelButton: Button
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = DataBindingUtil.setContentView<ActivityPaymentBinding>(this, R.layout.activity_payment)

        getCurrentUserName()
        getSubTotalPrice()
        subTotal = binding.subTotalPrice
        total = binding.totalPrice

        val subTotalRM = "RM$subTotalPrice"
        val totalInt = subTotalPrice.toDouble() + 10.00
        val totalString = "RM" + df.format(totalInt)
        subTotal.text = subTotalRM
        total.text = totalString

        cardNumberInput = binding.cardNumberInput
        cardExpireMonth = binding.cardMonthInput
        cardExpireYear = binding.cardYearInput
        cardCVVInput = binding.cardCVVInput
        cardOTP = binding.cardOTPReceive

        paymentBeforeOTPButton = binding.paymentButton
        paymentAfterOTPButton = binding.paymentAfterOTPButton
        cancelButton = binding.cancelButton

        paymentBeforeOTPButton.setOnClickListener(View.OnClickListener { paymentBeforeOTP() })
        paymentAfterOTPButton.setOnClickListener(View.OnClickListener { paymentAfterOTP() })
        cancelButton.setOnClickListener(View.OnClickListener { cancelPayment()  })

    }

    private fun getCurrentUserName(){
        val intent = intent
        userName = intent.getStringExtra("userName").toString()
    }

    private fun getSubTotalPrice(){
        val intent = intent
        subTotalPrice = intent.getStringExtra("subTotal").toString()
    }

    private fun cancelPayment(){
        val intent = Intent(this, HomeActivity::class.java)
        Toast.makeText(this, "Cancel payment! Redirecting to Homepage", Toast.LENGTH_SHORT).show()
        intent.putExtra("userName", userName)
        startActivity(intent)
    }

    private fun paymentBeforeOTP(){
        val cardNumber = cardNumberInput.editText?.text.toString().trim()
        val cardMonth = cardExpireMonth.editText?.text.toString().trim()
        val cardYear = cardExpireYear.editText?.text.toString().trim()
        val cardCVV = cardCVVInput.editText?.text.toString().trim()

        if(cardNumber.isEmpty()){
            cardNumberInput.error = "Card Number is required"
            cardNumberInput.requestFocus()
            return
        }
        else{
            cardNumberInput.error = null
        }
        if(cardMonth.isEmpty()){
            cardExpireMonth.error = "Card expire month is required"
            cardExpireMonth.requestFocus()
            return
        }
        else{
            cardExpireMonth.error = null
        }
        if(cardYear.isEmpty()){
            cardExpireYear.error = "Card expire year is required"
            cardExpireYear.requestFocus()
            return
        }
        else{
            cardExpireYear.error = null
        }
        if(cardCVV.isEmpty()){
            cardCVVInput.error = "Card cvv is required"
            cardCVVInput.requestFocus()
            return
        }
        else{
            cardCVVInput.error = null
        }
        Toast.makeText(this, "Sending OTP...", Toast.LENGTH_SHORT).show()
        paymentBeforeOTPButton.visibility = View.INVISIBLE
        paymentAfterOTPButton.visibility = View.VISIBLE
        cardOTP.visibility = View.VISIBLE
    }

    private fun paymentAfterOTP(){
        val otpReceive = cardOTP.editText?.text.toString().trim()
        if(otpReceive != otp){
            cardOTP.error = "Invalid OTP, please enter again"
            cardOTP.requestFocus()
            return
        }
        else{
            cardOTP.error = ""
        }

        val intent = Intent(this, HomeActivity::class.java)
        Toast.makeText(this, "Payment Successful! Redirecting to Homepage", Toast.LENGTH_SHORT).show()
        intent.putExtra("userName", userName)
        startActivity(intent)
    }

    override fun onBackPressed() {
        Toast.makeText(this@PaymentActivity, "Please click cancel button to direct to homepage", Toast.LENGTH_SHORT).show()
        return
    }
}