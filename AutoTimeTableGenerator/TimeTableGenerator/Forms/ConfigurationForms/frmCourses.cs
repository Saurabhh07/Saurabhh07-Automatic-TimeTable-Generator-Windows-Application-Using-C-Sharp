using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TimeTableGenerator.SourceCode;

namespace TimeTableGenerator.Forms.ConfigurationForms
{
    public partial class frmCourses : Form
    {
        public frmCourses()
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
                    query = "select CourseID [ID], Title [Subject], CrHrs, RoomTypeID, TypeName [Type], IsActive from v_AllSubjects";
                }
                else
                {
                    query = "select CourseID [ID], Title [Subject], CrHrs, RoomTypeID, TypeName [Type], IsActive from v_AllSubjects where (Title + ' ' + TypeName) like '%" + searchvalue.Trim() + "%'";
                }

                DataTable Lablist = DatabaseLayer.Retrive(query);
                dgvCourses.DataSource = Lablist;
                if (dgvCourses.Rows.Count > 0)
                {
                    dgvCourses.Columns[0].Width = 80; // CourseID
                    dgvCourses.Columns[1].Width = 250;  // Title
                    dgvCourses.Columns[2].Width = 60;  // CrHrs
                    dgvCourses.Columns[3].Visible = false; // RoomTypeID
                    dgvCourses.Columns[4].Width = 250;  // TypeName
                    dgvCourses.Columns[5].Width = 80;  // IsActive
                }
            }
            catch
            {
                MessageBox.Show("Some unexpected issue occure plz try again!");
            }
        }

        private void frmCourses_Load(object sender, EventArgs e)
        {
            cmbCrHrs.SelectedIndex = 0;
            ComboHelper.RoomTypes(cmbSelectType);
            FillGrid(string.Empty);
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            FillGrid(txtSearch.Text.Trim());
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            ep.Clear();
            if (txtSubjectTitle.Text.Length == 0)
            {
                ep.SetError(txtSubjectTitle, "Please Enter Subject Title!");
                txtSubjectTitle.Focus();
                txtSubjectTitle.SelectAll();
                return;
            }

            if (cmbSelectType.SelectedIndex == 0)
            {
                ep.SetError(cmbSelectType, "Please Select Type!");
                cmbSelectType.Focus();
                return;
            }

            

            DataTable checktitle = DatabaseLayer.Retrive("select * from CourseTable where Title = '" + txtSubjectTitle.Text.Trim() + "'");
            if (checktitle != null)
            {
                if (checktitle.Rows.Count > 0)
                {
                    ep.SetError(txtSubjectTitle, "Already Exist!");
                    txtSubjectTitle.Focus();
                    txtSubjectTitle.SelectAll();
                    return;
                }
            }

            string insertquery = string.Format("insert into CourseTable(Title,CrHrs,RoomTypeID,IsActive) values('{0}','{1}','{2}','{3}')",
                                txtSubjectTitle.Text.Trim(), cmbCrHrs.Text, cmbSelectType.SelectedValue, chkStatus.Checked);
            bool result = DatabaseLayer.Insert(insertquery);
            if (result == true)
            {
                MessageBox.Show("Save Successfully!");
                SaveClearForm();
            }
            else
            {
                MessageBox.Show("Please Provide Correct Details. Then Try Again!");
            }
        }

        public void ClearForm()
        {
            txtSubjectTitle.Clear();
            cmbSelectType.SelectedIndex = 0;
            cmbCrHrs.SelectedIndex = 0;
            chkStatus.Checked = false;

        }

        public void SaveClearForm()
        {
            txtSubjectTitle.Clear();
            chkStatus.Checked = true;
            FillGrid(string.Empty);

        }

        public void EnableComponents()
        {
            dgvCourses.Enabled = false;
            btnClear.Visible = false;
            btnSave.Visible = false;
            btnCancel.Visible = true;
            btnUpdate.Visible = true;
            txtSearch.Enabled = false;
        }

        public void DisableComponents()
        {
            dgvCourses.Enabled = true;
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
            if (dgvCourses != null)
            {
                if (dgvCourses.Rows.Count > 0)
                {
                    if (dgvCourses.SelectedRows.Count == 1)
                    {
                        txtSubjectTitle.Text = Convert.ToString(dgvCourses.CurrentRow.Cells[1].Value);
                        cmbSelectType.SelectedValue = Convert.ToString(dgvCourses.CurrentRow.Cells[3].Value); // Program ID
                        cmbCrHrs.Text = Convert.ToString(dgvCourses.CurrentRow.Cells[2].Value); // Semester ID
                        chkStatus.Checked = Convert.ToBoolean(dgvCourses.CurrentRow.Cells[5].Value);
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
            if (txtSubjectTitle.Text.Length == 0)
            {
                ep.SetError(txtSubjectTitle, "Please Enter Subject Title!");
                txtSubjectTitle.Focus();
                txtSubjectTitle.SelectAll();
                return;
            }

            if (cmbSelectType.SelectedIndex == 0)
            {
                ep.SetError(cmbSelectType, "Please Select Type!");
                cmbSelectType.Focus();
                return;
            }



            DataTable checktitle = DatabaseLayer.Retrive("select * from CourseTable where Title = '" + txtSubjectTitle.Text.Trim() + "' and CourseID != '"+Convert.ToString(dgvCourses.CurrentRow.Cells[0].Value)+"'");
            if (checktitle != null)
            {
                if (checktitle.Rows.Count > 0)
                {
                    ep.SetError(txtSubjectTitle, "Already Exist!");
                    txtSubjectTitle.Focus();
                    txtSubjectTitle.SelectAll();
                    return;
                }
            }

            string updatequery = string.Format("update CourseTable set Title = '{0}',CrHrs = '{1}',RoomTypeID = '{2}',IsActive = '{3}' Where CourseID = '{4}'  ",
                                txtSubjectTitle.Text.Trim(), cmbCrHrs.Text,cmbSelectType.SelectedValue, chkStatus.Checked, Convert.ToString(dgvCourses.CurrentRow.Cells[0].Value));
            bool result = DatabaseLayer.Update(updatequery);
            if (result == true)
            {
                MessageBox.Show("Updated Successfully!");
                DisableComponents();
            }
            else
            {
                MessageBox.Show("Please Provide Correct Details. Then Try Again!");
            }
        }
    }
}
