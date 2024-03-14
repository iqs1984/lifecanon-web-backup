<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payments', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
			$table->double('amount');
            $table->longText('transaction_id')->nullable();
            $table->integer('status')->comment('0 for failed and 1 for success')->default(0);
            $table->integer('payment_for')->comment('1 for coach plan and 2 for client add and 3 for client payment and 4 for appointment')->default(1);
            $table->dateTime('payment_date')->nullable();
            $table->integer('payee_id')->comment('recieving id of a user/coach')->nullable();
            $table->longText('subscription_id')->nullable();
            $table->integer('subscription_status')->comment('0 for disabled 1 for enabled')->nullable();
            $table->integer('added_client_id')->comment('for add or reinstate client')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('payments');
    }
}
