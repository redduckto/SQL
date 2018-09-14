USE ProjectDatabaseSON
GO

CREATE TRIGGER PostlayanSayfaUyesiOlmali ON POST
AFTER INSERT
AS
BEGIN
	DECLARE @postedBy varchar(50)
	SET @postedBy = (SELECT i.Gonderen FROM inserted i)

	DECLARE @postedTo varchar(50)
	SET @postedTo = (SELECT i.Gonderilen FROM inserted i)

	IF NOT EXISTS(SELECT ProfileID FROM SAYFA_UYELERI
				WHERE @postedBy=ProfileID AND @postedTo=PageID)
	Begin
		Rollback
		PRINT 'POST YAPMAK ICIN SAYFAYA UYE OLUNMALI!'
	End
END
				
