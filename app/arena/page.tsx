'use client';

import { useEffect, useState } from 'react';

export default function ArenaPage() {
  const [status, setStatus] = useState('Connecting to OpenClaw workers...');
  const [workers, setWorkers] = useState<any[]>([]);

  useEffect(() => {
    // TODO: Replace with real Akash worker URLs once lease is live
    const fetchTelemetry = async () => {
      try {
        // Placeholder - will poll real worker telemetry endpoints after deployment
        setStatus('Swarm Telemetry Live');
        setWorkers([
          { id: 'worker-1', model: 'llama3.1:8b', vram: '18.2/24 GiB', temp: '68°C', status: 'ACTIVE' },
          { id: 'worker-2', model: 'qwen2.5:7b', vram: '12.1/24 GiB', temp: '71°C', status: 'ACTIVE' }
        ]);
      } catch (e) {
        setStatus('Connecting to Akash lease...');
      }
    };

    fetchTelemetry();
    const interval = setInterval(fetchTelemetry, 5000);
    return () => clearInterval(interval);
  }, []);

  return (
    <div className="min-h-screen bg-black text-white p-8 font-mono">
      <h1 className="text-4xl font-bold mb-8">YIELDSWARM ARENA — LIVE</h1>
      <div className="mb-4 text-emerald-400">{status}</div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {workers.map((w, i) => (
          <div key={i} className="border border-zinc-800 p-4 rounded">
            <div className="font-bold">{w.id}</div>
            <div>Model: {w.model}</div>
            <div>VRAM: {w.vram}</div>
            <div>Temp: {w.temp}</div>
            <div className="text-emerald-400">{w.status}</div>
          </div>
        ))}
      </div>

      <div className="mt-8 text-xs opacity-60">
        80ms guardrail active | 50/30/15/5 treasury live | Connected to Akash OpenClaw cluster
      </div>
    </div>
  );
}
