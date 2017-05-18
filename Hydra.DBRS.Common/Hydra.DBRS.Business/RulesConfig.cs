﻿using Hydra.DBRS.DataAccess;
using Hydra.DBRS.Infrastructure;
using Hydra.DBRS.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Hydra.DBRS.Business
{
    public class RulesConfig
    {
        private DataAccess.RulesConfig dataAccess = null;

        public RulesConfig()
        {
            this.dataAccess = new DataAccess.RulesConfig();
        }

        public List<string> LoadCompanies()
        {
            List<string> companies = new List<string>();
            using (DataSet dsCompanies = this.dataAccess.LoadCompanies())
            {
                if (dsCompanies != null && dsCompanies.Tables.Count > 0 && dsCompanies.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in dsCompanies.Tables[0].Rows)
                    {
                        companies.Add(Helper.GetDBValue(dr["CompanyName"]));
                    }
                }
            }

            return companies;
        }

        public List<string> LoadCompanyHeader(string companyName)
        {
            List<string> companies = new List<string>();
            using (DataSet dsCompanyHeaders = this.dataAccess.LoadCompanyHeaders(companyName))
            {
                if (dsCompanyHeaders != null && dsCompanyHeaders.Tables.Count > 0 && dsCompanyHeaders.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in dsCompanyHeaders.Tables[0].Rows)
                    {
                        companies.Add(Helper.GetDBValue(dr["Header"]));
                    }
                }
            }

            return companies;
        }

        public List<string> LoadStandardFieldNames(string companyHeader)
        {
            List<string> lstStdFields = new List<string>();
            using (DataSet ds = this.dataAccess.LoadStandardFieldNames(companyHeader))
            {
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        lstStdFields.Add(Helper.GetDBValue(dr["StandardFieldName"]));
                    }
                }
            }

            return lstStdFields;
        }

        public bool InsertRulesConfig(RulesInfo rulesInfo)
        {
            try
            {
                this.dataAccess.InsertRulesConfig(rulesInfo);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public Dictionary<string, RulesInfo> LoadRules(string companyHeader)
        {
            try
            {
                using (DataSet ds = this.dataAccess.LoadRules(companyHeader))
                {
                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        Dictionary<string, RulesInfo> dictRules = new Dictionary<string, RulesInfo>();
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            dictRules.Add(Helper.GetDBValue(dr["RuleName"]), new RulesInfo()
                            {
                                CompanyHeader = Helper.GetDBValue(dr["CompanyHeader"]),
                                ElementName = Helper.GetDBValue(dr["ElementName"]),
                                ElementType = Helper.GetDBValue(dr["ElementType"]),
                                IsAutoElementName = Helper.ToBool(dr["IsAutoElementName"]),
                                IsPreviousYear = Helper.ToBool(dr["IsPreviousYear"]),
                                PreviousYearColumns = Helper.GetDBValue(dr["PreviousYearColumns"]),
                                RuleCondition = Helper.GetDBValue(dr["RuleCondition"]),
                                RuleId = Helper.ToInt(dr["Id"])
                            });
                        }

                        return dictRules;
                    }
                }

                return null;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
