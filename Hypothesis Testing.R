#Hypothesis Testing

#Test Data 
data1 = c(84, 86, 90, 97, 98, 98, 99, 102, 102, 103, 108, 111)
data2 = c(91, 95, 96, 96, 96, 97, 98, 101, 103, 105, 106, 123, 130, 143, 145)
Indep_test = data.frame(rbind(cbind(1, data1), cbind(2, data2)))
colnames(Indep_test) = c("Group", "Marks")
Dep_test = data.frame(cbind(1:8, c(59, 68, 60, 60, 59, 62, 58, 76), c(61, 78, 65, 56, 55, 62, 60, 68)))       #Two test marks for 8 students
colnames(Dep_test) = c("Student", "Test1", "Test2")


#Growth data
growth = data.frame(group = rep(c('A','B','C'), each = 10), ht = c(7,14,14,13,12,9,6,14,12,8,15,17,13,15,15,13,9,12,10,8,6,8,8,9,5,14,13,8,10,9))


#One Sample Tests
#-T-test (Parametric Test- Examines if the mean of a population is different from the known value or hypothesis)
#Tests Ho:mu = muo use the t.test() 

#Wilcoxon rank Test(Non-parametric) - test the hypothesis for the median
#wilcox.test()

#For both tests you need - x,y,alternative, mu, paired 

  #Example test if there is a significant difference between last year(mu = 56, median = 55)

    #a) Check Assumption of normality
      shapiro.test(Dep_test$Test1)
      #p-value = 0.009245 < 0.05, data is not normally distributed
      
      t.test(Dep_test$Test1, mu = 56, alternative = "greater")
      # p-value = 0.008946 < 0.05, reject Ho, there is suffucient evidence that the mean is greater than 56
      
      wilcox.test(Dep_test$Test1, median = 55,alternative = "greater", exact = FALSE)
      #p-value = 0.007015 < 0.05, reject Ho, there is sufficient evidence that the median is greater than 55
      
#Two Sample Test
      #T-test (Parametric Test): tests the difference in means beteween two independent variables
      #dependent ~ independent: use data= define the dataset
      
      #Mann Whitney U (Non parametric Test) - use wilcox.test() 
      
          #Example: create a summary for the two groups of the Indep test
          
          IndepStats = cbind(aggregate(Marks~Group, data = Indep_test, mean), 
                             aggregate(Marks~Group, data = Indep_test, median)[,2],
                             aggregate(Marks~Group, data = Indep_test, sd)[,2])
          colnames(IndepStats) = c("Group", "Mean", "Median", "St dev")
          IndepStats
          
          #Drawing a boxplot
          boxplot(Marks~Group, data = Indep_test, main = "Marks vs Group")
          
          
          #Checking parametric assumptions
          #Checkin normality for group 1 marks
          shapiro.test(Indep_test$Marks[Indep_test$Group == 1])
          #p-value = 0.6122 > 0.05 fail to reject, there is insufficient that the marks of group 1 are normally distributted
          
          #Checking group 2
          shapiro.test(Indep_test$Marks[Indep_test$Group == 2])
          #p-value = 0.002517 < 0.05, reject Ho, there is sufficient evidence that the marks of group 2 are normally distributed
          
          #Check if the variences of both groups are different
          var.test(Indep_test$Marks[Indep_test$Group == 1], Indep_test$Marks[Indep_test$Group == 2])
          #p-value = 0.0125 < 0.05, reject Ho, there is sufficient evidence that the variences are different
          
          
          
          #Perform the parameric and nonparametric tests
          #Parametric
          t.test(Marks~Group, data = Indep_test, var.equal = FALSE)
          #p-value = 0.06406 > 0.05, fail to reject Ho, there is insufficient evidence that the means of both groups are different
          
          #Non-parametric
          wilcox.test(Marks~Group, data = Indep_test, exact = FALSE)
          #p-value = 0.3924 > 0.05, FAIL TO reject Ho, there is insufficient evidence that tthe medians of the two groups is different
          

#Multiple Independent sample test
  #ANOVA- is a parametric test -  that tests the difference in means for three or more independent variables
          #test Ho: all means are equal,  H1: atleast one is different
              #aov(), use dependent~independent, data=, 
          
  #Kruskal-Wallis test - Non parametric test, the difference between medians of three or more independent variables
          #Test Ho: all medians are equal, H1: atleast one is different
            #kruskal.test(), 
  
  #These tests compare if there are two differences and not the whole set of variables, so we need a post-hoc test
          #For ANOVA we use TukeyHSD()
          #For Kruskal we use Bonferroni - pairwise.wilcox.test()
          
#Example          
    #Creata a summary of the data for the 3 growth fertilizers 
          boxplot(ht~group, data = growth, main = "Height vs Group", ylab = "height")
    
    #Check for normallity
          Normality = round(cbind(shapiro.test(growth$ht[growth$group == "A"])$p.value,
                                  shapiro.test(growth$ht[growth$group == "B"])$p.value,
                                  shapiro.test(growth$ht[growth$group == "C"])$p.value), 3)
          rownames(Normality) = "Shapiro Wilk P-Vlaue"
          colnames(Normality) = c("A", "B", "C")
          Normality
            #All p-values > 0.05 - all groups are possibly normally distributed 
          
          
    #Check for the quality of  the variences
         bartlett.test(ht~group, data = growth)
         #p.value = 0.9512 > 0.05 - fail to reject Ho, there is insufficient evidence that the 
         fligner.test(ht~group, data = growth)
         #p-value =0.838 > 0.05 - both bigger than 0.05 therefore the varience are equal
         
    #Performing the actual Parametric Test
         anova = aov(ht~group, data = growth)
          summary(anova)         
          TukeyHSD(anova)          
          #Reject the ANOVA null hypothesis
          
    #Performing the Non Parametric
          kwd = kruskal.test(ht~group, data = growth)
          kwd$p.value
          pairwise.wilcox.test(growth$ht, growth$group, p.adjust.method = "bonferroni")
          #Rejectthe null hypotehsis at 5% sig level
          