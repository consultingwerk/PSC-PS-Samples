/**********************************************************************
 * Copyright (C) 2006-2016 by Consultingwerk Ltd. ("CW") -            *
 * www.consultingwerk.de and other contributors as listed             *
 * below.  All Rights Reserved.                                       *
 *                                                                    *
 *  Software is distributed on an "AS IS", WITHOUT WARRANTY OF ANY    *
 *   KIND, either express or implied.                                 *
 *                                                                    *
 *  Contributors:                                                     *
 *                                                                    *
 **********************************************************************/
/*------------------------------------------------------------------------
    File        : DemoDownloadAttachmentController
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : Sun Feb 05 07:29:15 CET 2017
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.Assertion.*                            FROM PROPATH .
USING Consultingwerk.SmartComponentsDemo.Web2.Attachments.* FROM PROPATH .
USING Consultingwerk.SmartFramework.System.*                FROM PROPATH .
USING Consultingwerk.Util.*                                 FROM PROPATH .
USING Progress.Lang.*                                       FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.Web2.Attachments.DemoDownloadAttachmentController
    IMPLEMENTS IDownloadAttachmentController:

    /**
     * Purpose: Returns if the user is allowed to download the attachment (authorization)
     * Notes:
     * @param poAttachment The SmartAttachmentTableModel with the attachment record
     * @return Logical value indicating if the request is authorized
     */
    METHOD PUBLIC LOGICAL CanDownloadAttachment (poAttachment AS SmartAttachmentTableModel):

        RETURN TRUE .

    END METHOD .

    /**
     * Purpose: Returns the TableGUID and record key values required
     *          to query for attachments in the SmartDB
     * Notes:   Needs to translate the values provided by the requestor
     *          into the key values stored in the SmartAttachment table
     * @param pcTable The table name as provided by the requestor
     * @param pcKeyValues The key values as provided by the requestor
     * @return The AttachmentKeyValueParameter instance with the SmartAttachment key values
     */
    METHOD PUBLIC AttachmentKeyValueParameter GetAttachmentKeyValues (pcTable AS CHARACTER,
                                                                      pcKeyValues AS CHARACTER):

        DEFINE VARIABLE oTable   AS TableDatasetModel NO-UNDO .
        DEFINE VARIABLE iCustNum AS INTEGER           NO-UNDO .

        CASE pcTable:
            WHEN "Customer":U THEN DO:

                oTable = NEW TableDatasetModel () .
                oTable:SmartTable:Filter:DatabaseName:EQ ("sports2000":U) .
                oTable:SmartTable:Filter:TableName:EQ (pcTable):Run () .

                BufferAssert:IsAvailable (oTable:SmartTable) .

                iCustNum = DataTypeHelper:ToInteger (pcKeyValues) .

                Assert:GE (iCustNum, 0) .

                RETURN NEW AttachmentKeyValueParameter(oTable:SmartTable:TableGUID,
                                                       STRING (iCustNum, "999999999":U)) .
            END.
        END CASE .

        UNDO, THROW NEW Consultingwerk.Exceptions.NotImplementedException (PROGRAM-NAME (1)) .

    END METHOD .

END CLASS.
