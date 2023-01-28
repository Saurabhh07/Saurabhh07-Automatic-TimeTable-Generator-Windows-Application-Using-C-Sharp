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

namespace TimeTableGenerator.Forms.LectureSubjectForms
{
    public partial class FrmLecturesSubject : Form
    {
        public FrmLecturesSubject()
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
                    query = "select LectureSubjectID [ID], SubjectTitle [Subject Title], LectureID, FullName [Lecture],CourseID, " +
                            " Title [Course],IsActive [Status] from v_AllSubjectsTeachers Where IsActive = 1";
                }
                else
                {
                    query = "select LectureSubjectID [ID], SubjectTitle, LectureID, FullName [Lecture],CourseID, " +
                            "Title [Course],IsActive [Status] from v_AllSubjectsTeachers " +
                            "WHERE IsActive = 1 AND (SubjectTitle + ' ' + FullName + ' ' + Title) like '%" + searchvalue.Trim()+"%'";
                }

                DataTable semesterlist = DatabaseLayer.Retrive(query);
                dgvTecherSubjects.DataSource = semesterlist;
                if (dgvTecherSubjects.Rows.Count > 0)
                {
                    dgvTecherSubjects.Columns[0].Visible = false; // LectureSubjectID
                    dgvTecherSubjects.Columns[1].Width = 250; //SubjectTitle
                    dgvTecherSubjects.Columns[2].Visible = false; // LectureID
                    dgvTecherSubjects.Columns[3].Width = 150; // FullName
                    dgvTecherSubjects.Columns[4].Visible = false; // CourseID
                    dgvTecherSubjects.Columns[5].Width = 300; // Title
                    dgvTecherSubjects.Columns[6].Width = 100; // Status
                }
            }
            catch
            {
                MessageBox.Show("Some unexpected issue occure plz try again!");
            }
        }

        public void ClearForm()
        {
            cmbTeacher.SelectedIndex = 0;
            cmbSubjects.SelectedIndex = 0;

        }

        public void EnableComponents()
        {
            dgvTecherSubjects.Enabled = false;
            btnClear.Visible = false;
            btnSave.Visible = false;
           
            txtSearch.Enabled = false;
        }

        public void DisableComponents()
        {
            dgvTecherSubjects.Enabled = true;
            btnClear.Visible = true;
            btnSave.Visible = true;
            
            txtSearch.Enabled = true;
            ClearForm();
            FillGrid(string.Empty);
        }

        private void FrmLecturesSubject_Load(object sender, EventArgs e)
        {
            ComboHelper.AllSubjects(cmbSubjects);
            ComboHelper.AllTechers(cmbTeacher);
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

        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                ep.Clear();
                if (cmbTeacher.SelectedIndex == 0)
                {
                    ep.SetError(cmbTeacher, "Please Select Teacher!");
                    cmbTeacher.Focus();
                    return;
                }

                if (cmbSubjects.SelectedIndex == 0)
                {
                    ep.SetError(cmbSubjects, "Please Select Subject!");
                    cmbSubjects.Focus();
                    return;
                }

                DataTable dt = DatabaseLayer.Retrive("select * from LectureSubjectTable where LectureID = '"+cmbTeacher.SelectedValue+ "' and CourseID = '"+cmbSubjects.SelectedValue+"' AND IsActive = 1");
                if (dt != null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        ep.SetError(cmbSubjects, "Already Registerd!");
                        cmbSubjects.Focus();
                        return;
                    }
                }

                string insertquery = string.Format("insert into LectureSubjectTable(SubjectTitle,LectureID,CourseID,IsActive) values('{0}','{1}','{2}','1')",
                   cmbSubjects.Text+"("+cmbTeacher.Text+")",cmbTeacher.SelectedValue,cmbSubjects.SelectedValue);
                bool result = DatabaseLayer.Insert(insertquery);
                if (result == true)
                {
                    MessageBox.Show("Subject Assign Successfully!");
                    DisableComponents();
                    return;
                }
                else {
                    MessageBox.Show("Some Unexpected issue is occure plz try Again!");
                }

            }
            catch 
            {

                MessageBox.Show("Please Check Sql Server Agent Connectivity!");
            }
        }

        private void cmsedit_Click(object sender, EventArgs e)
        {
            try
            {
                if (dgvTecherSubjects != null)
                {
                    if (dgvTecherSubjects.Rows.Count > 0)
                    {
                        if (dgvTecherSubjects.SelectedRows.Count == 1)
                        {
                            if (MessageBox.Show("Are you sure you want to Delete selected record?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                            {
                                string id = Convert.ToString(dgvTecherSubjects.CurrentRow.Cells[0].Value);
                                bool status = (Convert.ToBoolean(dgvTecherSubjects.CurrentRow.Cells[6].Value) == true ? false : true);
                                string updatequery = "Update LectureSubjectTable set IsActive = '" + status + "' where LectureSubjectID = '" + id + "'";
                                bool result = DatabaseLayer.Update(updatequery);
                                if (result == true)
                                {
                                    MessageBox.Show("Deleted Successfully!");
                                    DisableComponents();
                                    return;
                                }
                                else
                                {
                                    MessageBox.Show("Some Unexpected issue is occure plz try Again!");
                                }
                            }
                        }
                    }
                }
            }
            catch  
            {

                 
            }
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            FillGrid(txtSearch.Text.Trim());
        }
    }
}
