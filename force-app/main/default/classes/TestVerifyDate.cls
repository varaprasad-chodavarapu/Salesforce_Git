@IsTest
public class TestVerifyDate 
{
     @isTest static void WithIn30Days() {
         //this should return feb 24 because with in 30 days
         Date retdate1=VerifyDate.CheckDates(date.valueOf('2022-01-12'),date.valueOf('2022-01-22'));
         System.assertEquals(date.valueOf('2022-01-22'),retdate1);
    }
	@isTest static void WithInNext30Days() {
         //this should return end of month date  because with in not 30 days.
           Date retdate2=VerifyDate.CheckDates(date.valueOf('2022-01-12'),date.valueOf('2022-02-13'));
         System.assertEquals(date.valueOf('2022-01-31'),retdate2);
    }
}