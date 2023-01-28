using System.Data;
using System.Windows.Forms;

namespace TimeTableGenerator.SourceCode
{
    public class ComboHelper
    {
        public static void Session(ComboBox cmb)
        {
            try {cmb.Items.Clear();}catch (System.Exception){ }

            DataTable dtlist = new DataTable();
            dtlist.Columns.Add("SessionID");
            dtlist.Columns.Add("Title");
            dtlist.Rows.Add("0", "---Select---");
            try
            {
                DataTable dt = DatabaseLayer.Retrive("select SessionID, Title from SessionTable where IsActive = 1");
                if (dt != null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow semester in dt.Rows)
                        {
                            dtlist.Rows.Add(semester["SessionID"], semester["Title"]);
                        }
                    }
                }
                cmb.DataSource = dtlist;
                cmb.ValueMember = "SessionID";
                cmb.DisplayMember = "Title";
            }
            catch
            {
                cmb.DataSource = dtlist;
            }
        }

        public static void Semesters(ComboBox cmb)
        {
            try
            {
                cmb.Items.Clear();
            }
            catch (System.Exception)
            {


            }

            DataTable dtSemesters = new DataTable();
            dtSemesters.Columns.Add("SemesterID");
            dtSemesters.Columns.Add("SemesterName");
            dtSemesters.Rows.Add("0", "---Select---");
            try
            {
                DataTable dt = DatabaseLayer.Retrive("select SemesterID, SemesterName from SemesterTable where IsActive = 1");
                if (dt != null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow semester in dt.Rows)
                        {
                            dtSemesters.Rows.Add(semester["SemesterID"], semester["SemesterName"]);
                        }
                    }
                }
                cmb.DataSource = dtSemesters;
                cmb.ValueMember = "SemesterID";
                cmb.DisplayMember = "SemesterName";
            }
            catch
            {
                cmb.DataSource = dtSemesters;
            }
        }

        public static void Programs(ComboBox cmb)
        {
            try
            {
                cmb.Items.Clear();
            }
            catch (System.Exception)
            {


            }

            DataTable dtPrograms = new DataTable();
            dtPrograms.Columns.Add("ProgramID");
            dtPrograms.Columns.Add("Name");
            dtPrograms.Rows.Add("0", "---Select---");
            try
            {
                DataTable dt = DatabaseLayer.Retrive("select ProgramID, Name from ProgramTable where IsActive = 1");
                if (dt != null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow program in dt.Rows)
                        {
                            dtPrograms.Rows.Add(program["ProgramID"], program["Name"]);
                        }
                    }
                }
                cmb.DataSource = dtPrograms;
                cmb.ValueMember = "ProgramID";
                cmb.DisplayMember = "Name";
            }
            catch
            {
                cmb.DataSource = dtPrograms;
            }
        }

        public static void RoomTypes(ComboBox cmb)
        {
            try
            {
                cmb.Items.Clear();
            }
            catch (System.Exception)
            {


            }

            DataTable dtTypes = new DataTable();
            dtTypes.Columns.Add("RoomTypeID");
            dtTypes.Columns.Add("TypeName");
            dtTypes.Rows.Add("0", "---Select---");
            try
            {
                DataTable dt = DatabaseLayer.Retrive("select RoomTypeID, TypeName from RoomTypeTable");
                if (dt != null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow type in dt.Rows)
                        {
                            dtTypes.Rows.Add(type["RoomTypeID"], type["TypeName"]);
                        }
                    }
                }
                cmb.DataSource = dtTypes;
                cmb.ValueMember = "RoomTypeID";
                cmb.DisplayMember = "TypeName";
            }
            catch
            {
                cmb.DataSource = dtTypes;
            }
        }


        public static void AllDays(ComboBox cmb)
        {
            try
            {
                cmb.Items.Clear();
            }
            catch (System.Exception)
            {


            }

            DataTable dtlist = new DataTable();
            dtlist.Columns.Add("DayID");
            dtlist.Columns.Add("Name");
            dtlist.Rows.Add("0", "---Select---");
            try
            {
                DataTable dt = DatabaseLayer.Retrive("select DayID, Name from DayTable where IsActive = 1");
                if (dt != null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow type in dt.Rows)
                        {
                            dtlist.Rows.Add(type["DayID"], type["Name"]);
                        }
                    }
                }
                cmb.DataSource = dtlist;
                cmb.ValueMember = "DayID";
                cmb.DisplayMember = "Name";
            }
            catch
            {
                cmb.DataSource = dtlist;
            }
        }

        public static void AllTechers(ComboBox cmb)
        {
            try
            {
                cmb.Items.Clear();
            }
            catch (System.Exception)
            {


            }

            DataTable dtlist = new DataTable();
            dtlist.Columns.Add("LectureID");
            dtlist.Columns.Add("FullName");
            dtlist.Rows.Add("0", "---Select---");
            try
            {
                DataTable dt = DatabaseLayer.Retrive("select LectureID, FullName from LectureTable where IsActive = 1");
                if (dt != null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow type in dt.Rows)
                        {
                            dtlist.Rows.Add(type["LectureID"], type["FullName"]);
                        }
                    }
                }
                cmb.DataSource = dtlist;
                cmb.ValueMember = "LectureID";
                cmb.DisplayMember = "FullName";
            }
            catch
            {
                cmb.DataSource = dtlist;
            }
        }

        public static void AllSubjects(ComboBox cmb)
        {
            try
            {
                cmb.Items.Clear();
            }
            catch (System.Exception)
            {


            }

            DataTable dtlist = new DataTable();
            dtlist.Columns.Add("CourseID");
            dtlist.Columns.Add("Title");
            dtlist.Rows.Add("0", "---Select---");
            try
            {
                DataTable dt = DatabaseLayer.Retrive("select CourseID, Title from CourseTable where IsActive = 1");
                if (dt != null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow type in dt.Rows)
                        {
                            dtlist.Rows.Add(type["CourseID"], type["Title"]);
                        }
                    }
                }
                cmb.DataSource = dtlist;
                cmb.ValueMember = "CourseID";
                cmb.DisplayMember = "Title";
            }
            catch
            {
                cmb.DataSource = dtlist;
            }
        }

        public static void AllProgramSemesters(ComboBox cmb)
        {
            try
            {
                cmb.Items.Clear();
            }
            catch 
            {

              
            }
         
            DataTable dtlist = new DataTable();
            dtlist.Columns.Add("ProgramSemesterID");
            dtlist.Columns.Add("Title");
            dtlist.Rows.Add("0", "---Select---");
            try
            {
                DataTable dt = DatabaseLayer.Retrive("select ProgramSemesterID, Title from v_ProgramSemesterActiveList where ProgramSemesterIsActive = 1");
                if (dt != null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow type in dt.Rows)
                        {
                            dtlist.Rows.Add(type["ProgramSemesterID"], type["Title"]);
                        }
                    }
                }
                cmb.DataSource = dtlist;
                cmb.ValueMember = "ProgramSemesterID";
                cmb.DisplayMember = "Title";
            }
            catch
            {
                cmb.DataSource = dtlist;
            }
        }

        public static void AllProgramSemestersTimeTable(ComboBox cmb)
        {
            try
            {
                cmb.Items.Clear();
            }
            catch
            {


            }

            DataTable dtlist = new DataTable();
            dtlist.Columns.Add("ProgramSemesterID");
            dtlist.Columns.Add("Title");
            dtlist.Rows.Add("0", "-All Semester-");
            try
            {
                DataTable dt = DatabaseLayer.Retrive("select ProgramSemesterID, Title from v_ProgramSemesterActiveList where ProgramSemesterIsActive = 1");
                if (dt != null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow type in dt.Rows)
                        {
                            dtlist.Rows.Add(type["ProgramSemesterID"], type["Title"]);
                        }
                    }
                }
                cmb.DataSource = dtlist;
                cmb.ValueMember = "ProgramSemesterID";
                cmb.DisplayMember = "Title";
            }
            catch
            {
                cmb.DataSource = dtlist;
            }
        }

        public static void AllTeachersSubject(ComboBox cmb)
        {
            try
            {
                cmb.Items.Clear();
            }
            catch (System.Exception)
            {

             
            }
         
            DataTable dtlist = new DataTable();
            dtlist.Columns.Add("LectureSubjectID");
            dtlist.Columns.Add("SubjectTitle");
            dtlist.Rows.Add("0", "---Select---");
            try
            {
                DataTable dt = DatabaseLayer.Retrive("select LectureSubjectID, SubjectTitle from v_AllSubjectsTeachers where IsActive = 1");
                if (dt != null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow type in dt.Rows)
                        {
                            dtlist.Rows.Add(type["LectureSubjectID"], type["SubjectTitle"]);
                        }
                    }
                }
                cmb.DataSource = dtlist;
                cmb.ValueMember = "LectureSubjectID";
                cmb.DisplayMember = "SubjectTitle";
            }
            catch
            {
                cmb.DataSource = dtlist;
            }
        }


        public static void TimeSlotsNumbers(ComboBox cmb)
        {
            try
            {
                cmb.Items.Clear();
            }
            catch (System.Exception)
            {


            }

            DataTable dtlist = new DataTable();
            dtlist.Columns.Add("ID");
            dtlist.Columns.Add("Number");
            dtlist.Rows.Add("0", "---Select---");
            dtlist.Rows.Add("1", "1");
            dtlist.Rows.Add("2", "2");
            dtlist.Rows.Add("3", "3");
            dtlist.Rows.Add("4", "4");
            dtlist.Rows.Add("5", "5");
            dtlist.Rows.Add("6", "6");
            dtlist.Rows.Add("7", "7");
            dtlist.Rows.Add("8", "8");
            dtlist.Rows.Add("9", "9");
            dtlist.Rows.Add("10", "10");
            dtlist.Rows.Add("11", "11");
            dtlist.Rows.Add("12", "12");
            dtlist.Rows.Add("12", "12");
            dtlist.Rows.Add("14", "14");
            dtlist.Rows.Add("15", "15");
            dtlist.Rows.Add("16", "16");
            dtlist.Rows.Add("17", "17");
            dtlist.Rows.Add("18", "18");
            dtlist.Rows.Add("19", "19");
            dtlist.Rows.Add("20", "20");
            dtlist.Rows.Add("21", "21");
            dtlist.Rows.Add("22", "22");
            dtlist.Rows.Add("23", "23");
            dtlist.Rows.Add("24", "24");
            dtlist.Rows.Add("25", "25");
            dtlist.Rows.Add("26", "26");
            dtlist.Rows.Add("27", "27");
            dtlist.Rows.Add("28", "28");
            dtlist.Rows.Add("29", "29");
            dtlist.Rows.Add("30", "30");
            dtlist.Rows.Add("31", "31");
            dtlist.Rows.Add("32", "32");
            dtlist.Rows.Add("33", "33");
            dtlist.Rows.Add("34", "34");
            dtlist.Rows.Add("35", "35");
            dtlist.Rows.Add("36", "36");
            dtlist.Rows.Add("37", "37");
            dtlist.Rows.Add("38", "38");
            dtlist.Rows.Add("39", "39");
            dtlist.Rows.Add("40", "40");
            cmb.DataSource = dtlist;
            cmb.ValueMember = "ID";
            cmb.DisplayMember = "Number";

        }
    }
}
