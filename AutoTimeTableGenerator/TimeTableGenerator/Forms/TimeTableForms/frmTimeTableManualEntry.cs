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

namespace TimeTableGenerator.Forms.TimeTableForms
{
    public partial class frmTimeTableManualEntry : Form
    {
        public frmTimeTableManualEntry()
        {
            InitializeComponent();
        }

        private void groupBox5_Enter(object sender, EventArgs e)
        {

        }

        private void frmTimeTableManualEntry_Load(object sender, EventArgs e)
        {
            ComboHelper.AllProgramSemesters(cmbSemesters);
            ComboHelper.Session(cmbSession);
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            
        }
    }
}
