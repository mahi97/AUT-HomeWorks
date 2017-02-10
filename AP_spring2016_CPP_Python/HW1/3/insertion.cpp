#include "insertion.h"

Insertion::Insertion() 
{

}

void Insertion::execute() 
{
    int j{}, tmp{};

     for (int i{1}; i < m_numberVec.size(); i++)
     {
         j = i;
         tmp = m_numberVec[i];
         while ( (j > 0) && (tmp<m_numberVec[j-1]) )
         {
               m_numberVec[j] = m_numberVec[j-1];
               j--;
               setPlace(getPlace() + 1);
               setComparison(getComparison() + 1);
         }
         m_numberVec[j] = tmp;
     }

}
