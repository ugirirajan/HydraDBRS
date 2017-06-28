﻿using HGarb.Infrastructure;
using HGarb.Models;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;
using System.IO;
using System.Xml;

namespace HGarb.DataAccess
{
    public class RulesConfig
    {
        public string ConnectionString { get; set; }
        private Microsoft.Practices.EnterpriseLibrary.Data.Database database;
        public RulesConfig()
        {
            this.ConnectionString = Helper.GetAppSetting("ConnectionString");
            this.database = new Microsoft.Practices.EnterpriseLibrary.Data.Sql.SqlDatabase(this.ConnectionString);
        }
        public DataSet LoadCompanies()
        {
            using (SqlConnection con = new SqlConnection(this.ConnectionString))
            {
                using (DbCommand cmd = this.database.GetSqlStringCommand("select distinct CompanyName from CompanyInfo"))
                {
                    return this.database.ExecuteDataSet(cmd);
                }
            }
        }
        public DataSet LoadCompanyHeaders(string companyName)
        {
            using (DbCommand cmd = this.database.GetSqlStringCommand("select Header from CompanyInfo where CompanyName = '" + companyName + "'"))
            {
                return this.database.ExecuteDataSet(cmd);
            }
        }

        public DataSet LoadStandardFieldNames(string companyHeader)
        {
            using (DbCommand cmd = this.database.GetSqlStringCommand("select distinct StandardFieldName from DataElement DE inner join IncomingFiles I on I.CompanyHeader = '" + companyHeader + "' where DE.StandardFieldName is not null and I.Id = DE.FileId"))
            {
                return this.database.ExecuteDataSet(cmd);
            }
        }

        public DataSet LoadGenericStandardFieldNames()
        {
            using (DbCommand cmd = this.database.GetSqlStringCommand("select distinct StandardFieldName from DataElement DE where DE.StandardFieldName is not null"))
            {
                return this.database.ExecuteDataSet(cmd);
            }
        }

        public void InsertRulesConfig(RulesInfo rulesInfo)
        {
            using (DbCommand cmd = this.database.GetStoredProcCommand("pInsertRuleConfig"))
            {
                this.database.AddInParameter(cmd, "@RuleName", DbType.String, rulesInfo.RuleName);
                this.database.AddInParameter(cmd, "@RuleCondition", DbType.String, rulesInfo.RuleCondition);
                this.database.AddInParameter(cmd, "@ElementName", DbType.String, rulesInfo.ElementName);
                this.database.AddInParameter(cmd, "@ElementType", DbType.String, rulesInfo.ElementType);
                this.database.AddInParameter(cmd, "@IsAutoElementName", DbType.Boolean, rulesInfo.IsAutoElementName);
                this.database.AddInParameter(cmd, "@IsPreviousYear", DbType.Boolean, rulesInfo.IsPreviousYear);
                this.database.AddInParameter(cmd, "@PreviousYearColumns", DbType.String, rulesInfo.PreviousYearColumns);
                this.database.AddInParameter(cmd, "@CompanyHeader", DbType.String, rulesInfo.CompanyHeader);
                this.database.AddInParameter(cmd, "@IsGenericRuleInherited", DbType.Boolean, rulesInfo.IsGenericRuleInherited);
                this.database.ExecuteNonQuery(cmd);
            }
        }

