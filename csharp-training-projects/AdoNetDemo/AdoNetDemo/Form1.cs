﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ADO.NETDeneme
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        ProductDal _productDal = new ProductDal();

        private void Form1_Load(object sender, EventArgs e)
        {
            dgwProducts.DataSource = _productDal.GetAll();
        }

        private void gbxAdd_Enter(object sender, EventArgs e)
        {

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            _productDal.Add(new Product
            {
                // Id auto
                Name = tbxName.Text,
                UnitPrice = Convert.ToDecimal(tbxUnitPrice.Text),
                StockAmount = Convert.ToInt32(tbxStockAmount.Text)
            });
            dgwProducts.DataSource = _productDal.GetAll();
            MessageBox.Show(@"Product added.");
        }

        private void dgwProducts_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            tbxNameUpdate.Text = dgwProducts.CurrentRow.Cells[1].Value.ToString();
            tbxUnitPriceUpdate.Text = dgwProducts.CurrentRow.Cells[2].Value.ToString();
            tbxStockAmountUpdate.Text = dgwProducts.CurrentRow.Cells[3].Value.ToString();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            Product product = new Product
            {
                Id = Convert.ToInt32(dgwProducts.CurrentRow.Cells[0].Value),
                Name = tbxNameUpdate.Text,
                UnitPrice = Convert.ToDecimal(tbxUnitPriceUpdate.Text),
                StockAmount = Convert.ToInt32(tbxStockAmountUpdate.Text)
            };
            _productDal.Update(product);
            dgwProducts.DataSource = _productDal.GetAll();
            MessageBox.Show("Product updated.");
        }

        private void btnRemove_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(dgwProducts.CurrentRow.Cells[0].Value);
            _productDal.Delete(id);
            dgwProducts.DataSource = _productDal.GetAll();
            MessageBox.Show("Product removed.");
        }

        private void dgwProducts_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void gbxUpdate_Enter(object sender, EventArgs e)
        {

        }

        private void lblNameUpdate_Click(object sender, EventArgs e)
        {

        }

        private void tbxNameUpdate_TextChanged(object sender, EventArgs e)
        {

        }

        private void lblUnitPriceUpdate_Click(object sender, EventArgs e)
        {

        }

        private void tbxUnitPriceUpdate_TextChanged(object sender, EventArgs e)
        {

        }

        private void tbxStockAmountUpdate_TextChanged(object sender, EventArgs e)
        {

        }

        private void lblStockAmountUpdate_Click(object sender, EventArgs e)
        {

        }

        private void lblStockAmount_Click(object sender, EventArgs e)
        {

        }

        private void tbxStockAmount_TextChanged(object sender, EventArgs e)
        {

        }

        private void tbxUnitPrice_TextChanged(object sender, EventArgs e)
        {

        }

        private void lblUnitPrice_Click(object sender, EventArgs e)
        {

        }

        private void lblName_Click(object sender, EventArgs e)
        {

        }

        private void tbxName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
