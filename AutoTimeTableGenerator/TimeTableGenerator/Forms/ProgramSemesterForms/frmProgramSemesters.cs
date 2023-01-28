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

namespace TimeTableGenerator.Forms.ProgramSemesterForms
{
    public partial class frmProgramSemesters : Form
    {
        public frmProgramSemesters()
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
                    query = "select ProgramSemesterID [ID], Title, Capacity,ProgramSemesterIsActive [Status], ProgramID, SemesterID,SessionID from v_ProgramSemesterActiveList";
                }
                else
                {
                    query = "select ProgramSemesterID [ID], Title, Capacity,ProgramSemesterIsActive [Status], ProgramID, SemesterID,SessionID from v_ProgramSemesterActiveList where Title like '%" + searchvalue.Trim() + "%'";
                }

                DataTable Lablist = DatabaseLayer.Retrive(query);
                dgvProgramSemesters.DataSource = Lablist;
                if (dgvProgramSemesters.Rows.Count > 0)
                {
                    dgvProgramSemesters.Columns[0].Width = 60; // ProgramSemesterID
                    dgvProgramSemesters.Columns[1].Width = 250;  // Title
                    dgvProgramSemesters.Columns[2].Width = 80;  // Capacity
                    dgvProgramSemesters.Columns[3].Width = 80;  // ProgramSemesterIsActive
                    dgvProgramSemesters.Columns[4].Visible = false; // ProgramID
                    dgvProgramSemesters.Columns[5].Visible = false;  // SemesterID
                    dgvProgramSemesters.Columns[6].Visible = false;  // SessionID
                }
            }
            catch
            {
                MessageBox.Show("Some unexpected issue occure plz try again!");
            }
        }




        private void frmProgramSemesters_Load(object sender, EventArgs e)
        {
            ComboHelper.Session(cmbSelectSession);
            ComboHelper.Semesters(cmbSelectSemester);
            ComboHelper.Programs(cmbSelectProgram);
            FillGrid(string.Empty);
        }

        private void cmbSelectProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!cmbSelectProgram.Text.Contains("Select"))
            {
                if (cmbSelectSemester.SelectedIndex > 0)
                {
                    txtSemesterTitle.Text = cmbSelectSession.Text + " " + cmbSelectProgram.Text + " " + cmbSelectSemester.Text;
                }
            }
        }

        private void cmbSelectSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!cmbSelectSemester.Text.Contains("Select"))
            {
                if (cmbSelectProgram.SelectedIndex > 0)
                {
                    txtSemesterTitle.Text = cmbSelectSession.Text + " " + cmbSelectProgram.Text + " " + cmbSelectSemester.Text;
                }
            }
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            FillGrid(txtSearch.Text.Trim());
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            ep.Clear();
            if (txtSemesterTitle.Text.Length == 0)
            {
                ep.SetError(txtSemesterTitle, "Please Select Again! Title is Empty!");
                txtSemesterTitle.Focus();
                txtSemesterTitle.SelectAll();
                return;
            }

            if (cmbSelectProgram.SelectedIndex == 0)
            {
                ep.SetError(cmbSelectProgram, "Please Select Program!");
                cmbSelectProgram.Focus();
                return;
            }

            if (cmbSelectSemester.SelectedIndex == 0)
            {
                ep.SetError(cmbSelectProgram, "Please Select Semester!");
                cmbSelectProgram.Focus();
                return;
            }

            if (txtCapacity.Text.Trim().Length == 0)
            {
                ep.SetError(txtCapacity, "Please Enter Semester Capacity!");
                txtCapacity.Focus();
                return;
            }

            DataTable checktitle = DatabaseLayer.Retrive("select * from ProgramSemesterTable where ProgramID = '" + cmbSelectProgram.SelectedValue + "' and SemesterID = '" + cmbSelectSemester.SelectedValue + "' AND SessionID = '"+cmbSelectSession.SelectedValue+"'");
            if (checktitle != null)
            {
                if (checktitle.Rows.Count > 0)
                {
                    ep.SetError(txtSemesterTitle, "Already Exist!");
                    txtSemesterTitle.Focus();
                    txtSemesterTitle.SelectAll();
                    return;
                }
            }

            string insertquery = string.Format("insert into ProgramSemesterTable(Title,ProgramID,SemesterID,IsActive,Capacity,SessionID) values('{0}','{1}','{2}','{3}','{4}','{5}')",
                                txtSemesterTitle.Text.ToUpper().Trim(), cmbSelectProgram.SelectedValue, cmbSelectSemester.SelectedValue, chkStatus.Checked,txtCapacity.Text.Trim(),cmbSelectSession.SelectedValue);
            bool result = DatabaseLayer.Insert(insertquery);
            if (result == true)
            {
                MessageBox.Show("Save Successfully!");
                SaveClearForm();
            }
            else
            {
                MessageBox.Show("Please Provide Correct Semester Details. Then Try Again!");
            }
        }

        public void ClearForm()
        {
            txtSemesterTitle.Clear();
            cmbSelectSemester.SelectedIndex = 0;
            cmbSelectProgram.SelectedIndex = 0;
            chkStatus.Checked = false;

        }

        public void SaveClearForm()
        {
            txtSemesterTitle.Clear();
            cmbSelectSemester.SelectedIndex = 0;
            chkStatus.Checked = true;
            FillGrid(string.Empty);

        }

        public void EnableComponents()
        {
            dgvProgramSemesters.Enabled = false;
            btnClear.Visible = false;
            btnSave.Visible = false;
            btnCancel.Visible = true;
            btnUpdate.Visible = true;
            txtSearch.Enabled = false;
        }

        public void DisableComponents()
        {
            dgvProgramSemesters.Enabled = true;
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
            if (dgvProgramSemesters != null)
            {
                if (dgvProgramSemesters.Rows.Count > 0)
                {
                    if (dgvProgramSemesters.SelectedRows.Count == 1)
                    {
                        txtSemesterTitle.Text = Convert.ToString(dgvProgramSemesters.CurrentRow.Cells[1].Value);
                        txtCapacity.Text = Convert.ToString(dgvProgramSemesters.CurrentRow.Cells[2].Value);
                        cmbSelectProgram.SelectedValue = Convert.ToString(dgvProgramSemesters.CurrentRow.Cells[4].Value); // Program ID
                        cmbSelectSemester.SelectedValue = Convert.ToString(dgvProgramSemesters.CurrentRow.Cells[5].Value); // Semester ID
                        cmbSelectSession.SelectedValue = Convert.ToString(dgvProgramSemesters.CurrentRow.Cells[6].Value); // Session ID
                        chkStatus.Checked = Convert.ToBoolean(dgvProgramSemesters.CurrentRow.Cells[3].Value);
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
            if (txtSemesterTitle.Text.Length == 0)
            {
                ep.SetError(txtSemesterTitle, "Please Select Again! Title is Empty!");
                txtSemesterTitle.Focus();
                txtSemesterTitle.SelectAll();
                return;
            }

            if (cmbSelectProgram.SelectedIndex == 0)
            {
                ep.SetError(cmbSelectProgram, "Please Select Program!");
                cmbSelectProgram.Focus();
                return;
            }

            if (cmbSelectSemester.SelectedIndex == 0)
            {
                ep.SetError(cmbSelectProgram, "Please Select Semester!");
                cmbSelectProgram.Focus();
                return;
            }

            DataTable checktitle = DatabaseLayer.Retrive("select * from ProgramSemesterTable where ProgramID = '" + cmbSelectProgram.SelectedValue + "' and SemesterID = '" + cmbSelectSemester.SelectedValue + "' and SessionID = '"+cmbSelectSession.SelectedValue+"' and ProgramSemesterID != '" + Convert.ToString(dgvProgramSemesters.CurrentRow.Cells[0].Value)+"'");
            if (checktitle != null)
            {
                if (checktitle.Rows.Count > 0)
                {
                    ep.SetError(txtSemesterTitle, "Already Exist!");
                    txtSemesterTitle.Focus();
                    txtSemesterTitle.SelectAll();
                    return;
                }
            }

            string updatequery = string.Format("Update ProgramSemesterTable set Title = '{0}',ProgramID = '{1}',SemesterID = '{2}',IsActive = '{3}', Capacity = '{4}', SessionID = '{5}' Where ProgramSemesterID = '{6}'  ",
                                txtSemesterTitle.Text.ToUpper().Trim(), cmbSelectProgram.SelectedValue, cmbSelectSemester.SelectedValue, chkStatus.Checked, txtCapacity.Text.Trim(),cmbSelectSession.SelectedValue,Convert.ToString(dgvProgramSemesters.CurrentRow.Cells[0].Value));
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

        private void txtCapacity_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) &&
     (e.KeyChar != '.'))
            {
                e.Handled = true;
            }
        }

        private void cmbSelectSession_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!cmbSelectSession.Text.Contains("Select"))
            {
                if (cmbSelectSession.SelectedIndex > 0)
                {
                    txtSemesterTitle.Text = cmbSelectSession.Text + " " + cmbSelectProgram.Text + " " + cmbSelectSemester.Text;
                }
            }
        }
    }
}
