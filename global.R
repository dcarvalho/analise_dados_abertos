campos = c(
  'Bolsa Família - Quantidade Famílias'='pbf#qtd_familias_beneficiarias_bolsa_familia',
  'Bolsa Família - Valor repassado (R$)'='pbf#valor_repassado_bolsa_familia',
  'Bolsa Família - Quantidade Benefícios Básicos'='pbf#tot_ben_bas_i',
  'Bolsa Família - Quantidade Benefícios Variáveis'='pbf#tot_ben_bas_var_i',
  'Bolsa Família - Quantidade Benefícios Jovem'='pbf#tot_ben_bvj_i',
  'Bolsa Família - Quantidade Benefícios Nutriz'='pbf#tot_ben_bvn_i',
  'Bolsa Família - Quantidade Benefícios Gestantes'='pbf#tot_ben_bvg_i',
  'Bolsa Família - Quantidade Benefícios Superação Extrema Pobreza'='pbf#tot_ben_bsp_i',
  'BPC por município pagador - Quantidade bpc beneficiário total'='bpc#bpc_ben_i',
  'BPC por município pagador - Quantidade bpc portador deficiência beneficiário'='bpc#bpc_pcd_ben_i',
  'BPC por município pagador - Quantidade bpc idoso beneficiário'='bpc#bpc_idoso_ben_i',
  'BPC por município pagador - Valor bpc portador deficiência'='bpc#bpc_pcd_val_f',
  'BPC por município pagador - valor bpc idoso'='bpc#bpc_idoso_val_f',
  'BPC por município pagador - Valor bpc total'='bpc#bpc_val_f',
  'Cadastro Único - Qtd Famílias'='cadunico#cadunico_tot_fam_i',
  'Cadastro Único - Qtd Pessoas'='cadunico#cadunico_tot_pes_i',
  'Cadastro Único - Qtd Famílias com renda per capita até meio SM'='cadunico#cadunico_tot_fam_rpc_ate_meio_sm_i',
  'Cadastro Único - Qtd Pessoas com renda per capita até meio SM'='cadunico#cadunico_tot_pes_rpc_ate_meio_sm_i',
  'Cadastro Único - Total de famílias em situação de pobreza'='cadunico#cadunico_tot_fam_pob_i',
  'Cadastro Único - Total de pessoas em situação de pobreza'='cadunico#cadunico_tot_pes_pob_i',
  'Cadastro Único - Total de famílias em situação de extrema pobreza'='cadunico#cadunico_tot_fam_ext_pob_i',
  'Cadastro Único - Total de pessoas em situação de extrema pobreza'='cadunico#cadunico_tot_pes_ext_pob_i',
  'Cadastro Único - Total de famílias em situação de pobreza e de extrema pobreza'='cadunico#cadunico_tot_fam_pob_e_ext_pob_i',
  'Cadastro Único - Total de pessoas em situação de pobreza e de extrema pobreza'='cadunico#cadunico_tot_pes_pob_e_ext_pob_i',
  'IBGE - População Estimada'='ibge#populacao_estimada_ibge_ano_i'
)

# cadunico_tot_pes_rpc_ate_meio_sm:: total de pessoas com renda per capita até meio salário mínimo
# cadunico_tot_fam_pob: total de famílias em situação de pobreza
# cadunico_tot_pes_pob: total de pessoas em situação de pobreza
# cadunico_tot_fam_ext_pob: total de famílias em situação de extrema pobreza
# cadunico_tot_pes_ext_pob: total de pessoas em situação de extrema pobreza
# cadunico_tot_fam_pob_e_ext_pob: total de famílias em situação de pobreza e de extrema pobreza
# cadunico_tot_pes_pob_e_ext_pob: total de pessoas em situação de pobreza e de extrema pobreza

monthStart <- function(x) {
    x <- as.POSIXlt(x)
    x$mday <- 1
    as.Date(x)
}

ano_corrente = as.integer(format(Sys.Date(), "%Y"))