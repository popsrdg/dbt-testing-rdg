CREATE TABLE sap.vbak (
  mandt VARCHAR(3) NOT NULL,
  vbeln VARCHAR(10) NOT NULL,
  vkorg VARCHAR(4),
  vtweg VARCHAR(2),
  spart VARCHAR(2),
  auart VARCHAR(4),
  kalsm VARCHAR(2),
  audat DATE,
  kunnr VARCHAR(10) NOT NULL,
  bstnk VARCHAR(20),
  bstdk DATE,
  bsark VARCHAR(4),
  ktext VARCHAR(25),
  bname VARCHAR(12),
  erdat DATE NOT NULL,
  erzet TIME NOT NULL,
  ernam VARCHAR(12),
  aedat DATE,
  aenam VARCHAR(12),
  vkbur VARCHAR(4),
  vkgrp VARCHAR(3),
  vkbur_text VARCHAR(60),
  vkgrp_text VARCHAR(25),
  spart_text VARCHAR(20),
  auart_text VARCHAR(30)
);


CREATE TABLE sap.vbap (
  mandt VARCHAR(3) NOT NULL,
  vbeln VARCHAR(10) NOT NULL,
  posnr INT NOT NULL,
  matnr VARCHAR(18),
  werks VARCHAR(4),
  lgort VARCHAR(4),
  kwmeng NUMERIC(13,3),
  vrkme VARCHAR(3),
  netpr NUMERIC(13,2),
  waerk VARCHAR(5),
  PRIMARY KEY (mandt, vbeln, posnr)
);
