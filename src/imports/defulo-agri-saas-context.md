📌 Contexto do Produto

Crie um SaaS Mobile First chamado DeFulo, focado em gestão de inteligência agrícola para:

Condomínios Agrícolas

Cooperativas

Prefeituras

O sistema deve permitir monitoramento de fazendas, talhões e manejo agrícola, com análise de umidade do solo, clima e histórico de manejo.

O design deve seguir o conceito:

“Almanaque Rural Moderno”

Características:

Alta legibilidade no sol

Ícones semânticos

Cards informativos

Interface simples para uso no campo

Priorização de dados operacionais

🎨 Design System
Paleta de Cores

Primária
Verde Clorofila
#2D5A27

Secundária
Marrom Solo
#4E342E

Alerta Médio
Âmbar
#FF8F00

Alerta Crítico
Vermelho Carmine
#C62828

Background
Off-White
#F5F5F5

Status Ideal
Verde Claro
#66BB6A

Tipografia

Título
Bold / 20–24px

Subtítulo
Medium / 16–18px

Dados numéricos
SemiBold / 18px

Texto comum
Regular / 14px

Componentes

Cards

border-radius: 8px

shadow leve

padding 16px

Botões

altura 48px

radius 8px

FAB (Floating Action Button)

círculo

cor primária

ícone +

📱 Estrutura das Telas
1️⃣ Login / Gatekeeper

Elementos

Logo DeFulo

Campo Email

Campo Senha

Botão Entrar

Link "Esqueci minha senha"

Após login o sistema detecta perfil.

Perfis suportados

Engenheiro Agrônomo

RTV

Produtor Rural

Gestor de Cooperativa

Prefeitura

2️⃣ Dashboard Principal
Header

Selector:

Condomínio Agrícola

Cooperativa

Município

Ícone de notificações

Widget de Status Geral

Card grande contendo:

Total monitorado

1500 ha

Indicadores

85% Conforto hídrico

15% Estresse

Barra visual de status.

Lista de Fazendas

Cards com:

Nome da Fazenda
Nome do Produtor

Badge cultura

🌱 Soja
🌽 Milho
☕ Café

Barra de umidade

Gradiente

Seco → Ideal → Saturado

Rodapé

Engenheiro Agrônomo responsável

3️⃣ Tela Fazenda

Ao clicar no card da fazenda.

Mostrar:

Lista de Talhões

Cada card:

Talhão 04
Área: 50ha
Cultura: Milho Safrinha

Indicador de umidade

Cor dinâmica.

4️⃣ Tela Detalhe do Talhão
Header

Talhão 04

Dados:

Área
Cultura
Data de Plantio

Centro de Monitoramento

Gráfico de linha:

Eixo X

24h

Eixo Y

Umidade do solo

Previsão de chuva

Integração API clima.

Indicador Fenológico

Badge com fase:

Emergência

Desenvolvimento

Floração

Maturação

Timeline de Manejo

Lista vertical de eventos.

Exemplo:

08/03
Irrigação 20mm
Realizado por RTV João

05/03
Adubação
Realizado por Produtor Carlos

02/03
Aplicação de defensivo
Realizado por Engenheiro Agrônomo.

Cada item mostra

data

tipo de manejo

responsável

5️⃣ Cadastro de Talhão

Formulário

Campos

Fazenda (select)

Área em hectares

Cultura

Soja

Milho

Café

Algodão

Outros

Data de plantio

Campo técnico

Limite crítico de umidade

Somente editável por:

Engenheiro Agrônomo.

6️⃣ Registro de Manejo

Acesso pelo FAB +

Opções rápidas

Irrigar
Aplicar insumo
Colher
Registrar chuva

Campos

Quantidade
Observação
Responsável

7️⃣ Relatórios

Tela administrativa.

Filtros

Data

Fazenda

Talhão

RTV

Cultura

Ações

Botão

Gerar PDF

Botão

Exportar CSV

🔄 Fluxos de Navegação

Dashboard
↓
Fazenda
↓
Talhão
↓
Monitoramento + Manejo

FAB
↓
Registrar Evento

⚙️ Estados de Interface

Loading

Skeleton cards.

Sem dados

Mensagem

"Sem registros de manejo."

Estresse hídrico

Card fica laranja

Crítico

Card fica vermelho

📊 Dados Exemplo

Fazenda Santa Helena
Produtor: Carlos Mendes

Talhão 04
Área: 50 ha

Cultura: Milho Safrinha

Plantio: 12/02/2026

📐 Layout

Mobile first

Largura base:

390px

Grid:

8pt spacing system

✅ Resultado esperado da IA

Gerar protótipo completo contendo:

login

dashboard

lista de fazendas

tela de talhão

gráficos

cadastro

relatórios

navegação interativa