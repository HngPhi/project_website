<?php

namespace App\Http\Controllers;

use App\Categoryclothing;
use App\Product;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{
    //
    function show(){
        return view('user/cart');
    }

    function add($id){
        $product = Product::find($id);
        $prodCateAll = Categoryclothing::all();
        $cart = Cart::content();
        $qtyTotal = $product->qty;
        $qtyUser = $_GET['qty'];
        $prodCate = "";
        $showQtyErr = "";
        foreach($prodCateAll as $item){
            if($item->id == $product->categoryclothing_id){
                $prodCate = $item->title_category_clothing;
            }
        }
        if($qtyUser < $qtyTotal || $qtyUser == $qtyTotal){
            if(empty($cart)){
                Cart::add([
                    'id' => $product->id, 
                    'name' => $product->name,
                    'price' => $product->price,
                    'qty' => $qtyUser,
                    'options' => [
                        'categoryclothing_id' => $prodCate,
                        'discount' => $product->discount, 
                        'img' => $product->img,
                    ],
                ]);
            }
            else{
                foreach($cart as $item) {
                    if($product->id == $item->id){
                        if($qtyUser + $item->qty > $qtyTotal){
                            $showQtyErr = "Remaining quantity to be purchased: ".abs($qtyTotal-$item->qty);
                        }
                        else{
                            Cart::add([
                                'id' => $product->id, 
                                'name' => $product->name,
                                'price' => $product->price,
                                'qty' => $qtyUser,
                                'options' => [
                                    'categoryclothing_id' => $prodCate,
                                    'discount' => $product->discount, 
                                    'img' => $product->img,
                                ],
                            ]);
                            $showQtyErr = "";
                        }
                    }
                    else{
                        Cart::add([
                            'id' => $product->id, 
                            'name' => $product->name,
                            'price' => $product->price,
                            'qty' => $qtyUser,
                            'options' => [
                                'categoryclothing_id' => $prodCate,
                                'discount' => $product->discount, 
                                'img' => $product->img,
                            ],
                        ]);
                        $showQtyErr = "";
                    }
                }
            }
            $countCart = Cart::count();
        }
        else{
            $showQtyErr = "The maximum allowed quantity is: ".$qtyTotal;
            $countCart = Cart::count();
        }
        $data = array([
            'addCart' => $qtyUser,
            'countCart' => $countCart,
            'prodCate' => $prodCate,
            'showQtyErr' => $showQtyErr,
        ]);
        echo json_encode($data);
    }

    function remove($rowId){
        Cart::remove($rowId);
        $countCart = Cart::count();
        echo json_encode($countCart);
    }

    function destroy(){
        Cart::destroy();
        return back();
    }

    function update(){
        $id = $_POST['id'];
        $rowId = $_POST['rowId'];
        $qty = $_POST['qty'];
        Cart::update($rowId, $qty);
        $product = Product::find($id);
        $price_total = $product->price*$qty;
        $total = Cart::total('0', '', '.');
        $tax = Cart::tax('0', '', '.');
        $subTotal = Cart::subTotal('0', '', '.');
        $countCart = Cart::count();
        $data = array([
            'countCart' => $countCart,
            'price_total' => number_format($price_total, '0', '', '.'),
            'total' => $total,
            'tax' => $tax,
            'subTotal' => $subTotal,
            'total' => $total,
        ]);
        echo json_encode($data);
    }
}
