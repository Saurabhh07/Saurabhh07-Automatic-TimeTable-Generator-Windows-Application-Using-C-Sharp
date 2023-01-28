using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TimeTableGenerator.Forms.ConfigurationForms;
using TimeTableGenerator.Forms.LectureSubjectForms;
using TimeTableGenerator.Forms.ProgramSemesterForms;
using TimeTableGenerator.Forms.TimeSlotForms;
using TimeTableGenerator.Forms.TimeTableForms;
using TimeTableGenerator.Reports;

namespace TimeTableGenerator.Forms
{
    public partial class HomeForm : Form
    {
        frmCourses CoursesForm;
        frmDays DaysForm;
        frmLabs LabsForm;
        frmLectures LecturesForm;
        frmProgram ProgramForm;
        frmRoom RoomForm;
        frmSemesters SemestersForm;
        frmSession SessionForm;
        FrmLecturesSubject LecturesSubjectForm;
        frmProgramSemesters ProgramSemestersForm;
        frmProgramSemesterSubject ProgramSemesterSubjectForm;
        frmDayTimeSlots DayTimeSlotsForm;
        frmSemesterSections SemesterSectionsForm;
        frmTimeTableManualEntry TimeTableManualEntryForm;
        frmAutoGenerateTimeTable AutoGenerateTimeTableForm;
        frmPrintAllTimeTables PrintAllTimeTablesForm;
        frmPrintTeacherWiseTimeTable PrintAllTeacherTimeTablesForm;
        frmPrintDaysWise PrintAllDaysTimeTablesForm;

        public HomeForm()
        {
            InitializeComponent();
            tsslblDateTime.Text = DateTime.Now.ToString("hh:mm tt dddd MMMM yyyy");
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            if (ProgramForm == null)
            {
                ProgramForm = new frmProgram();
            }
            ProgramForm.ShowDialog();


        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            if (SessionForm == null)
            {
                SessionForm = new frmSession();
            }
            SessionForm.ShowDialog();

        }

        private void toolStripButton4_Click(object sender, EventArgs e)
        {
            if (CoursesForm == null)
            {
                CoursesForm = new frmCourses();
            }
            CoursesForm.ShowDialog();
        }

        private void newLecturesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (LecturesForm == null)
            {
                LecturesForm = new frmLectures();
            }
            LecturesForm.ShowDialog();
        }

        private void assignSubjectsToLectureToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (LecturesSubjectForm == null)
            {
                LecturesSubjectForm = new FrmLecturesSubject();
            }
            LecturesSubjectForm.ShowDialog();
        }

        private void addRoomsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (RoomForm == null)
            {
                RoomForm = new frmRoom();
            }
            RoomForm.ShowDialog();
        }

        private void addLabsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (LabsForm == null)
            {
                LabsForm = new frmLabs();
            }
            LabsForm.ShowDialog();
        }

        private void newSemestersToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (SemestersForm == null)
            {
                SemestersForm = new frmSemesters();
            }
            SemestersForm.ShowDialog();
        }

        private void assignSemesterToProgrameToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (ProgramSemestersForm == null)
            {
                ProgramSemestersForm = new frmProgramSemesters();
            }
            ProgramSemestersForm.ShowDialog();
        }

        private void assignSubjectToSemesterToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (ProgramSemesterSubjectForm == null)
            {
                ProgramSemesterSubjectForm = new frmProgramSemesterSubject();
            }
            ProgramSemesterSubjectForm.ShowDialog();
        }

        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {
            if (DaysForm == null)
            {
                DaysForm = new frmDays();
            }
            DaysForm.ShowDialog();
        }

        private void toolStripMenuItem2_Click(object sender, EventArgs e)
        {
            if (DayTimeSlotsForm == null)
            {
                DayTimeSlotsForm = new frmDayTimeSlots();
            }
            DayTimeSlotsForm.ShowDialog();
        }

        private void addSemesterSectionsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (SemesterSectionsForm == null)
            {
                SemesterSectionsForm = new frmSemesterSections();
            }
            SemesterSectionsForm.ShowDialog();
           
        }

        private void manualTimeTableEntrytoolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (TimeTableManualEntryForm == null)
            {
                TimeTableManualEntryForm = new frmTimeTableManualEntry();
            }
            TimeTableManualEntryForm.ShowDialog();
        }

        private void autoGenerateTimeTableToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (AutoGenerateTimeTableForm == null)
            {
                AutoGenerateTimeTableForm = new frmAutoGenerateTimeTable();
            }
            AutoGenerateTimeTableForm.ShowDialog();
        }

        private void printAllTimeTablesToolStripMenuItem1_Click(object sender, EventArgs e)
        {
           
            if (PrintAllTimeTablesForm == null)
            {
                PrintAllTimeTablesForm = new frmPrintAllTimeTables();
            }
            PrintAllTimeTablesForm.TopLevel = false;
            panelHeader.Controls.Add(PrintAllTimeTablesForm);
            PrintAllTimeTablesForm.Dock = DockStyle.Fill;
            PrintAllTimeTablesForm.FormBorderStyle = FormBorderStyle.None;
            PrintAllTimeTablesForm.BringToFront();
            PrintAllTimeTablesForm.Show();
        }

        private void printAllTeacherTimeTablesToolStripMenuItem_Click(object sender, EventArgs e)
        {
           
            if (PrintAllTeacherTimeTablesForm == null)
            {
                PrintAllTeacherTimeTablesForm = new frmPrintTeacherWiseTimeTable();
            }
            PrintAllTeacherTimeTablesForm.TopLevel = false;
            panelHeader.Controls.Add(PrintAllTeacherTimeTablesForm);
            PrintAllTeacherTimeTablesForm.Dock = DockStyle.Fill;
            PrintAllTeacherTimeTablesForm.FormBorderStyle = FormBorderStyle.None;
            PrintAllTeacherTimeTablesForm.BringToFront();
            PrintAllTeacherTimeTablesForm.Show();
        }

        private void HomeForm_Load(object sender, EventArgs e)
        {

        }

        private void printAllDaysWiseTimeTablesToolStripMenuItem_Click(object sender, EventArgs e)
        {
           

              if (PrintAllDaysTimeTablesForm == null)
            {
                PrintAllDaysTimeTablesForm = new frmPrintDaysWise();
            }
            PrintAllDaysTimeTablesForm.TopLevel = false;
            panelHeader.Controls.Add(PrintAllDaysTimeTablesForm);
            PrintAllDaysTimeTablesForm.Dock = DockStyle.Fill;
            PrintAllDaysTimeTablesForm.FormBorderStyle = FormBorderStyle.None;
            PrintAllDaysTimeTablesForm.BringToFront();
            PrintAllDaysTimeTablesForm.Show();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
