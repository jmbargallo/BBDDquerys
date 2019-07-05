/*
*********************
*Exercici querys SQl*
*********************
*/


/* 
************************************************
*1. Quantitat de registres de la taula de vols:*
************************************************
*/


SELECT count(*) FROM usairlineflights2.flights 



/*
******************************************************************
* 2.Retard promig de sortida i arribada segons l’aeroport origen.*
******************************************************************
*/

SELECT origin,avg(ArrDelay),avg(DepDelay) FROM usairlineflights2.flights group by origin;



/*
*******************************************************************************
* 3. Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen.*
* A més, volen que els resultat es mostrin de la següent forma                *
* (fixa’t en l’ordre de les files):                                           *
* Resultat:                                                                   *
*******************************************************************************
*/

SELECT Origin,colYear,colMonth,avg(ArrDelay) as prom_arribades FROM usairlineflights2.flights
 group by origin,colMonth,colYear order by origin,colYear;

/*
**********************************************************************************************
* 4. Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen                *
* (mateixa consulta que abans i amb el mateix ordre).                                        *
*  Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat.*
* Resultat:                                                                                  *
**********************************************************************************************
*/

SELECT City, colYear,colMonth, avg(ArrDelay) frOM usairlineflights2.usairports,usairlineflights2.flights  where iata=origin 
group by City,colYear,colMonth order by  city,colYear,colMonth ;


/*
****************************************************************************************
* 5.Les companyies amb més vols cancelats,per mesos i any. A més, han d’estar ordenades*
* de forma que les companyies amb més cancel·lacions apareguin les primeres.           *
****************************************************************************************
 */
 
 SELECT UniqueCarrier, colYear, colMonth, avg(ArrDelay),sum(Cancelled) FROM usairlineflights2.flights group by UniqueCarrier,colYear,colMonth
 having sum(cancelled)>0 order by colMonth, colYear desc;
 
 /* 
 *****************************************************************************
 * 6.identificador dels 10 avions que més distància han recorregut fent vols.*
 *****************************************************************************
*/
SELECT TailNum,sum(Distance) FROM usairlineflights2.flights group by TailNum
order by sum(Distance) desc limit 1,10;

/* 
*******************************************************************************************************
* 7. Companyies amb el seu retard promig només d’aquelles les quals els seus vols arriben al seu destí*
* amb un retràs promig major de 10 minuts.                                                            *
*******************************************************************************************************
*/

SELECT UniqueCarrier,avg(arrDelay) AVGdelay FROM usairlineflights2.flights
group by UniqueCarrier having avg(ArrDelay)>10 order by AVGdelay desc;