        public void InsertGenericRulesConfig(RulesInfo rulesInfo)
        {
            using (DbCommand cmd = this.database.GetStoredProcCommand("pInsertGenericRuleConfig"))
            {
                this.database.AddInParameter(cmd, "@AssetClass", DbType.String, rulesInfo.AssetClass);
                this.database.AddInParameter(cmd, "@RuleName", DbType.String, rulesInfo.RuleName);
                this.database.AddInParameter(cmd, "@RuleCondition", DbType.String, rulesInfo.RuleCondition);
                this.database.AddInParameter(cmd, "@ElementName", DbType.String, rulesInfo.ElementName);
                this.database.AddInParameter(cmd, "@ElementType", DbType.String, rulesInfo.ElementType);
                this.database.AddInParameter(cmd, "@IsAutoElementName", DbType.Boolean, rulesInfo.IsAutoElementName);
                this.database.AddInParameter(cmd, "@IsPreviousYear", DbType.Boolean, rulesInfo.IsPreviousYear);
                this.database.AddInParameter(cmd, "@PreviousYearColumns", DbType.String, rulesInfo.PreviousYearColumns);
                this.database.ExecuteNonQuery(cmd);
            }
        }
        public void InsertRulesConfigV1(RootObject rootObject)
        {
            using (DbCommand cmd = this.database.GetStoredProcCommand("pInsertRuleConfigV1"))
            {
                this.database.AddInParameter(cmd, "@RuleData", DbType.String, GetXMLFromObject(rootObject));
                this.database.AddInParameter(cmd, "@ElementName", DbType.String, rootObject.ElementName);
                this.database.AddInParameter(cmd, "@ElementType", DbType.String, rootObject.ElementType);
                this.database.AddInParameter(cmd, "@IsAutoElementName", DbType.Boolean, rootObject.IsAutoElementName);
                this.database.AddInParameter(cmd, "@CompanyName", DbType.String, rootObject.CompanyName);
                this.database.AddInParameter(cmd, "@CompanyHeader", DbType.String, rootObject.CompanyHeader);
                this.database.AddInParameter(cmd, "@IsGenericRuleInherited", DbType.Boolean, rootObject.IsGenericRuleInherited);
                try
                {


                    int records = this.database.ExecuteNonQuery(cmd);
                }
                catch(Exception ex)
                {

                }
            }
        }
        public void InsertGenericRulesConfigV1(GenericRootObject genericRootObject)
        {
            using (DbCommand cmd = this.database.GetStoredProcCommand("pInsertGenericRuleConfigV1"))
            {
                this.database.AddInParameter(cmd, "@AssetClass", DbType.String, genericRootObject.AssestClass);
                
                this.database.AddInParameter(cmd, "@RuleCondition", DbType.String, GetXMLFromObject(genericRootObject));
                this.database.AddInParameter(cmd, "@ElementName", DbType.String, genericRootObject.ElementName);
                this.database.AddInParameter(cmd, "@ElementType", DbType.String, genericRootObject.ElementType);
                this.database.AddInParameter(cmd, "@IsAutoElementName", DbType.Boolean, genericRootObject.IsAutoElementName);

                this.database.ExecuteNonQuery(cmd);
            }
        }
        public DataSet LoadRules(string companyHeader)
        {
            using (DbCommand cmd = this.database.GetSqlStringCommand("select * from RulesConfig where CompanyHeader = '" + companyHeader + "'"))
            {
                return this.database.ExecuteDataSet(cmd);
            }
        }
        public DataSet LoadGenericRules()
        {
            using (DbCommand cmd = this.database.GetSqlStringCommand("select * from GenericRulesConfig"))
            {
                return this.database.ExecuteDataSet(cmd);
            }
        }
        public DataSet LoadGenericRulesByKey(string dictKey)
        {
            string commandText = string.Format("select * from GenericRulesConfig where AssetClass = '{0}' ", dictKey);
            using (DbCommand cmd = this.database.GetSqlStringCommand(commandText))
            {
                return this.database.ExecuteDataSet(cmd);
            }
        }
        public GenericRootObject LoadGenericRulesByKeyV1(string dictKey)
        {
            string commandText = string.Format("select * from GenericRulesConfigV1 where AssetClass = '{0}' ", dictKey);
            // Have to handle null object response.
            GenericRootObject genericRootObject = null;
            using (DbCommand cmd = this.database.GetSqlStringCommand(commandText))
            {

                var reader = this.database.ExecuteReader(cmd);
                if(reader.Read())
                {
                    genericRootObject = (GenericRootObject)ObjectFromXML(reader["RuleData"].ToString(), typeof(GenericRootObject));
                }
                return genericRootObject;
            }
        }
        public DataSet LoadAssetClass()
        {
            string commandText = string.Format("select * from AssetClass");
            using (DbCommand cmd = this.database.GetSqlStringCommand(commandText))
            {
                return this.database.ExecuteDataSet(cmd);
            }
        }
        public static string GetXMLFromObject(object o)
        {
            StringWriter sw = new StringWriter();
            XmlTextWriter tw = null;
            try
            {
                XmlSerializer serializer = new XmlSerializer(o.GetType());
                tw = new XmlTextWriter(sw);
                serializer.Serialize(tw, o);
            }
            catch (Exception ex)
            {
                //Handle Exception Code
            }
            finally
            {
                sw.Close();
                if (tw != null)
                {
                    tw.Close();
                }
            }
            return sw.ToString();
        }
        public static Object ObjectFromXML(string xml, Type objectType)
        {
            StringReader strReader = null;
            XmlSerializer serializer = null;
            XmlTextReader xmlReader = null;
            Object obj = null;
            try
            {
                strReader = new StringReader(xml);
                serializer = new XmlSerializer(objectType);
                xmlReader = new XmlTextReader(strReader);
                obj = serializer.Deserialize(xmlReader);
            }
            catch (Exception exp)
            {
                //Handle Exception Code
            }
            finally
            {
                if (xmlReader != null)
                {
                    xmlReader.Close();
                }
                if (strReader != null)
                {
                    strReader.Close();
                }
            }
            return obj;
        }
    }
}