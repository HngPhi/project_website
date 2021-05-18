@extends('layouts.user')
@section('content')
<section class="shopping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <form action="javascript:" method="POST" class="reloadCart">
                    <div class="cart-table">
                        @csrf
                        @if (Cart::count()>0)
                        <table>
                            <thead>
                                <tr>
                                    <th class="first-col">Index</th>
                                    <th>Image</th>
                                    <th>Product Name</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th class="last-col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $temp = 1;
                                @endphp
                                    @foreach (Cart::content() as $v)
                                    <tr class="border-bottom cartPage">
                                        <td>{{ $temp++ }}</td>
                                        <td class="cart-pic "><img src="{{ $v->options->img }}" alt=""></td>
                                        <td class="cart-title">
                                            <h5>{{ $v->name }}</h5>
                                        </td>
                                        <td class="">{{ $v->options->categoryclothing_title }}</td>
                                        <td class="p-price">${{ number_format($v->price, '0', '', '.') }}</td>
                                        <td class="qua-col">
                                            <div class="quantity">
                                                <div class="pro-qty">
                                                    <input type="number" min="1" id="{{ $v->id }}" name="{{ $v->rowId }}" value="{{ $v->qty }}" class="updateCart">
                                                </div>
                                            </div>
                                        </td>
                                        <td class="total-price total-price_{{ $v->id }}">${{ number_format($v->price*$v->qty, '0', '', '.') }}</td>
                                        <td class="close-td"><a href="javascript:" class="deleteCart" rowId={{ $v->rowId }}><i class="ti-close btn btn-danger"></i></a></td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="cart-buttons">
                                <a href="{{ url('user/cart/destroy') }}" onclick="return confirm('Bạn có chắc chắn muốn xóa ?')" class="btn btn-danger">Delete All</a>
                            </div>
                            <div class="discount-coupon">
                                <h6>Discount Codes</h6>
                                <div class="coupon-form">
                                    <input type="text" placeholder="Enter your codes ...">
                                    <button type="submit" class="site-btn coupon-btn">Apply</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 offset-lg-4" id="payPrice">
                            <div class="proceed-checkout">
                                <ul>
                                    <li class="cart-total">Total <span>${{ Cart::total('0', '', '.') }}</span></li>
                                    <li class="cart-tax-deductions"><span>-</span></li>
                                    <li class="cart-tax">Tax <span>${{ Cart::tax('0', '', '.') }}</span></li>
                                    <li class="subtotal">Subtotal <span>${{ Cart::subtotal('0', '', '.')  }}</span></li>
                                </ul>
                                <a href="#" class="proceed-btn">PROCEED TO CHECK OUT</a>
                            </div>
                        </div>
                    </div>
                    @else
                        <div class="empty_product">
                            <img src="{{ asset('img/sanphamtrong.png') }}" alt="" width="190px">
                            <p class="empty_note">Hiện tại không có sản phẩm nào trong giỏ hàng!!!</p>
                            <a href="{{ url('user/product/collection/men') }}" class="empty_btn">Tiếp tục mua sắm</a>
                        </div>
                    @endif
                </form>
            </div>
        </div>
    </div>
</section>
<script src="{{ asset('js/ajaxCart/deleteCart.js') }}"></script>
<script src="{{ asset('js/ajaxCart/updateCart.js') }}"></script>
@endsection