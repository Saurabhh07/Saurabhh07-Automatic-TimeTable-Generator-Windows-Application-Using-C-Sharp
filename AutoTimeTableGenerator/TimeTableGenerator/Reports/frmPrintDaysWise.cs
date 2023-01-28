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
    public partial class frmPrintDaysWise : Form
    {
        public frmPrintDaysWise()
        {
            InitializeComponent();
            rpt_AllDaysTimeTable rpt = new rpt_AllDaysTimeTable();
            rpt.Refresh();
            crv.ReportSource = rpt;
        }

        private void frmPrintDaysWise_Load(object sender, EventArgs e)
        {

        }
    }
}
