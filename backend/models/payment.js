const mercadopago = require('mercadopago');

mercadopago.configurations.setAccessToken('YOUR_ACCESS_TOKEN');

const createPayment = async (amount, description) => {
  const payment = await mercadopago.payment.create({
    transaction_amount: amount,
    description,
    payment_method_id: 'pix', // Cambia según el método de pago deseado
    payer: {
      email: 'customer@example.com',
    },
  });

  return payment.body.init_point;
};
