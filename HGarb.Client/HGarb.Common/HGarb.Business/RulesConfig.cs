﻿using HGarb.DataAccess;
using HGarb.Infrastructure;
using HGarb.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace HGarb.Business
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
                        companies.Add(Helper.GetDBValue(dr["CompanyHeader"]));
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

        public List<string> LoadGenericStandardFieldNames()
        {
            List<string> lstStdFields = new List<string>();
            using (DataSet ds = this.dataAccess.LoadGenericStandardFieldNames())
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
        public List<string> LoadAssetClass()
        {
            List<string> lstAssetClass = new List<string>();
            using (DataSet ds = this.dataAccess.LoadAssetClass())
            {
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        lstAssetClass.Add(Helper.GetDBValue(dr["AssetClass"]));
                    }
                }
            }

            return lstAssetClass;
        }
        public bool InsertGenericRulesConfig(GenericRootObject genericRootObject)
        {
            try
            {
                this.dataAccess.InsertGenericRulesConfig(genericRootObject);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool InsertRulesConfig(RootObject rootObject)
        {
            try
            {
                this.dataAccess.InsertRulesConfig(rootObject);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }


        public List<RulesInfo> LoadRules(string companyHeader)
        {
            try
            {
                using (DataSet ds = this.dataAccess.LoadRules(companyHeader))
                {
                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        List<RulesInfo> lstRules = new List<RulesInfo>();
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            lstRules.Add(new RulesInfo()
                            {
                                CompanyHeader = Helper.GetDBValue(dr["CompanyHeader"]),
                                ElementName = Helper.GetDBValue(dr["ElementName"]),
                                ElementType = Helper.GetDBValue(dr["ElementType"]),
                                IsAutoElementName = Helper.ToBool(dr["IsAutoElementName"]),
                                RuleCondition = Helper.GetDBValue(dr["RuleData"]),
                                RuleId = Helper.ToInt(dr["Id"])
                            });
                        }

                        return lstRules;
                    }
                }

                return null;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public Dictionary<string, RulesInfo> LoadGenericRules()
        {
            try
            {
                using (DataSet ds = this.dataAccess.LoadGenericRules())
                {
                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        Dictionary<string, RulesInfo> dictRules = new Dictionary<string, RulesInfo>();
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            dictRules.Add(Helper.GetDBValue(dr["AssetClass"]), new RulesInfo()
                            {
                                AssetClass = Helper.GetDBValue(dr["AssetClass"]),
                                ElementName = Helper.GetDBValue(dr["ElementName"]),
                                ElementType = Helper.GetDBValue(dr["ElementType"]),
                                IsAutoElementName = Helper.ToBool(dr["IsAutoElementName"]),
                                IsPreviousYear = Helper.ToBool(dr["IsPreviousYear"]),
                                PreviousYearColumns = Helper.GetDBValue(dr["PreviousYearColumns"]),
                                RuleCondition = Helper.GetDBValue(dr["RuleCondition"]),
                                RuleName = Helper.GetDBValue(dr["RuleName"]),
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

        //public Dictionary<string, RulesInfo> LoadGenericRulesByKey(string dictKey)
        //{
        //    try
        //    {
        //        using (DataSet ds = this.dataAccess.LoadGenericRulesByKey(dictKey))
        //        {
        //            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        //            {
        //                Dictionary<string, RulesInfo> dictRules = new Dictionary<string, RulesInfo>();
        //                foreach (DataRow dr in ds.Tables[0].Rows)
        //                {
        //                    dictRules.Add(Helper.GetDBValue(dr["RuleName"]), new RulesInfo()
        //                    {
        //                        ElementName = Helper.GetDBValue(dr["ElementName"]),
        //                        ElementType = Helper.GetDBValue(dr["ElementType"]),
        //                        IsAutoElementName = Helper.ToBool(dr["IsAutoElementName"]),
        //                        IsPreviousYear = Helper.ToBool(dr["IsPreviousYear"]),
        //                        PreviousYearColumns = Helper.GetDBValue(dr["PreviousYearColumns"]),
        //                        RuleCondition = Helper.GetDBValue(dr["RuleCondition"]),
        //                        RuleName = Helper.GetDBValue(dr["RuleName"]),
        //                        RuleId = Helper.ToInt(dr["Id"])
        //                    });
        //                }

        //                return dictRules;
        //            }
        //        }

        //        return null;
        //    }
        //    catch (Exception ex)
        //    {
        //        return null;
        //    }
        //}
        public GenericRootObject LoadGenericRulesByKey(string dictKey)
        {
            GenericRootObject rootObject = this.dataAccess.LoadGenericRulesByKey(dictKey);
            return rootObject;
        }
        public bool InsertCompanyHeader(string CompanyName, string CompanyHeader )
        {
            try
            {
                this.dataAccess.InsertCompanyHeader(CompanyName, CompanyHeader);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool InsertCompany(string CompanyName)
        {
            try
            {
                this.dataAccess.InsertCompany(CompanyName);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
