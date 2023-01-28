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
    public partial class frmProgramSemesterSubject : Form
    {
        public frmProgramSemesterSubject()
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
                    query = "Select [ProgramSemesterSubjectID] [ID],[ProgramID],[Program],ProgramSemesterID, Title [Semester], LectureSubjectID,SSTitle [Subject],  Capacity , IsSubjectActive [Status] From " +
                    " v_AllSemestersSubjects WHERE [ProgramSemesterIsActive] = 1 and [ProgramIsActive] = 1 and [SemesterIsActive] = 1 and [SubjectIsActive] = 1 " +
                    " Order by ProgramSemesterID";
                }
                else
                {
                    query = "Select [ProgramSemesterSubjectID] [ID],[ProgramID],[Program],ProgramSemesterID, Title [Semester], LectureSubjectID,SSTitle [Subject],  Capacity, IsSubjectActive [Status] From " +
                    " v_AllSemestersSubjects WHERE [ProgramSemesterIsActive] = 1 and [ProgramIsActive] = 1 and [SemesterIsActive] = 1 and [SubjectIsActive] = 1 " +
                    " AND (Program + ' ' + Title + ' ' + SSTitle) like '%"+ searchvalue + "%' Order by ProgramSemesterID";
                }

                DataTable semesterlist = DatabaseLayer.Retrive(query);
                dgvTecherSubjects.DataSource = semesterlist;
                if (dgvTecherSubjects.Rows.Count > 0)
                {
                    dgvTecherSubjects.Columns[0].Visible = false; // ProgramSemesterSubjectID
                    dgvTecherSubjects.Columns[1].Visible = false; //ProgramID
                    dgvTecherSubjects.Columns[2].Width=120; // Program
                    dgvTecherSubjects.Columns[3].Visible = false; // ProgramSemesterID
                    dgvTecherSubjects.Columns[4].Width=150; // Semester
                    dgvTecherSubjects.Columns[5].Visible = false; // LectureSubjectID
                    dgvTecherSubjects.Columns[6].Width = 300; // Subject
                    dgvTecherSubjects.Columns[7].Width = 80; // Capacity
                    dgvTecherSubjects.Columns[8].Width = 80; // Status
                    dgvTecherSubjects.ClearSelection();
                }
            }
            catch
            {
                MessageBox.Show("Some unexpected issue occure plz try again!");
            }
        }

        private void frmProgramSemesterSubject_Load(object sender, EventArgs e)
        {
            ComboHelper.AllProgramSemesters(cmbSemesters);
            ComboHelper.AllTeachersSubject(cmbSubjects);
            FillGrid(string.Empty);
        }

        private void cmbSemesters_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void cmbSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtTitle.Text = cmbSubjects.SelectedIndex == 0 ? string.Empty : cmbSubjects.Text;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            ep.Clear();
            if (txtTitle.Text.Trim().Length == 0)
            {
                ep.SetError(txtTitle, "Please Enter Semester Subject Title!");
                txtTitle.Focus();
                txtTitle.SelectAll();
                return;
            }

            if (cmbSemesters.SelectedIndex == 0)
            {
                ep.SetError(cmbSemesters, "Please Select Semester!");
                cmbSemesters.Focus();
                return;
            }

            if (cmbSubjects.SelectedIndex == 0)
            {
                ep.SetError(cmbSubjects, "Please Select Subject!");
                cmbSubjects.Focus();
                return;
            }

            string checkquery = "select * from ProgramSemesterSubjectTable where ProgramSemesterID = '" + cmbSemesters.SelectedValue + "' and LectureSubjectID = '" + cmbSubjects.SelectedValue + "'";
            DataTable dt = DatabaseLayer.Retrive(checkquery);

            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    ep.SetError(cmbSubjects, "All Ready Exist!");
                    cmbSubjects.Focus();
                    return;
                }
            }

            string insertquery = string.Format("insert into ProgramSemesterSubjectTable(SSTitle,ProgramSemesterID,LectureSubjectID) values('{0}','{1}','{2}')",txtTitle.Text.Trim(),cmbSemesters.SelectedValue, cmbSubjects.SelectedValue);
            bool result = DatabaseLayer.Insert(insertquery);
            if (result == true)
            {
                MessageBox.Show("Subject Assign Successfully!");
                FillGrid(string.Empty);
                FormClear();
            }
            else {
                MessageBox.Show("Please Provide correct details, and try again!");
            }
        }

        private void FormClear()
        {
            txtTitle.Clear();
            cmbSubjects.SelectedIndex = 0;
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            FormClear();
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            FillGrid(txtSearch.Text.Trim());
        }

        private void cmsedit_Click(object sender, EventArgs e)
        {
            if (dgvTecherSubjects != null)
            {
                if (dgvTecherSubjects.Rows.Count > 0)
                {
                    if (dgvTecherSubjects.SelectedRows.Count == 1)
                    {
                        
                        if (MessageBox.Show("Are you sure you want to change status?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                        {
                            bool existstatus = Convert.ToBoolean(dgvTecherSubjects.CurrentRow.Cells[8].Value);
                            int semestersubjectid = Convert.ToInt32(dgvTecherSubjects.CurrentRow.Cells[0].Value);
                            bool status = false;
                            if (existstatus == true)
                            {
                                status = false;
                            }
                            else {
                                status = true;
                            }
                            string updatequery = string.Format("update ProgramSemesterSubjectTable set IsSubjectActive = '{0}' where ProgramSemesterSubjectID = '{1}'", status, semestersubjectid);
                            bool result = DatabaseLayer.Update(updatequery);
                            if (result == true)
                            {
                                MessageBox.Show("Change Successfully!");
                                FillGrid(string.Empty);
                            }
                            else {
                                MessageBox.Show("Please Try Again!");
                            }
                        }
                    }
                    else {
                        MessageBox.Show("Please Select One Record!");
                    }
                }
                else {
                    MessageBox.Show("List is Empty!");
                }
            }
            else {
                MessageBox.Show("List is Empty!");
            }
        }
    }
}
