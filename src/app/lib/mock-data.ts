export interface Fazenda {
  id: string;
  nome: string;
  produtor: string;
  agronomoResponsavel: string;
  areaTotal: number;
  cultura: string;
  statusUmidade: 'seco' | 'ideal' | 'saturado';
  percentualUmidade: number;
  talhoes: Talhao[];
}

export interface Talhao {
  id: string;
  numero: string;
  fazendaId: string;
  area: number;
  cultura: string;
  dataPlantio: string;
  faseFenologica: 'emergencia' | 'desenvolvimento' | 'floracao' | 'maturacao';
  statusUmidade: 'seco' | 'ideal' | 'saturado';
  percentualUmidade: number;
  limiteCriticoUmidade: number;
  eventos: EventoManejo[];
}

export interface EventoManejo {
  id: string;
  data: string;
  tipo: 'irrigacao' | 'adubacao' | 'aplicacao' | 'colheita' | 'plantio';
  descricao: string;
  quantidade?: string;
  responsavel: string;
  cargoResponsavel: 'engenheiro' | 'rtv' | 'produtor';
}

export interface DadosMonitoramento {
  timestamp: string;
  umidade: number;
  previsaoChuva: number;
}

// Mock data
export const mockFazendas: Fazenda[] = [
  {
    id: 'f1',
    nome: 'Fazenda Boa Vista',
    produtor: 'Carlos Silva',
    agronomoResponsavel: 'Dr. Pedro Agrônomo',
    areaTotal: 150,
    cultura: 'Soja',
    statusUmidade: 'ideal',
    percentualUmidade: 75,
    talhoes: [],
  },
  {
    id: 'f2',
    nome: 'Fazenda Santa Maria',
    produtor: 'Ana Costa',
    agronomoResponsavel: 'Dr. Pedro Agrônomo',
    areaTotal: 200,
    cultura: 'Milho',
    statusUmidade: 'seco',
    percentualUmidade: 35,
    talhoes: [],
  },
  {
    id: 'f3',
    nome: 'Fazenda São José',
    produtor: 'Roberto Mendes',
    agronomoResponsavel: 'Dra. Mariana Santos',
    areaTotal: 120,
    cultura: 'Café',
    statusUmidade: 'ideal',
    percentualUmidade: 80,
    talhoes: [],
  },
  {
    id: 'f4',
    nome: 'Fazenda Nova Esperança',
    produtor: 'José Pereira',
    agronomoResponsavel: 'Dr. Pedro Agrônomo',
    areaTotal: 180,
    cultura: 'Soja',
    statusUmidade: 'saturado',
    percentualUmidade: 95,
    talhoes: [],
  },
];

export const mockTalhoes: Talhao[] = [
  {
    id: 't1',
    numero: '01',
    fazendaId: 'f1',
    area: 50,
    cultura: 'Soja',
    dataPlantio: '2026-01-15',
    faseFenologica: 'desenvolvimento',
    statusUmidade: 'ideal',
    percentualUmidade: 75,
    limiteCriticoUmidade: 40,
    eventos: [
      {
        id: 'e1',
        data: '2026-03-08',
        tipo: 'irrigacao',
        descricao: 'Irrigação de reforço',
        quantidade: '20mm',
        responsavel: 'João Técnico',
        cargoResponsavel: 'rtv',
      },
      {
        id: 'e2',
        data: '2026-03-05',
        tipo: 'adubacao',
        descricao: 'Adubação de cobertura NPK',
        quantidade: '150kg/ha',
        responsavel: 'Carlos Silva',
        cargoResponsavel: 'produtor',
      },
    ],
  },
  {
    id: 't2',
    numero: '02',
    fazendaId: 'f1',
    area: 45,
    cultura: 'Soja',
    dataPlantio: '2026-01-20',
    faseFenologica: 'desenvolvimento',
    statusUmidade: 'ideal',
    percentualUmidade: 78,
    limiteCriticoUmidade: 40,
    eventos: [],
  },
  {
    id: 't3',
    numero: '03',
    fazendaId: 'f1',
    area: 55,
    cultura: 'Soja',
    dataPlantio: '2026-01-18',
    faseFenologica: 'floracao',
    statusUmidade: 'ideal',
    percentualUmidade: 72,
    limiteCriticoUmidade: 40,
    eventos: [],
  },
  {
    id: 't4',
    numero: '04',
    fazendaId: 'f2',
    area: 50,
    cultura: 'Milho Safrinha',
    dataPlantio: '2026-02-12',
    faseFenologica: 'emergencia',
    statusUmidade: 'seco',
    percentualUmidade: 35,
    limiteCriticoUmidade: 45,
    eventos: [
      {
        id: 'e3',
        data: '2026-03-07',
        tipo: 'irrigacao',
        descricao: 'Irrigação emergencial',
        quantidade: '25mm',
        responsavel: 'João Técnico',
        cargoResponsavel: 'rtv',
      },
    ],
  },
];

export const mockMonitoramento24h: DadosMonitoramento[] = Array.from({ length: 24 }, (_, i) => ({
  timestamp: `${i.toString().padStart(2, '0')}:00`,
  umidade: 60 + Math.sin(i / 3) * 15 + Math.random() * 5,
  previsaoChuva: Math.random() > 0.7 ? Math.random() * 10 : 0,
}));

export function getTalhoesByFazenda(fazendaId: string): Talhao[] {
  return mockTalhoes.filter(t => t.fazendaId === fazendaId);
}

export function getFazendaById(id: string): Fazenda | undefined {
  return mockFazendas.find(f => f.id === id);
}

export function getTalhaoById(id: string): Talhao | undefined {
  return mockTalhoes.find(t => t.id === id);
}
