import seaborn as sns
import matplotlib.pyplot as plt

tips = sns.load_dataset("tips")
sns.catplot(x="day", y="total_bill", data=tips)
sns.catplot(x="day", y="total_bill", kind="swarm", data=tips)