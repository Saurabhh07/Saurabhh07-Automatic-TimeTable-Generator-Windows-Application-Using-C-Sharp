using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TimeTableGenerator.Forms.ConfigurationForms
{
    public partial class frmDays : Form
    {
        public frmDays()
        {
            InitializeComponent();
        }

        public void FillGrid(string searchvalue)
        {

            try
            {
                string query = string.Empty;
                if (string.IsNullOrEmpty(searchvalue.Trim()))
                {
                    query = "select DayID [ID], Name [Day], IsActive [Status] from DayTable";
                }
                else
                {
                    query = "select DayID [ID], Name [Day], IsActive [Status] from DayTable where Name like '%" + searchvalue.Trim() + "%'";
                }

                DataTable daylist = DatabaseLayer.Retrive(query);
                dgvDays.DataSource = daylist;
                if (dgvDays.Rows.Count > 0)
                {
                    dgvDays.Columns[0].Width = 80;
                    dgvDays.Columns[1].Width = 150;
                    dgvDays.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
                }
            }
            catch
            {
                MessageBox.Show("Some unexpected issue occure plz try again!");
            }
        }

        private void frmDays_Load(object sender, EventArgs e)
        {
            FillGrid(string.Empty);
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            FillGrid(txtSearch.Text.ToUpper());
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            ep.Clear();
            if (txtDayName.Text.Length == 0)
            {
                ep.SetError(txtDayName, "Please Enter Day Name!");
                txtDayName.Focus();
                txtDayName.SelectAll();
                return;
            }

            DataTable checktitle = DatabaseLayer.Retrive("select * from DayTable where Name = '" + txtDayName.Text.ToUpper().Trim() + "'");
            if (checktitle != null)
            {
                if (checktitle.Rows.Count > 0)
                {
                    ep.SetError(txtDayName, "Already Exist!");
                    txtDayName.Focus();
                    txtDayName.SelectAll();
                    return;
                }
            }

            string insertquery = string.Format("insert into DayTable(Name,IsActive) values('{0}','{1}')",
                                txtDayName.Text.ToUpper().Trim(), chkStatus.Checked);
            bool result = DatabaseLayer.Insert(insertquery);
            if (result == true)
            {
                MessageBox.Show("Save Successfully!");
                DisableComponents();
            }
            else
            {
                MessageBox.Show("Please Provide Correct Semester Details. Then Try Again!");
            }
        }


        public void ClearForm()
        {
            txtDayName.Clear();
            chkStatus.Checked = false;

        }

        public void EnableComponents()
        {
            dgvDays.Enabled = false;
            btnClear.Visible = false;
            btnSave.Visible = false;
            btnCancel.Visible = true;
            btnUpdate.Visible = true;
            txtSearch.Enabled = false;
        }

        public void DisableComponents()
        {
            dgvDays.Enabled = true;
            btnClear.Visible = true;
            btnSave.Visible = true;
            btnCancel.Visible = false;
            btnUpdate.Visible = false;
            txtSearch.Enabled = true;
            ClearForm();
            FillGrid(string.Empty);
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            DisableComponents();
        }

        private void cmsedit_Click(object sender, EventArgs e)
        {
            if (dgvDays != null)
            {
                if (dgvDays.Rows.Count > 0)
                {
                    if (dgvDays.SelectedRows.Count == 1)
                    {
                        txtDayName.Text = Convert.ToString(dgvDays.CurrentRow.Cells[1].Value);
                        chkStatus.Checked = Convert.ToBoolean(dgvDays.CurrentRow.Cells[2].Value);
                        EnableComponents();
                    }
                    else
                    {
                        MessageBox.Show("Please Select One Record!");
                    }
                }
                else
                {
                    MessageBox.Show("List is Empty!");
                }
            }
            else
            {
                MessageBox.Show("List is Empty!");
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            ep.Clear();
            if (txtDayName.Text.Length == 0)
            {
                ep.SetError(txtDayName, "Please Enter Day Name!");
                txtDayName.Focus();
                txtDayName.SelectAll();
                return;
            }

            DataTable checktitle = DatabaseLayer.Retrive("select * from DayTable where Name = '" + txtDayName.Text.ToUpper().Trim() + "' and DayID != '" + Convert.ToString(dgvDays.CurrentRow.Cells[0].Value) + "'");
            if (checktitle != null)
            {
                if (checktitle.Rows.Count > 0)
                {
                    ep.SetError(txtDayName, "Already Exist!");
                    txtDayName.Focus();
                    txtDayName.SelectAll();
                    return;
                }
            }

            string updatequery = string.Format("update DayTable set Name = '{0}',IsActive = '{1}' where DayID = '{2}'",
                                txtDayName.Text.ToUpper().Trim(), chkStatus.Checked, Convert.ToString(dgvDays.CurrentRow.Cells[0].Value));
            bool result = DatabaseLayer.Update(updatequery);
            if (result == true)
            {
                MessageBox.Show("Updated Successfully!");
                DisableComponents();
            }
            else
            {
                MessageBox.Show("Please Provide Correct Session Details. Then Try Again!");
            }
        }
    }
}
