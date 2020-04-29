//%attributes = {"invisible":true}
C_TEXT:C284($Txt_path)

SET ASSERT ENABLED:C1131(True:C214)

$Txt_path:=System folder:C487(Documents folder:K41:18)+"document.txt"
ASSERT:C1129(doc_getFromPath ("parent";$Txt_path)=System folder:C487(Documents folder:K41:18))
ASSERT:C1129(doc_getFromPath ("fullName";$Txt_path)="document.txt")
ASSERT:C1129(doc_getFromPath ("shortName";$Txt_path)="document")
ASSERT:C1129(doc_getFromPath ("extension";$Txt_path)="txt")

$Txt_path:=System folder:C487(Documents folder:K41:18)+"document.tar.gz"
ASSERT:C1129(doc_getFromPath ("parent";$Txt_path)=System folder:C487(Documents folder:K41:18))
ASSERT:C1129(doc_getFromPath ("fullName";$Txt_path)="document.tar.gz")
ASSERT:C1129(doc_getFromPath ("shortName";$Txt_path)="document.tar")
ASSERT:C1129(doc_getFromPath ("extension";$Txt_path)="gz")

$Txt_path:=System folder:C487(Documents folder:K41:18)+".document.sparseimage"
ASSERT:C1129(doc_getFromPath ("parent";$Txt_path)=System folder:C487(Documents folder:K41:18))
ASSERT:C1129(doc_getFromPath ("fullName";$Txt_path)=".document.sparseimage")
ASSERT:C1129(doc_getFromPath ("shortName";$Txt_path)=".document")
ASSERT:C1129(doc_getFromPath ("extension";$Txt_path)="sparseimage")

ASSERT:C1129(doc_getFromPath ("parent";"")="")
ASSERT:C1129(doc_getFromPath ("fullName";"")="")
ASSERT:C1129(doc_getFromPath ("shortName";"")="")
ASSERT:C1129(doc_getFromPath ("extension";"")="")

ASSERT:C1129(doc_getFromPath ("parent";"file.txt")="")
ASSERT:C1129(doc_getFromPath ("fullName";"file.txt")="file.txt")
ASSERT:C1129(doc_getFromPath ("shortName";"file.txt")="file")
ASSERT:C1129(doc_getFromPath ("extension";"file.txt")="txt")

ASSERT:C1129(doc_volumeName ("C:\\folder\\subfolder\\file.txt")="C:")
ASSERT:C1129(doc_volumeName ("hardrive:folder:file.txt")="hardrive")
ASSERT:C1129(doc_volumeName ("ENGINEERING:Products:Compiled sur Srv-4D")="ENGINEERING")
ASSERT:C1129(doc_volumeName ("\\\\Srv-4d\\tempo\\vdl\\Jean")="Srv-4d")

ASSERT:C1129(doc_volumeName ("")="")
ASSERT:C1129(doc_volumeName ("file.txt")="")


