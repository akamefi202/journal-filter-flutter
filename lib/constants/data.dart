const topics = [
  {"name": "General Cardiology", "url": "&topic=General+Cardiology"},
  {"name": "Electrophysiology", "url": "&topic=Electrophysiology"},
  {"name": "Intervention", "url": "&topic=Intervention"},
  {"name": "Imaging", "url": "&topic=Imaging"},
  {"name": "Congenital", "url": "&topic=Congenital"},
  {"name": "Heart Failure", "url": "&topic=Heart+Failure"},
  {"name": "Basic Research", "url": "&topic=Basic+Research"},
  {"name": "Cardiogenetics", "url": "&topic=Cardiogenetics"},
  {"name": "Journal Club Selection", "url": "&topic=JCS"}
];
const journals = [
  {"name": "N Engl J Med", "url": "&journal=N+Engl+J+Med"},
  {"name": "J Am Coll Cardiol", "url": "&journal=J+Am+Coll+Cardiol"},
  {"name": "Eur Heart J", "url": "&journal=Eur+Heart+J"},
  {"name": "Circulation", "url": "&journal=Circulation"},
  {"name": "Lancet", "url": "&journal=Lancet"},
  {"name": "PLoS Med", "url": "&journal=PLoS+Med"},
  {"name": "Ann Intern Med", "url": "&journal=Ann+Intern+Med"},
  {"name": "Heart", "url": "&journal=Heart"},
  {"name": "Cardiovasc Res", "url": "&journal=Cardiovasc+Res"},
  {"name": "Circ Res", "url": "&journal=Circ+Res"},
  {"name": "BMJ", "url": "&journal=BMJ"},
  {"name": "JAMA", "url": "&journal=JAMA"},
  {"name": "Nat Med", "url": "&journal=Nat+Med"},
  {"name": "Circ Arrhythm Electrophysiol", "url": "&journal=Circ+Arrhythm+Electrophysiol"},
  {"name": "Am J Cardiol", "url": "&journal=Am+J+Cardiol"},
  {"name": "Am Heart J", "url": "&journal=Am+Heart+J"},
  {"name": "Heart Rhythm", "url": "&journal=Heart+Rhythm"},
  {"name": "Catheter Cardiovasc Interv", "url": "&journal=Catheter+Cardiovasc+Interv"},
  {"name": "Circ Cardiovasc Genet", "url": "&journal=Circ+Cardiovasc+Genet"},
  {"name": "Circ Cardiovasc Interv", "url": "&journal=Circ+Cardiovasc+Interv"},
  {"name": "J Am Soc Echocardiogr", "url": "&journal=J+Am+Soc+Echocardiogr"},
  {"name": "Eur J Heart Fail", "url": "&journal=Eur+J+Heart+Fail"},
  {"name": "Circ Heart Fail", "url": "&journal=Circ+Heart+Fail"},
  {"name": "Int J Cardiol", "url": "&journal=Int+J+Cardiol"},
  {"name": "J Cardiovasc Electrophysiol", "url": "&journal=J+Cardiovasc+Electrophysiol"},
  {"name": "J Card Fail", "url": "&journal=J+Card+Fail"},
  {"name": "Europace", "url": "&journal=Europace"},
  {"name": "Circ Cardiovasc Imaging", "url": "&journal=Circ+Cardiovasc+Imaging"},
  {"name": "J Nucl Cardiol", "url": "&journal=J+Nucl+Cardiol"},
  {"name": "J Am Heart Assoc", "url": "&journal=J+Am+Heart+Assoc"},
  {"name": "J Stroke", "url": "&journal=J+Stroke"},
  {"name": "Eur J Prev Cardiol", "url": "&journal=Eur+J+Prev+Cardiol"},
  {"name": "JACC Cardiovasc Interv", "url": "&journal=JACC+Cardiovasc+Interv"},
  {"name": "JACC Cardiovasc Imaging", "url": "&journal=JACC+Cardiovasc+Imaging"},
  {"name": "Eur Heart J Cardiovasc Imaging", "url": "&journal=Eur+Heart+J+Cardiovasc+Imaging"},
  {"name": "J Thorac Cardiovasc Surg", "url": "&journal=J+Thorac+Cardiovasc+Surg"},
  {"name": "EuroIntervention", "url": "&journal=EuroIntervention"},
  {"name": "Resuscitation", "url": "&journal=Resuscitation"},
  {"name": "Prog Cardiovasc Dis", "url": "&journal=Prog+Cardiovasc+Dis"},
  {"name": "JAMA Cardiol", "url": "&journal=JAMA+Cardiol"},
  {"name": "Eur Heart J Cardiovasc Pharmacother", "url": "&journal=Eur+Heart+J+Cardiovasc+Pharmacother"},
  {"name": "J Heart Lung Transplant", "url": "&journal=J+Heart+Lung+Transplant"},
  {"name": "J Cereb Blood Flow Metab", "url": "&journal=J+Cereb+Blood+Flow+Metab"},
  {"name": "J Cardiovasc Magn Reson", "url": "&journal=J+Cardiovasc+Magn+Reson"},
  {"name": "Circ Cardiovasc Qual Outcomes", "url": "&journal=Circ+Cardiovasc+Qual+Outcomes"},
  {"name": "Eur Heart J Acute Cardiovasc Care", "url": "&journal=Eur+Heart+J+Acute+Cardiovasc+Care"},
  {"name": "Cardiovasc Diabetol", "url": "&journal=Cardiovasc+Diabetol"},
  {"name": "JACC Heart Fail", "url": "&journal=JACC+Heart+Fail"},
  {"name": "J Mol Cell Cardiol", "url": "&journal=J+Mol+Cell+Cardiol"},
  {"name": "Clin Res Cardiol", "url": "&journal=Clin+Res+Cardiol"}
];
const books = [
  {
    "title": "Once-Weekly Semaglutide in Adults with Overweight or Obesity.",
    "postman": "Wilding JPH, Batterham RL, Calanna S, Davies M, ... Kushner RF, STEP 1 Study Group",
    "contents":
        "<b>Background</b><br />Obesity is a global health challenge with few pharmacologic options. Whether adults with obesity can achieve weight loss with once-weekly semaglutide at a dose of 2.4 mg as an adjunct to lifestyle intervention has not been confirmed.<br /><b>Methods</b><br />In this double-blind trial, we enrolled 1961 adults with a body-mass index (the weight in kilograms divided by the square of the height in meters) of 30 or greater (≥27 in persons with ≥1 weight-related coexisting condition), who did not have diabetes, and randomly assigned them, in a 2:1 ratio, to 68 weeks of treatment with once-weekly subcutaneous semaglutide (at a dose of 2.4 mg) or placebo, plus lifestyle intervention. The coprimary end points were the percentage change in body weight and weight reduction of at least 5%. The primary estimand (a precise description of the treatment effect reflecting the objective of the clinical trial) assessed effects regardless of treatment discontinuation or rescue interventions.<br /><b>Results</b><br />The mean change in body weight from baseline to week 68 was -14.9% in the semaglutide group as compared with -2.4% with placebo, for an estimated treatment difference of -12.4 percentage points (95% confidence interval [CI], -13.4 to -11.5; P&lt;0.001). More participants in the semaglutide group than in the placebo group achieved weight reductions of 5% or more (1047 participants [86.4%] vs. 182 [31.5%]), 10% or more (838 [69.1%] vs. 69 [12.0%]), and 15% or more (612 [50.5%] vs. 28 [4.9%]) at week 68 (P&lt;0.001 for all three comparisons of odds). The change in body weight from baseline to week 68 was -15.3 kg in the semaglutide group as compared with -2.6 kg in the placebo group (estimated treatment difference, -12.7 kg; 95% CI, -13.7 to -11.7). Participants who received semaglutide had a greater improvement with respect to cardiometabolic risk factors and a greater increase in participant-reported physical functioning from baseline than those who received placebo. Nausea and diarrhea were the most common adverse events with semaglutide; they were typically transient and mild-to-moderate in severity and subsided with time. More participants in the semaglutide group than in the placebo group discontinued treatment owing to gastrointestinal events (59 [4.5%] vs. 5 [0.8%]).<br /><b>Conclusions</b><br />In participants with overweight or obesity, 2.4 mg of semaglutide once weekly plus lifestyle intervention was associated with sustained, clinically relevant reduction in body weight. (Funded by Novo Nordisk; STEP 1 ClinicalTrials.gov number, NCT03548935).<br /><br />Copyright © 2021 Massachusetts Medical Society.",
    "info": "N Engl J Med: 09 Feb 2021; epub ahead of print",
    "link": {
      "mainlink":
          "http://www.journalfilter.com/fw.php?pmid=33567185&pmhash=GaBd3rWj0SvvQ&target=http://dx.doi.org/10.1056/NEJMoa2032183",
      "pdf":
          "<a href='http://www.journalfilter.com/fw.php?pmid=33567185&pmhash=GaaKuPsbFhpu.&target=dx.doi.org/10.1056/NEJMoa2032183' target='_blank' title='Direct link to the PDF'>PDF</a>",
      "doi":
          "http://www.journalfilter.com/fw.php?pmid=33567185&pmhash=GaBd3rWj0SvvQ&target=http://dx.doi.org/10.1056/NEJMoa2032183",
      "google":
          "http://www.journalfilter.com/fw.php?pmid=33567185&pmhash=GavqUhdxcADdM&target=scholar.google.com/scholar?as_q=Once+Weekly+Semaglutide+Adults+with+Overweight+Obesity+&as_sauthors=\"Wilding+JPH\"",
      "pub":
          "http://www.journalfilter.com/fw.php?pmid=33567185&pmhash=GagoiF6/44zqk&target=http://www.ncbi.nlm.nih.gov/pubmed/33567185?dopt=Abstract"
    },
    "star": 0.5612,
    "article_id": "33567185"
  },
  {
    "title": "Glycemic Index, Glycemic Load, and Cardiovascular Disease and Mortality.",
    "postman": "Jenkins DJA, Dehghan M, Mente A, Bangdiwala SI, ... Yusuf S, PURE Study Investigators",
    "contents":
        "<b>Background</b><br />Most data regarding the association between the glycemic index and cardiovascular disease come from high-income Western populations, with little information from non-Western countries with low or middle incomes. To fill this gap, data are needed from a large, geographically diverse population.<br /><b>Methods</b><br />This analysis includes 137,851 participants between the ages of 35 and 70 years living on five continents, with a median follow-up of 9.5 years. We used country-specific food-frequency questionnaires to determine dietary intake and estimated the glycemic index and glycemic load on the basis of the consumption of seven categories of carbohydrate foods. We calculated hazard ratios using multivariable Cox frailty models. The primary outcome was a composite of a major cardiovascular event (cardiovascular death, nonfatal myocardial infarction, stroke, and heart failure) or death from any cause.<br /><b>Results</b><br />In the study population, 8780 deaths and 8252 major cardiovascular events occurred during the follow-up period. After performing extensive adjustments comparing the lowest and highest glycemic-index quintiles, we found that a diet with a high glycemic index was associated with an increased risk of a major cardiovascular event or death, both among participants with preexisting cardiovascular disease (hazard ratio, 1.51; 95% confidence interval [CI], 1.25 to 1.82) and among those without such disease (hazard ratio, 1.21; 95% CI, 1.11 to 1.34). Among the components of the primary outcome, a high glycemic index was also associated with an increased risk of death from cardiovascular causes. The results with respect to glycemic load were similar to the findings regarding the glycemic index among the participants with cardiovascular disease at baseline, but the association was not significant among those without preexisting cardiovascular disease.<br /><b>Conclusions</b><br />In this study, a diet with a high glycemic index was associated with an increased risk of cardiovascular disease and death. (Funded by the Population Health Research Institute and others.).<br /><br />Copyright © 2021 Massachusetts Medical Society.",
    "info": "N Engl J Med: 23 Feb 2021; epub ahead of print",
    "link": {
      "mainlink":
          "http://www.journalfilter.com/fw.php?pmid=33626252&pmhash=GaBd3rWj0SvvQ&target=http://dx.doi.org/10.1056/NEJMoa2007123",
      "pdf":
          "<a href='http://www.journalfilter.com/fw.php?pmid=33626252&pmhash=GaaKuPsbFhpu.&target=dx.doi.org/10.1056/NEJMoa2007123' target='_blank' title='Direct link to the PDF'>PDF</a>",
      "doi":
          "http://www.journalfilter.com/fw.php?pmid=33626252&pmhash=GaBd3rWj0SvvQ&target=http://dx.doi.org/10.1056/NEJMoa2007123",
      "google":
          "http://www.journalfilter.com/fw.php?pmid=33626252&pmhash=GavqUhdxcADdM&target=scholar.google.com/scholar?as_q=Glycemic+Index+Glycemic+Load+Cardiovascular+Disease+Mortality+&as_sauthors=\"Jenkins+DJA\"",
      "pub":
          "http://www.journalfilter.com/fw.php?pmid=33626252&pmhash=GagoiF6/44zqk&target=http://www.ncbi.nlm.nih.gov/pubmed/33626252?dopt=Abstract"
    },
    "star": 0.51105,
    "article_id": "33626252"
  },
  {
    "title":
        "Prognostic Implications of Declining Hemoglobin Content in Patients Hospitalized With Acute Coronary Syndromes.",
    "postman": "Leonardi S, Gragnano F, Carrara G, Gargiulo G, ... Windecker S, Valgimigli M",
    "contents":
        "<b>Background</b><br />Contemporary definitions of bleeding endpoints are restricted mostly to clinically overt events. Whether hemoglobin drop per se, with or without overt bleeding, adversely affects the prognosis of patients with acute coronary syndrome (ACS) remains unclear.<br /><b>Objectives</b><br />The aim of this study was to examine in the MATRIX (Minimizing Adverse Haemorrhagic Events by Transradial Access Site and Systemic Implementation of Angiox) trial the incidence, predictors, and prognostic implications of in-hospital hemoglobin drop in patients with ACS managed invasively stratified by the presence of in-hospital bleeding.<br /><b>Methods</b><br />Patients were categorized by the presence and amount of in-hospital hemoglobin drop on the basis of baseline and nadir hemoglobin values and further stratified by the occurrence of adjudicated in-hospital bleeding. Hemoglobin drop was defined as minimal (&lt;3 g/dl), minor (≥3 and &lt;5 g/dl), or major (≥5 g/dl). Using multivariate Cox regression, we modeled the association between hemoglobin drop and mortality in patients with and without overt bleeding.<br /><b>Results</b><br />Among 7,781 patients alive 24 h after randomization with available hemoglobin data, 6,504 patients (83.6%) had hemoglobin drop, of whom 5,756 (88.5%) did not have overt bleeding and 748 (11.5%) had overt bleeding. Among patients without overt bleeding, minor (hazard ratio [HR]: 2.37; 95% confidence interval [CI]: 1.32 to 4.24; p = 0.004) and major (HR: 2.58; 95% CI: 0.98 to 6.78; p = 0.054) hemoglobin drop were independently associated with higher 1-year mortality. Among patients with overt bleeding, the association of minor and major hemoglobin drop with 1-year mortality was directionally similar but had wider CIs (minor: HR: 3.53 [95% CI: 1.06 to 11.79]; major: HR: 13.32 [95% CI: 3.01 to 58.98]).<br /><b>Conclusions</b><br />Among patients with ACS managed invasively, in-hospital hemoglobin drop ≥3 g/dl, even in the absence of overt bleeding, is common and is independently associated with increased risk for 1-year mortality. (Minimizing Adverse Haemorrhagic Events by Transradial Access Site and Systemic Implementation of Angiox; NCT01433627).<br /><br />Copyright © 2021 American College of Cardiology Foundation. Published by Elsevier Inc. All rights reserved.",
    "info": "J Am Coll Cardiol: 01 Mar 2021; 77:375-388",
    "link": {
      "mainlink":
          "http://www.journalfilter.com/fw.php?pmid=33509394&pmhash=GaBd3rWj0SvvQ&target=http://dx.doi.org/10.1016/j.jacc.2020.11.046",
      "pdf":
          "<a href='http://www.journalfilter.com/fw.php?pmid=33509394&pmhash=GaaKuPsbFhpu.&target=dx.doi.org/10.1016/j.jacc.2020.11.046' target='_blank' title='Direct link to the PDF'>PDF</a>",
      "doi":
          "http://www.journalfilter.com/fw.php?pmid=33509394&pmhash=GaBd3rWj0SvvQ&target=http://dx.doi.org/10.1016/j.jacc.2020.11.046",
      "google":
          "http://www.journalfilter.com/fw.php?pmid=33509394&pmhash=GavqUhdxcADdM&target=scholar.google.com/scholar?as_q=Prognostic+Implications+Declining+Hemoglobin+Content+Patients+Hospitalized+With+Acute+Coronary%C2%A0Syndromes+&as_sauthors=\"Leonardi+S\"",
      "pub":
          "http://www.journalfilter.com/fw.php?pmid=33509394&pmhash=GagoiF6/44zqk&target=http://www.ncbi.nlm.nih.gov/pubmed/33509394?dopt=Abstract"
    },
    "star": 0.49255,
    "article_id": "33509394"
  },
  {
    "title": "Pre-Diabetes Increases Stroke Risk in Patients With Nonvalvular Atrial Fibrillation.",
    "postman": "Kezerle L, Tsadok MA, Akriv A, Senderey AB, ... Leventer-Roberts M, Haim M",
    "contents":
        "<b>Background</b><br />Diabetes mellitus (DM) increases the risk of embolism in nonvalvular atrial fibrillation (NVAF). The association between pre-diabetes and risk of ischemic stroke has not been studied separately in this population.<br /><b>Objectives</b><br />The purpose of this study was to evaluate whether pre-diabetes is associated with increased risk of stroke and death in patients with NVAF.<br /><b>Methods</b><br />We conducted a historical cohort study using the Clalit Health Services electronic medical records. The study population included all members aged ≥25 years, with a first diagnosis of NVAF between January 1, 2010, and December 31, 2016. We compared 3 groups of individuals: those with pre-diabetes, those with diabetes, and normoglycemic patients.<br /><b>Results</b><br />A total of 44,451 cases were identified. The median age was 75 years, and 52.5% were women. During a mean follow-up of 38 months, the incidence rates of stroke (per 100 person-years) were: 1.14 in normoglycemic individuals, 1.40 in those with pre-diabetes, and 2.15 in those with diabetes. In both univariate and multivariate analyses, pre-diabetes was associated with an increased risk of stroke compared with normoglycemic persons (adjusted hazard ratio [adjHR]: 1.19; 95% confidence interval [CI]: 1.01 to 1.4) even after adjustment for CHA<sub>2</sub>DS<sub>2</sub>-Vasc risk factors and use of anticoagulants, while diabetes conferred an even higher risk (vs. normoglycemia (adjHR: 1.56; 95% CI: 1.37 to 1.79). The risk for mortality was higher for individuals with diabetes (adjHR: 1.47; 95% CI: 1.41 to 1.54) but not for those with pre-diabetes (adjHR: 0.98; 95% CI: 0.92 to 1.03).<br /><b>Conclusions</b><br />In this cohort of patients with incident NVAF, pre-diabetes was associated with an increased risk of stroke even after accounting for other recognized risk factors.<br /><br />Copyright © 2021 American College of Cardiology Foundation. Published by Elsevier Inc. All rights reserved.",
    "info": "J Am Coll Cardiol: 22 Feb 2021; 77:875-884",
    "link": {
      "mainlink":
          "http://www.journalfilter.com/fw.php?pmid=33602470&pmhash=GaBd3rWj0SvvQ&target=http://dx.doi.org/10.1016/j.jacc.2020.12.030",
      "pdf":
          "<a href='http://www.journalfilter.com/fw.php?pmid=33602470&pmhash=GaaKuPsbFhpu.&target=dx.doi.org/10.1016/j.jacc.2020.12.030' target='_blank' title='Direct link to the PDF'>PDF</a>",
      "doi":
          "http://www.journalfilter.com/fw.php?pmid=33602470&pmhash=GaBd3rWj0SvvQ&target=http://dx.doi.org/10.1016/j.jacc.2020.12.030",
      "google":
          "http://www.journalfilter.com/fw.php?pmid=33602470&pmhash=GavqUhdxcADdM&target=scholar.google.com/scholar?as_q=Pre+Diabetes+Increases+Stroke+Risk%C2%A0in%C2%A0Patients+With+Nonvalvular+Atrial%C2%A0Fibrillation+&as_sauthors=\"Kezerle+L\"",
      "pub":
          "http://www.journalfilter.com/fw.php?pmid=33602470&pmhash=GagoiF6/44zqk&target=http://www.ncbi.nlm.nih.gov/pubmed/33602470?dopt=Abstract"
    },
    "star": 0.46485,
    "article_id": "33602470"
  },
  {
    "title":
        "The effect of spironolactone on cardiovascular function and markers of fibrosis in people at increased risk of developing heart failure: the heart 'OMics' in AGEing (HOMAGE) randomized clinical trial.",
    "postman":
        "Cleland JGF, Ferreira JP, Mariottoni B, Pellicori P, ... Zannad F, HOMAGE Trial Committees and Investigators\n",
    "contents":
        "<b>Aims </b><br />To investigate the effects of spironolactone on fibrosis and cardiac function in people at increased risk of developing heart failure.<br /><b>Methods and results </b><br />Randomized, open-label, blinded-endpoint trial comparing spironolactone (50 mg/day) or control for up to 9 months in people with, or at high risk of, coronary disease and raised plasma B-type natriuretic peptides. The primary endpoint was the interaction between baseline serum galectin-3 and changes in serum procollagen type-III N-terminal pro-peptide (PIIINP) in participants assigned to spironolactone or control. Procollagen type-I C-terminal pro-peptide (PICP) and collagen type-1 C-terminal telopeptide (CITP), reflecting synthesis and degradation of type-I collagen, were also measured. In 527 participants (median age 73 years, 26% women), changes in PIIINP were similar for spironolactone and control [mean difference (mdiff): -0.15; 95% confidence interval (CI) -0.44 to 0.15 μg/L; P = 0.32] but those receiving spironolactone had greater reductions in PICP (mdiff: -8.1; 95% CI -11.9 to -4.3 μg/L; P &lt; 0.0001) and PICP/CITP ratio (mdiff: -2.9; 95% CI -4.3 to -1.5; &lt;0.0001). No interactions with serum galectin were observed. Systolic blood pressure (mdiff: -10; 95% CI -13 to -7 mmHg; P &lt; 0.0001), left atrial volume (mdiff: -1; 95% CI -2 to 0 mL/m2; P = 0.010), and NT-proBNP (mdiff: -57; 95% CI -81 to -33 ng/L; P &lt; 0.0001) were reduced in those assigned spironolactone.<br /><b>Conclusions </b><br />Galectin-3 did not identify greater reductions in serum concentrations of collagen biomarkers in response to spironolactone. However, spironolactone may influence type-I collagen metabolism. Whether spironolactone can delay or prevent progression to symptomatic heart failure should be investigated.<br /><br />© The Author(s) 2020. Published by Oxford University Press on behalf of the European Society of Cardiology.",
    "info": "Eur Heart J: 10 Feb 2021; 42:684-696",
    "link": {
      "mainlink":
          "http://www.journalfilter.com/fw.php?pmid=33215209&pmhash=GaBd3rWj0SvvQ&target=http://dx.doi.org/10.1093/eurheartj/ehaa758",
      "pdf":
          "<a href='http://www.journalfilter.com/fw.php?pmid=33215209&pmhash=GaaKuPsbFhpu.&target=dx.doi.org/10.1093/eurheartj/ehaa758' target='_blank' title='Direct link to the PDF'>PDF</a>",
      "doi":
          "http://www.journalfilter.com/fw.php?pmid=33215209&pmhash=GaBd3rWj0SvvQ&target=http://dx.doi.org/10.1093/eurheartj/ehaa758",
      "google":
          "http://www.journalfilter.com/fw.php?pmid=33215209&pmhash=GavqUhdxcADdM&target=scholar.google.com/scholar?as_q=he+effect+spironolactone+on+cardiovascular+function+markers+fibrosis+people+at+increased+risk+developing+heart+failure+heart+%27OM&as_sauthors=\"Cleland+JGF\"",
      "pub":
          "http://www.journalfilter.com/fw.php?pmid=33215209&pmhash=GagoiF6/44zqk&target=http://www.ncbi.nlm.nih.gov/pubmed/33215209?dopt=Abstract"
    },
    "star": 0.4646,
    "article_id": "33215209"
  },
  {
    "title":
        "Paradoxical impact of socioeconomic factors on outcome of atrial fibrillation in Europe: trends in incidence and mortality from atrial fibrillation.",
    "postman": "Al-Khayatt BM, Salciccioli JD, Marshall DC, Krahn AD, Shalhoub J, Sikkel MB",
    "contents":
        "<b>Aims</b><br />The aim of this study was to understand the changing trends in atrial fibrillation (AF) incidence and mortality across Europe from 1990 to 2017, and how socioeconomic factors and sex differences play a role.<br /><b>Methods and results</b><br />We performed a temporal analysis of data from the 2017 Global Burden of Disease Database for 20 countries across Europe using Joinpoint regression analysis. Age-adjusted incidence, mortality, and mortality-to-incidence ratios (MIRs) to approximate case fatality rate are presented. Incidence and mortality trends were heterogenous throughout Europe, with Austria, Denmark, and Sweden experiencing peaks in incidence in the middle of the study period. Mortality rates were higher in wealthier countries with the highest being Sweden for both men and women (8.83 and 8.88 per 100 000, respectively) in 2017. MIRs were higher in women in all countries studied, with the disparity increasing the most over time in Germany (43.6% higher in women vs. men in 1990 to 74.5% higher in women in 2017).<br /><b>Conclusion</b><br />AF incidence and mortality across Europe did not show a general trend, but unique patterns for some nations were observed. Higher mortality rates were observed in wealthier countries, potentially secondary to a survivor effect where patients survive long enough to suffer from AF and its complications. Outcomes for women with AF were worse than men, represented by higher MIRs. This suggests that there is widespread healthcare inequality between the sexes across Europe, or that there are biological differences between them in terms of their risk of adverse outcomes from AF.<br /><br />Published on behalf of the European Society of Cardiology. All rights reserved. © The Author(s) 2021. For permissions, please email: journals.permissions@oup.com.",
    "info": "Eur Heart J: 20 Feb 2021; 42:847-857",
    "link": {
      "mainlink":
          "http://www.journalfilter.com/fw.php?pmid=33495788&pmhash=GaBd3rWj0SvvQ&target=http://dx.doi.org/10.1093/eurheartj/ehaa1077",
      "pdf":
          "<a href='http://www.journalfilter.com/fw.php?pmid=33495788&pmhash=GaaKuPsbFhpu.&target=dx.doi.org/10.1093/eurheartj/ehaa1077' target='_blank' title='Direct link to the PDF'>PDF</a>",
      "doi":
          "http://www.journalfilter.com/fw.php?pmid=33495788&pmhash=GaBd3rWj0SvvQ&target=http://dx.doi.org/10.1093/eurheartj/ehaa1077",
      "google":
          "http://www.journalfilter.com/fw.php?pmid=33495788&pmhash=GavqUhdxcADdM&target=scholar.google.com/scholar?as_q=aradoxical+impact+socioeconomic+factors+on+outcome+atrial+fibrillation+Europe+trends+incidence+mortality+from+atrial+fibrillatio&as_sauthors=\"Al-Khayatt+BM\"",
      "pub":
          "http://www.journalfilter.com/fw.php?pmid=33495788&pmhash=GagoiF6/44zqk&target=http://www.ncbi.nlm.nih.gov/pubmed/33495788?dopt=Abstract"
    },
    "star": 0.45705,
    "article_id": "33495788"
  }
];
