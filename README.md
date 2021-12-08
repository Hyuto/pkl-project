# OCEAN Analysis Opini Masyarakat Tentang Kebijakan PPKM Disosial Media Periode Juli - November 2021

![love](https://img.shields.io/badge/Made%20with-🖤-white)
[![R](https://img.shields.io/badge/%20-R%204.0.4-blue?logo=R)](https://www.r-project.org/)

Source code dari laporan PKL dengan judul `OCEAN Analysis Opini Masyarakat Tentang Kebijakan PPKM Disosial Media Periode Juli - November 2021`.

## To Do's

1. Melakukan sedikit EDA ke data secara keseluruhan.
2. Hand Labeling & Filtering Data.
3. Membuat model untuk mengklasifikasikan data text.
4. Membuat Wordcloud (?).

## [Dataset](./data)

Indonesian Twitter dataset dengan topik PPKM bulan Juli - September 2021. Data dapat diakses langsung secara online dengan format link berikut:

`https://raw.githubusercontent.com/Hyuto/pkl-project/master/data/<NAMA FILE>`

## [Notebook](./notebook)

Notebook yang digunakan untuk mengolah data.

1. [`Sampling.Rmd`](./notebook/Sampling.Rmd)

   Notebook yang digunakan untuk melakukan sampling terhadap dataset sehingga data yang akan
   diteliti berjumlah lebih sedikit untuk dilakukan `labelling`.

2. [`Data Preprocessing.Rmd`](./notebook/Data%20Proprocessing.Rmd)

   Notebook yang digunakan untuk melakukan preprocessing terhadap data teks, sehingga data teks
   dapat lebih bersih dan siap untuk dilakukan penelitian.

3. [`Visualization.Rmd`](./notebook/Visualization.Rmd)

   Notebook yang digunakan untuk visualisasi.

## Script

- [`keywords-based-OCEAN.R`](keywords-based-OCEAN.R) : adalah script untuk mencari OCEAN pada data text berdasarkan
  keywords yang telah ditetapkan.

  **Penggunaan**

  ```
  keywords-based-OCEAN.R -p <PATH-DATA>
  ```
