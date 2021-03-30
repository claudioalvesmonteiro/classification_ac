


library(readr)
library(ggplot2)

# imprt data
results_cv <- read_csv("results/results_cv.csv")
importance <- read_csv("results/feature_importance.csv")


#=================================
# vis
#================================

### ACCURACY
ggplot(data=results_cv, aes(x=model, y=test_accuracy_score, fill=model)) +
  geom_boxplot() +
  scale_fill_viridis_d() +
  scale_y_continuous(limits = c(0, 1))+
  #geom_jitter(color="black", size=0.4, alpha=0.9) +
  theme_minimal() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11, face='plain'),
    axis.text.x = element_text(size=8,
                               angle = 13, 
                               hjust=0.5,
                               vjust=1,
                               face="plain")
  ) #+ labs(x=xname, y=yname, title=title)
ggsave('results/accuracy_plot.png', height = 6, width = 6, units = 'in')

### AUC-ROC
ggplot(data=results_cv, aes(x=model, y=test_roc_auc_score, fill=model)) +
  geom_boxplot() +
  scale_fill_viridis_d() +
  scale_y_continuous(limits = c(0, 1))+
  #geom_jitter(color="black", size=0.4, alpha=0.9) +
  theme_minimal() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11, face='plain'),
    axis.text.x = element_text(size=8,
                               angle = 13, 
                               hjust=0.5,
                               vjust=1,
                               face="plain")
  ) #+ labs(x=xname, y=yname, title=title)
ggsave('results/roc_auc_plot.png', height = 6, width = 6, units = 'in')


### feature importance
ggplot(data=importance, aes(x=feature, y=importance)) +
  geom_bar(stat = 'identity') +
  #scale_fill_viridis_d() +
  #scale_y_continuous(limits = c(0, 1))+
  #geom_jitter(color="black", size=0.4, alpha=0.9) +
  theme_minimal() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11, face='plain'),
    axis.text.x = element_text(size=8,
                               angle = 13, 
                               hjust=0.5,
                               vjust=1,
                               face="plain")
  ) #+ labs(x=xname, y=yname, title=title)
ggsave('results/roc_auc_plot.png', height = 6, width = 6, units = 'in')

