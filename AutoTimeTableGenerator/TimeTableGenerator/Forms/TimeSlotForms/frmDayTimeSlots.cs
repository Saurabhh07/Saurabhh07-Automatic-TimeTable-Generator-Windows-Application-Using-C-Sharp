using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TimeTableGenerator.AllModels;
using TimeTableGenerator.SourceCode;

namespace TimeTableGenerator.Forms.TimeSlotForms
{
    public partial class frmDayTimeSlots : Form
    {
        public frmDayTimeSlots()
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
                    query = "select DayTimeSlotID,ROW_NUMBER() OVER (Order by DayTimeSlotID) AS [S No],DayID,Name [Day],SlotTitle [Slot Title],StartTime [Start Time],EndTime [End Time], IsActive [Status] from v_AllTimeSlots WHERE IsActive = 1 ";
                    
                }
                else
                {
                    query = "select DayTimeSlotID,ROW_NUMBER() OVER (Order by DayTimeSlotID) AS [S No],DayID,Name [Day],SlotTitle [Slot Title],StartTime [Start Time],EndTime [End Time], IsActive [Status] from v_AllTimeSlots " +
                            " WHERE IsActive = 1 AND (Name + ' ' + SlotTitle) Like '%"+searchvalue.Trim()+"%'";
                }

                DataTable semesterlist = DatabaseLayer.Retrive(query);
                dgvSlots.DataSource = semesterlist;
                if (dgvSlots.Rows.Count > 0)
                {
                    dgvSlots.Columns[0].Visible = false; // DayTimeSlotID
                    dgvSlots.Columns[1].Width = 80; // S NO
                    dgvSlots.Columns[2].Visible = false; // DayID
                    dgvSlots.Columns[3].Width = 130; // Name
                    dgvSlots.Columns[4].Width = 150; // SlotTitle
                    dgvSlots.Columns[5].Width = 100; // StartTime
                    dgvSlots.Columns[6].Width = 100; // EndTime
                    dgvSlots.Columns[7].Width = 80; // IsActive


                }
            }
            catch
            {
                MessageBox.Show("Some unexpected issue occure plz try again!");
            }
        }

        public void ClearForm()
        {
            cmbDays.SelectedIndex = 0;
            cmbNumberofTimeSlot.SelectedIndex = 0;
            chkStatus.Checked = true;

        }

        public void EnableComponents()
        {
            dgvSlots.Enabled = false;
            btnClear.Visible = false;
            btnSave.Visible = false;
            btnCancel.Visible = true;
            btnUpdate.Visible = true;
            txtSearch.Enabled = false;
        }

        public void DisableComponents()
        {
            dgvSlots.Enabled = true;
            btnClear.Visible = true;
            btnSave.Visible = true;
            btnCancel.Visible = false;
            btnUpdate.Visible = false;
            txtSearch.Enabled = true;
            ClearForm();
            FillGrid(string.Empty);
        }

        private void frmDayTimeSlots_Load(object sender, EventArgs e)
        {
            dtpStartTime.Value = new DateTime(2020, 12, 12, 8, 0, 0);
            dtpEndTime.Value = new DateTime(2020, 12, 12, 16, 0, 0);
            ComboHelper.AllDays(cmbDays);
            ComboHelper.TimeSlotsNumbers(cmbNumberofTimeSlot);
            FillGrid(string.Empty);
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

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
                if (cmbDays.SelectedIndex == 0)
                {
                    ep.SetError(cmbDays, "Please Select Day!");
                    cmbDays.Focus();
                    return;
                }

                if (cmbNumberofTimeSlot.SelectedIndex == 0)
                {
                    ep.SetError(cmbNumberofTimeSlot, "Please Select Time Slots Per Day!");
                    cmbNumberofTimeSlot.Focus();
                    return;
                }

                string Updatequery = "update DayTimeSlotTable set IsActive = 0 where DayID = '" + cmbDays.SelectedValue + "'";
                bool updateresult = DatabaseLayer.Update(Updatequery);
                if (updateresult == true)
                {
                    List<TimeSlotsMV> timeslots = new List<TimeSlotsMV>();

                    TimeSpan time = dtpEndTime.Value - dtpStartTime.Value;

                    int totalminuts = (int)time.TotalMinutes;

                    int numberoftimeslot = Convert.ToInt32(cmbNumberofTimeSlot.SelectedValue);

                    int slot = totalminuts / numberoftimeslot;

                    int i = 0;
                    do
                    {
                        var timeslot = new TimeSlotsMV();
                        var FromTime = (dtpStartTime.Value).AddMinutes(slot * i);
                        i++;
                        var ToTime = (dtpStartTime.Value).AddMinutes(slot * i);
                        string title = FromTime.ToString("hh:mm tt") + "-" + ToTime.ToString("hh:mm tt");
                        timeslot.FromTime = FromTime;
                        timeslot.ToTime = ToTime;
                        timeslot.SlotTitle = title;
                        timeslots.Add(timeslot);
                    } while (i < numberoftimeslot);
                    bool insertstatus = true;
                    foreach (TimeSlotsMV slottime in timeslots)
                    {
                        string insertquery = string.Format("insert into DayTimeSlotTable(DayID,SlotTitle,StartTime,EndTime,IsActive) values('{0}','{1}','{2}','{3}','{4}')",
                            cmbDays.SelectedValue, slottime.SlotTitle, slottime.FromTime, slottime.ToTime, chkStatus.Checked);
                        bool result = DatabaseLayer.Insert(insertquery);
                        if (result == false)
                        {
                            insertstatus = false;
                        }
                    }
                    if (insertstatus == true)
                    {
                        MessageBox.Show("Slots Created Successfully!");
                        DisableComponents();
                    }
                    else
                    {
                        MessageBox.Show("Please Provide Correct Details, and Try Again!");
                    }
                }
                else
                {
                    MessageBox.Show("Please Provide Correct Details, and Try Again!");
                }
            }
            catch  
            {
                MessageBox.Show("Check Sql Server Agent Connectivity!");
            }
        }

        private void cmsedit_Click(object sender, EventArgs e)
        {
            if (dgvSlots != null)
            {
                if (dgvSlots.Rows.Count > 0)
                {
                    if (dgvSlots.SelectedRows.Count == 1)
                    {
                        string slotid = Convert.ToString(dgvSlots.CurrentRow.Cells[0].Value);
                        string updatequery = "Update DayTimeSlotTable set IsActive = 0 where DayTimeSlotID = '" + Convert.ToString(dgvSlots.CurrentRow.Cells[0].Value) + "'";
                        bool result = DatabaseLayer.Update(updatequery);
                        if (result == true)
                        {
                            MessageBox.Show("Break Time is Marked! And Exclude from Time Table!");
                            DisableComponents();
                        }
                    }
                }
            }
        }
    }
}
