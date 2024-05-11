CREATE MATERIALIZED VIEW public.mvw_ativas_churn_general_info AS
AS SELECT base_escolas_geral.cliente,
    base_escolas_geral.data_inauguracao,
    base_escolas_geral.alunos_ativos,
    base_escolas_geral.adesao,
    base_escolas_geral.taxa_de_leitura,
    base_escolas_geral.qtd_msgs_enviadas_por_aluno_por_dia,
    base_escolas_geral.qtd_msgs_recebidas_por_aluno_por_dia,
    'Ativa'::text AS motivo_cancelamento,
    round(((CURRENT_DATE - base_escolas_geral.data_inauguracao) / 30)::double precision) AS meses,
    0 as churn
   FROM base_escolas_geral
UNION ALL
 SELECT base_escolas_churn.cliente,
    base_escolas_churn.data_inauguracao,
    base_escolas_churn.qtd_alunos AS alunos_ativos,
    base_escolas_churn.adesao,
    base_escolas_churn.taxa_de_leitura,
    base_escolas_churn.qtd_msgs_enviadas_por_aluno_por_dia,
    base_escolas_churn.qtd_msgs_recebidas_por_aluno_por_dia,
    base_escolas_churn.motivo_cancelamento,
    round(((base_escolas_churn.data_pedido_cancelamento - base_escolas_churn.data_inauguracao) / 30)::double precision) AS meses,
    1 as churn
   FROM base_escolas_churn;