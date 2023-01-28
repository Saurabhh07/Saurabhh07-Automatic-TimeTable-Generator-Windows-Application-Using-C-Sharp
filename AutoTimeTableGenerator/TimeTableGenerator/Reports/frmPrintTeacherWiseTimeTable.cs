using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TimeTableGenerator.Reports
{
    public partial class frmPrintTeacherWiseTimeTable : Form
    {
        public frmPrintTeacherWiseTimeTable()
        {
            InitializeComponent();
            rpt_AllTeacherWiseTable rpt = new rpt_AllTeacherWiseTable();
            rpt.Refresh();
            crv.ReportSource = rpt;
        }

        private void frmPrintTeacherWiseTimeTable_Load(object sender, EventArgs e)
        {

        }
    }
}
