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
    public partial class frmLectures : Form
    {
        public frmLectures()
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
                    query = "select LectureID [ID], FullName [Lecturer], ContactNo [Contact No], IsActive [Status] from LectureTable";
                }
                else
                {
                    query = "select LectureID [ID], FullName [Lecturer], ContactNo [Contact No], IsActive [Status] from LectureTable where (FullName + ' ' +ContactNo)  like '%" + searchvalue.Trim() + "%'";
                }

                DataTable Lablist = DatabaseLayer.Retrive(query);
                dgvLecturers.DataSource = Lablist;
                if (dgvLecturers.Rows.Count > 0)
                {
                    dgvLecturers.Columns[0].Width = 80;
                    dgvLecturers.Columns[1].Width = 150;
                    dgvLecturers.Columns[2].Width = 100;
                    dgvLecturers.Columns[3].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
                }
            }
            catch
            {
                MessageBox.Show("Some unexpected issue occure plz try again!");
            }
        }

        private void frmLectures_Load(object sender, EventArgs e)
        {
            FillGrid(string.Empty);
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            FillGrid(txtSearch.Text.Trim());
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            ep.Clear();
            if (txtLecturer.Text.Length == 0 || txtLecturer.Text.Length > 31)
            {
                ep.SetError(txtLecturer, "Please Enter Full Name!");
                txtLecturer.Focus();
                txtLecturer.SelectAll();
                return;
            }

            if (txtContactNo.Text.Length < 12)
            {
                ep.SetError(txtContactNo, "Please Enter Correct Contact No!");
                txtContactNo.Focus();
                txtContactNo.SelectAll();
                return;
            }

            DataTable checktitle = DatabaseLayer.Retrive("select * from LectureTable where FullName = '" + txtLecturer.Text.ToUpper().Trim() + "' and ContactNo = '"+txtContactNo.Text.Trim()+"'");
            if (checktitle != null)
            {
                if (checktitle.Rows.Count > 0)
                {
                    ep.SetError(txtLecturer, "Already Exist!");
                    txtLecturer.Focus();
                    txtLecturer.SelectAll();
                    return;
                }
            }

            string insertquery = string.Format("insert into LectureTable(FullName,ContactNo,IsActive) values('{0}','{1}','{2}')",
                                txtLecturer.Text.ToUpper().Trim(), txtContactNo.Text.Trim(), chkStatus.Checked);
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
            txtLecturer.Clear();
            txtContactNo.Clear();
            chkStatus.Checked = false;

        }

        public void EnableComponents()
        {
            dgvLecturers.Enabled = false;
            btnClear.Visible = false;
            btnSave.Visible = false;
            btnCancel.Visible = true;
            btnUpdate.Visible = true;
            txtSearch.Enabled = false;
        }

        public void DisableComponents()
        {
            dgvLecturers.Enabled = true;
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
            if (dgvLecturers != null)
            {
                if (dgvLecturers.Rows.Count > 0)
                {
                    if (dgvLecturers.SelectedRows.Count == 1)
                    {
                        txtLecturer.Text = Convert.ToString(dgvLecturers.CurrentRow.Cells[1].Value);
                        txtContactNo.Text = Convert.ToString(dgvLecturers.CurrentRow.Cells[2].Value);
                        chkStatus.Checked = Convert.ToBoolean(dgvLecturers.CurrentRow.Cells[3].Value);
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
            if (txtLecturer.Text.Length == 0 || txtLecturer.Text.Length > 31)
            {
                ep.SetError(txtLecturer, "Please Enter Full Name!");
                txtLecturer.Focus();
                txtLecturer.SelectAll();
                return;
            }

            if (txtContactNo.Text.Length < 12)
            {
                ep.SetError(txtContactNo, "Please Enter Correct Contact No!");
                txtContactNo.Focus();
                txtContactNo.SelectAll();
                return;
            }

            DataTable checktitle = DatabaseLayer.Retrive("select * from LectureTable where FullName = '" + txtLecturer.Text.ToUpper().Trim() + "' and ContactNo = '"+txtContactNo.Text.Trim()+"' and LectureID != '" + Convert.ToString(dgvLecturers.CurrentRow.Cells[0].Value) + "'");
            if (checktitle != null)
            {
                if (checktitle.Rows.Count > 0)
                {
                    ep.SetError(txtLecturer, "Already Exist!");
                    txtLecturer.Focus();
                    txtLecturer.SelectAll();
                    return;
                }
            }

            string updatequery = string.Format("update LectureTable set FullName = '{0}',ContactNo = '{1}', IsActive = '{2}' where LectureID = '{3}'",
                                txtLecturer.Text.ToUpper().Trim(), txtContactNo.Text.Trim(), chkStatus.Checked, Convert.ToString(dgvLecturers.CurrentRow.Cells[0].Value));
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
