//that is a function jo product ko cart me add krega
function add_to_cart(pid,pname,price){
	
	let cart=localStorage.getItem("cart");
	
	if(cart==null){
		//no cart yet
		let products=[];// cart ka array isme dalvao value jo dikhani hai
		//and then forms a object
        let product={productId: pid,productName:pname,productQuantity:1,productPrice:price};
//ab hum is products array me product object push krege
        products.push(product);
//Now ab update the value of localStorage
//How to convert any array into String used JSON.stringify
        localStorage.setItem("cart",JSON.stringify(products)); 
console.log("Product is added for the first time");

	//ye bs 1 product k add hone tk he chlega 
	}
	//and agr ek k baad add krna hai used this else isme be 2 case hoge
	//1. Agr purana prduct agi toh usme add krke update krdo
	//2.and agr koi another he prdct add kr raha hai toh then makes array and push
	
	else{
		
		//cart is already present
		let pcart=JSON.parse(cart);//uper se string ayi means is cart me ek item hai an then save it in cart
		
		//bari bari se p.cart me items ayege then us prdct ki id match hoti jayegi uper jo pass ki hai us id se
		
	let oldProduct=	pcart.find((item) => item.productId==pid)//jesa he match hogi vo return kr dega
		 
		 if(oldProduct){//agr vhi prodct add_to_cart kr raha then
			//Than  quantity chnged increased and then update in pcart
	oldProduct.productQuantity=oldProduct.productQuantity+1;//ek add krdo bs update j lia
			
//Array me bdalna hai........Used mapFun ye ekek item deta jayega
pcart.map((item)=>{
	
	if(item.productId==oldProduct.productId){
		item.productQuantity=oldProduct.productQuantity;
		
	}
	
})			
	  localStorage.setItem("cart",JSON.stringify(pcart));
	  console.log("Product Quantity is increased") 		
			
		}else{
			//agr prdct nhi mila toh nya product bnana hai means array khali hai
			
			 let product={productId: pid,productName:pname,productQuantity:1,productPrice:price};
		     pcart.push(product);
		     
		      localStorage.setItem("cart",JSON.stringify(pcart));
		       console.log("Product  is added")
		}
		
	}
		updateCart();
}

//////////////Update-Cart with js means upper cart vale box me values/////////////////

function updateCart(){
	
	//Firstlly getItem cart se used localStorage
	 
	let cartString= localStorage.getItem("cart");//But ye string me aya hai
	
	//convert this in object
	
	let cart=JSON.parse(cartString);
	
	//Now we can easily Checked
	if(cart==null || cart.length==0){
		console.log("Cart is Empty");
		 
		 
		 ///Used Jquery 
		 $(".cart-items").html("(0)");
		 $(".cart-body").html("<h3>Cart does not have any items</h3>");
		$(".checkout-btn").attr('disabled',true);

		 
	}else{
		console.log(cart)
		 $(".cart-items").html(`(${cart.length})`);//ye sare items carts me dal dega 
		
		let table= `
		<table class='table'>
		<thead class='thead-light'>
		<tr>
		<th>Item Name</th>
		<th>Price</th>
		<th>Quantity</th>
		<th>TotalPrice</th>
		<th>Action</th>
		
		
		</tr>
		
		</thead>
	
		`;
		
		let totalPrice=0;
		//ye sara data dalvana hai traverse 
		cart.map((item) => {
			
			table += `
			<tr>
			<td>${item.productName}</td>
			<td>${item.productPrice}</td>
			<td>${item.productQuantity}</td>
			<td>${item.productQuantity*item.productPrice}</td>
			<td><button onclick='deleteItemFromCart(${item.productId})' class="btn btn-danger btn-sm" >Remove</button></td>
			</tr>		
	    `
			
	totalPrice +=item.productPrice * item.productQuantity;
			
		
		})
		table=table+ `
<tr><td class='text-right'>Total Price : ${totalPrice}</td></tr>		
		
		</table>`
		 $(".cart-body").html(table);
		 $(".checkout-btn").attr('disabled',false);
	}
} 
///Delete item from cart

function deleteItemFromCart(pid){
	//ye  parse hume string ko object me convert kr k
	//this cart basically array jo hmari item ko store kri hai
	let cart=JSON.parse(localStorage.getItem('cart'));
	
	//agr productId uper vale pid se match nhi krega tb to item deta jayega
	//agr match kr gaya vo prdct nhi milega
let newcart=cart.filter((item) =>item.productId !=pid)
	
	//newcart k array me item ht gyaa hoga
	localStorage.setItem('cart',JSON.stringify(newcart))//update in localStorage
	
	updateCart();//is se fr sara Gui badal jayega
}


$(document).ready(function(){
	
	updateCart()
})


function goToCheckout(){
	
	window.location="checkout.jsp"
}









